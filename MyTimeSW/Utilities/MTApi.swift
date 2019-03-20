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
        let headers = ["Authorization": "Bearer \(userDetails.accessToken)"]
        print(url)
        request(url, method: .get, headers: headers).responseJSON { (response) in
            print(response)
            guard let data = response.data else { return }
            do {
                if (response.response?.statusCode == 200) {
                    let responseJson = try JSON(data: data)
                    var codes = [PlacementCode]()
                    responseJson["records"].array?.forEach({ (json) in
                        let codes = PlacementCode().fromJSON(json: json)
                        timesheets.append(timesheet)
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
}
