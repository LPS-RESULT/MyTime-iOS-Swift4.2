//
//  MTApi.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 18/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MTApi {
    
    static func login(withUsername username: String, password: String, securityCode: String, result: @escaping (Bool, MTDefaults.UserDetails?) -> Void) {
        let loginUrl = "https://test.salesforce.com/services/oauth2/token?grant_type=password&client_id=cHbOAAKDptMFnPnEWDOSWJwoVZuySMVXthFYXNHqnLLrxlFPRrdSSoDkWnrPOPeAlsAMHwNahaRQvhfFvQROE&client_secret=27037399992987747329&username=\(username)&password=\(password)\(securityCode)"
        request(loginUrl, method: .post).responseJSON { (response) in
            guard let data = response.data else { return }
            do {
                if (response.response?.statusCode == 200) {
                    let responseJson = try JSON(data: data)
                    let userDetails = MTDefaults.UserDetails(fromJSON: responseJson, username: username)
                    result(true, userDetails)
                } else {
                    result(false, nil)
                }
            } catch (_) {
                result(false, nil)
            }
        }
    }
    
    static func getUserDetails(fromUsername username: String, result: @escaping (Bool, UserProfile?) -> Void) {
        guard let userDetails = MTDefaults.userDetails else { print("failed!"); return }
        let userDetailsUrl = "\(userDetails.instanceUrl)/services/data/v44.0/query/?q=SELECT+AboutMe%2CAccountId%2CAddress%2CAlias%2CBadgeText%2CBannerPhotoUrl%2CCallCenterId%2CCity%2CCommunityNickname%2CCompanyName%2CContactId%2CContact_Id__c%2CContact_Record__c%2CCountry%2CCreatedById%2CCreatedDate%2CDelegatedApproverId%2CDepartment%2CDigestFrequency%2CDivision%2CEmail%2CEmailEncodingKey%2CEmailPreferencesAutoBcc%2CEmailPreferencesAutoBccStayInTouch%2CEmailPreferencesStayInTouchReminder%2CEmployeeNumber%2CExtension%2CFax%2CFederationIdentifier%2CFirstName%2CForecastEnabled%2CFullPhotoUrl%2CGeocodeAccuracy%2CId%2CIsActive%2CIsExtIndicatorVisible%2CIsPortalEnabled%2CIsProfilePhotoActive%2CLanguageLocaleKey%2CLastLoginDate%2CLastModifiedById%2CLastModifiedDate%2CLastName%2CLastReferencedDate%2CLastViewedDate%2CLatitude%2CLocaleSidKey%2CLongitude%2CManagerId%2CMediumBannerPhotoUrl%2CMediumPhotoUrl%2CMiddleName%2CMobilePhone%2CName%2COfflinePdaTrialExpirationDate%2COfflineTrialExpirationDate%2COutOfOfficeMessage%2CPhone%2CPortalRole%2CPostalCode%2CReceivesAdminInfoEmails%2CReceivesInfoEmails%2CSenderEmail%2CSenderName%2CSignature%2CSmallBannerPhotoUrl%2CSmallPhotoUrl%2CState%2CStayInTouchNote%2CStayInTouchSignature%2CStayInTouchSubject%2CStreet%2CSuffix%2CSystemModstamp%2CTimeZoneSidKey%2CTitle%2CUsername%2CUserRoleId%2CUserType+FROM+User+where+Username+%3D+%27\(username)%27"
        let headers = ["Authorization": "Bearer \(userDetails.accessToken)"]
        request(userDetailsUrl, method: .get, headers: headers).responseJSON { (response) in
            guard let data = response.data else { return }
            do {
                if (response.response?.statusCode == 200) {
                    let responseJson = try JSON(data: data)
                    if let profileRecord = responseJson["records"].array?.first {
                        let profile = UserProfile().loadFrom(json: profileRecord)
                        result(true, profile)
                    }
                } else {
                    result(false, nil)
                }
            } catch (_) {
                result(false, nil)
            }
        }
    }
    
    static func getTimesheet(forWeekEnd weekEnd:Date, ownerId: String, result: @escaping (Bool, [TimesheetLog]?) -> Void) {
        guard let userDetails = MTDefaults.userDetails else { print("failed!"); return }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.string(from: weekEnd)
        let url = "\(userDetails.instanceUrl)/services/data/v44.0/query/?q=SELECT+Buyer_Generated_Invoice__c%2CCandidate__c%2CCase__c%2CClient_Code__c%2CComment__c%2CCreatedById%2CCreatedDate%2CDescription__c%2CEmployee__c%2CExpected_Hours__c%2CFri__c%2CHoliday_Name__c%2CId%2CInvoiceStatus__c%2CIsDeleted%2CLastActivityDate%2CLastModifiedById%2CLastModifiedDate%2CLastReferencedDate%2CLastViewedDate%2CLogged_Hours__c%2CLPS_Manager__c%2CMon__c%2CName%2COwnerId%2CPlacement__c%2CQuantity__c%2CRate_Type__c%2CRecordTypeId%2CSat__c%2CService_Delivery_Manager_Reporting__c%2CStatus__c%2CSun__c%2CSystemModstamp%2CThu__c%2CTimesheet_Hours__c%2CTue__c%2CUnit_Type__c%2CUtilisation_Difference__c%2CUtilisation__c%2CWed__c%2CWeek_End_Date__c%2CX24_Hours_Passed__c+FROM+Timesheet__c+WHERE+Week_End_Date__c+%3D+\(date)+AND+OwnerId+%3D+%27\(ownerId)%27"
        let headers = ["Authorization": "Bearer \(userDetails.accessToken)"]
        print(url)
        request(url, method: .get, headers: headers).responseJSON { (response) in
            print(response)
            guard let data = response.data else { return }
            do {
                if (response.response?.statusCode == 200) {
                    let responseJson = try JSON(data: data)
                    var timesheets = [TimesheetLog]()
                    responseJson["records"].array?.forEach({ (json) in
                        let timesheet = TimesheetLog().fromJSON(json: json)
                        timesheets.append(timesheet)
                    })
                    result(true, timesheets)
                } else {
                    result(false, nil)
                }
            } catch (_) {
                result(false, nil)
            }
        }
    }
    
    static func getPlacementCodes(result: @escaping (Bool, [PlacementCode]?) -> Void) {
        guard let userDetails = MTDefaults.userDetails else { print("failed!"); return }
        let url = "\(userDetails.instanceUrl)/services/data/v44.0/query/?q=SELECT+CreatedById%2CCreatedDate%2CId%2CIsDeleted%2CLastModifiedById%2CLastModifiedDate%2CName%2CPlacement__c%2CSystemModstamp+FROM+Placement_Code__c"
        print(url)
        let headers = ["Authorization": "Bearer \(userDetails.accessToken)"]
        request(url, method: .get, headers: headers).responseJSON { (response) in
            print(response)
            guard let data = response.data else { return }
            do {
                if (response.response?.statusCode == 200) {
                    let responseJson = try JSON(data: data)
                    var codes = [PlacementCode]()
                    responseJson["records"].array?.forEach({ (json) in
                        let code = PlacementCode().fromJSON(json: json)
                        codes.append(code)
                    })
                    result(true, codes)
                } else {
                    result(false, nil)
                }
            } catch (_) {
                result(false, nil)
            }
        }
    }
    
    static func getPlacements(withContactId contactId: String, result: @escaping (Bool, [Placement]?) -> Void) {
        guard let userDetails = MTDefaults.userDetails else { print("failed!"); return }
        let url = "\(userDetails.instanceUrl)/services/data/v44.0/query/?q=SELECT+Active_Staff_Member__c%2CAffinity_Employee_Number__c%2CClient_Line_Manager__c%2CContact_ID__c%2CContract_Notice_Period_Offer__c%2CContract_Notice_Period_Unit_Offer__c%2CCreatedById%2CCreatedDate%2CEnd_Date_Offer__c%2CExpected_Logged_Hours__c%2CId%2CInternal_or_Non_Billable_Job__c%2CIsDeleted%2CLastActivityDate%2CLastModifiedById%2CLastModifiedDate%2CLastReferencedDate%2CLastViewedDate%2CLatest_Timesheet_Week_End_Date_Check__c%2CLatest_Timesheet_Week_End_Date__c%2CLocation_Offer__c%2CLPS_Executive_Owner__c%2CName%2CPay_Rate_Offer__c%2CPlacement_Name__c%2CPlacement_Total_Hours__c%2CPO_Number__c%2CProject_Name_Offer__c%2CRate_Type_Offer__c%2CRate_Type__c%2CRecordTypeId%2CRelated_Offer__c%2CSoW_Contract_End_Date_Offer__c%2CSoW_Contract_Start_Date_Offer__c%2CStaff_Type__c%2CStart_Date_Offer__c%2CSystemModstamp%2CTarget_Weekly_Work_Hours2__c%2CTimesheet_Approver_Offer__c%2CTimesheet_Approver__c%2CTotalWeeklyWorkhoursOver__c%2CTotalWeeklyWorkhoursUnder__c%2Cts2extams__Action_Buttons__c%2Cts2extams__Communication_Buttons__c%2Cts2extams__Control_Buttons__c%2Cts2extams__Substatus__c%2Cts2__Accounts_Payable__c%2Cts2__Client__c%2Cts2__Code__c%2Cts2__Contact_Email__c%2Cts2__Contact_Phone__c%2Cts2__Contact__c%2Cts2__Employee__c%2Cts2__End_Date__c%2Cts2__Hiring_Manager__c%2Cts2__Job__c%2Cts2__Location__c%2Cts2__Pay_Rate__c%2Cts2__Start_Date__c%2Cts2__Status__c%2Cts2__Third_Party__c%2CWorking_Days__c+FROM+ts2__Placement__c+WHERE+ts2__Employee__c+%3D+%27\(contactId)%27"
        let headers = ["Authorization": "Bearer \(userDetails.accessToken)"]
        print(url)
        request(url, method: .get, headers: headers).responseJSON { (response) in
            print(response)
            guard let data = response.data else { return }
            do {
                if (response.response?.statusCode == 200) {
                    let responseJson = try JSON(data: data)
                    var placements = [Placement]()
                    responseJson["records"].array?.forEach({ (json) in
                        let placement = Placement().fromJSON(json: json)
                        placements.append(placement)
                    })
                    result(true, placements)
                } else {
                    result(false, nil)
                }
            } catch (_) {
                result(false, nil)
            }
        }
    }
}
