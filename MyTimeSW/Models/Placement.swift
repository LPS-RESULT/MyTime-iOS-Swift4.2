//
//  Placement.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 20/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//
import Foundation
import SharkORM
import SwiftyJSON

class Placement: SRKObject {
    var activeStaffMemberC: Bool = false
    var affinityEmployeeNumberC, clientLineManagerC, contactIDC, contractNoticePeriodOfferC: String?
    var contractNoticePeriodUnitOfferC, createdByID, createdDate, endDateOfferC: String?
    var expectedLoggedHoursC, placementId: String?
    var internalOrNonBillableJobC: Bool = false
    var isDevared: Bool = false
    var lastActivityDate, lastModifiedByID, lastModifiedDate, lastReferencedDate: String?
    var lastViewedDate, latestTimesheetWeekEndDateCheckC, latestTimesheetWeekEndDateC, locationOfferC: String?
    var lpsExecutiveOwnerC, name: String?
    var payRateOfferC: Int?
    var placementNameC: String?
    var placementTotalHoursC: Int?
    var poNumberC, projectNameOfferC, rateTypeOfferC, rateTypeC: String?
    var recordTypeID, relatedOfferC, soWContractEndDateOfferC, soWContractStartDateOfferC: String?
    var staffTypeC, startDateOfferC, systemModstamp: String?
    var targetWeeklyWorkHours2C: Double?
    var timesheetApproverOfferC, timesheetApproverC: String?
    var totalWeeklyWorkhoursOverC: Double?
    var totalWeeklyWorkhoursUnderC: Double?
    var ts2ExtamsActionButtonsC, ts2ExtamsCommunicationButtonsC, ts2ExtamsControlButtonsC, ts2ExtamsSubstatusC: String?
    var ts2AccountsPayableC, ts2ClientC, ts2CodeC, ts2ContactEmailC: String?
    var ts2ContactPhoneC, ts2ContactC, ts2EmployeeC, ts2EndDateC: String?
    var ts2HiringManagerC, ts2JobC, ts2LocationC, ts2PayRateC: String?
    var ts2StartDateC, ts2StatusC: String?
    var ts2ThirdPartyC: Bool = false
    var workingDaysC: String?
    var placementCodes: [PlacementCode]?
    
    enum CodingKeys: String, CodingKey {
        case activeStaffMemberC = "Active_Staff_Member__c"
        case affinityEmployeeNumberC = "Affinity_Employee_Number__c"
        case clientLineManagerC = "Client_Line_Manager__c"
        case contactIDC = "Contact_ID__c"
        case contractNoticePeriodOfferC = "Contract_Notice_Period_Offer__c"
        case contractNoticePeriodUnitOfferC = "Contract_Notice_Period_Unit_Offer__c"
        case createdByID = "CreatedById"
        case createdDate = "CreatedDate"
        case endDateOfferC = "End_Date_Offer__c"
        case expectedLoggedHoursC = "Expected_Logged_Hours__c"
        case placementId = "Id"
        case internalOrNonBillableJobC = "Internal_or_Non_Billable_Job__c"
        case isDevared = "IsDevared"
        case lastActivityDate = "LastActivityDate"
        case lastModifiedByID = "LastModifiedById"
        case lastModifiedDate = "LastModifiedDate"
        case lastReferencedDate = "LastReferencedDate"
        case lastViewedDate = "LastViewedDate"
        case latestTimesheetWeekEndDateCheckC = "Latest_Timesheet_Week_End_Date_Check__c"
        case latestTimesheetWeekEndDateC = "Latest_Timesheet_Week_End_Date__c"
        case locationOfferC = "Location_Offer__c"
        case lpsExecutiveOwnerC = "LPS_Executive_Owner__c"
        case name = "Name"
        case payRateOfferC = "Pay_Rate_Offer__c"
        case placementNameC = "Placement_Name__c"
        case placementTotalHoursC = "Placement_Total_Hours__c"
        case poNumberC = "PO_Number__c"
        case projectNameOfferC = "Project_Name_Offer__c"
        case rateTypeOfferC = "Rate_Type_Offer__c"
        case rateTypeC = "Rate_Type__c"
        case recordTypeID = "RecordTypeId"
        case relatedOfferC = "Related_Offer__c"
        case soWContractEndDateOfferC = "SoW_Contract_End_Date_Offer__c"
        case soWContractStartDateOfferC = "SoW_Contract_Start_Date_Offer__c"
        case staffTypeC = "Staff_Type__c"
        case startDateOfferC = "Start_Date_Offer__c"
        case systemModstamp = "SystemModstamp"
        case targetWeeklyWorkHours2C = "Target_Weekly_Work_Hours2__c"
        case timesheetApproverOfferC = "Timesheet_Approver_Offer__c"
        case timesheetApproverC = "Timesheet_Approver__c"
        case totalWeeklyWorkhoursOverC = "TotalWeeklyWorkhoursOver__c"
        case totalWeeklyWorkhoursUnderC = "TotalWeeklyWorkhoursUnder__c"
        case ts2ExtamsActionButtonsC = "ts2extams__Action_Buttons__c"
        case ts2ExtamsCommunicationButtonsC = "ts2extams__Communication_Buttons__c"
        case ts2ExtamsControlButtonsC = "ts2extams__Control_Buttons__c"
        case ts2ExtamsSubstatusC = "ts2extams__Substatus__c"
        case ts2AccountsPayableC = "ts2__Accounts_Payable__c"
        case ts2ClientC = "ts2__Client__c"
        case ts2CodeC = "ts2__Code__c"
        case ts2ContactEmailC = "ts2__Contact_Email__c"
        case ts2ContactPhoneC = "ts2__Contact_Phone__c"
        case ts2ContactC = "ts2__Contact__c"
        case ts2EmployeeC = "ts2__Employee__c"
        case ts2EndDateC = "ts2__End_Date__c"
        case ts2HiringManagerC = "ts2__Hiring_Manager__c"
        case ts2JobC = "ts2__Job__c"
        case ts2LocationC = "ts2__Location__c"
        case ts2PayRateC = "ts2__Pay_Rate__c"
        case ts2StartDateC = "ts2__Start_Date__c"
        case ts2StatusC = "ts2__Status__c"
        case ts2ThirdPartyC = "ts2__Third_Party__c"
        case workingDaysC = "Working_Days__c"
    }
    
    override init() {
        super.init()
    }
    
    func fromJSON(json: JSON) -> Placement {
        self.activeStaffMemberC = json[CodingKeys.activeStaffMemberC.stringValue].boolValue
        self.affinityEmployeeNumberC = json[CodingKeys.affinityEmployeeNumberC.stringValue].string
        self.clientLineManagerC = json[CodingKeys.clientLineManagerC.stringValue].string
        self.contactIDC = json[CodingKeys.contactIDC.stringValue].string
        self.contractNoticePeriodOfferC = json[CodingKeys.contractNoticePeriodOfferC.stringValue].string
        self.contractNoticePeriodUnitOfferC = json[CodingKeys.contractNoticePeriodUnitOfferC.stringValue].string
        self.createdByID = json[CodingKeys.createdByID.stringValue].string
        self.createdDate = json[CodingKeys.createdDate.stringValue].string
        self.endDateOfferC = json[CodingKeys.endDateOfferC.stringValue].string
        self.expectedLoggedHoursC = json[CodingKeys.expectedLoggedHoursC.stringValue].string
        self.placementId = json[CodingKeys.placementId.stringValue].string
        self.internalOrNonBillableJobC = json[CodingKeys.internalOrNonBillableJobC.stringValue].boolValue
        self.isDevared = json[CodingKeys.isDevared.stringValue].boolValue
        self.lastActivityDate = json[CodingKeys.lastActivityDate.stringValue].string
        self.lastModifiedByID = json[CodingKeys.lastModifiedByID.stringValue].string
        self.lastModifiedDate = json[CodingKeys.lastModifiedDate.stringValue].string
        self.lastReferencedDate = json[CodingKeys.lastReferencedDate.stringValue].string
        self.lastViewedDate = json[CodingKeys.lastViewedDate.stringValue].string
        self.latestTimesheetWeekEndDateC = json[CodingKeys.latestTimesheetWeekEndDateC.stringValue].string
        self.latestTimesheetWeekEndDateCheckC = json[CodingKeys.latestTimesheetWeekEndDateCheckC.stringValue].string
        self.locationOfferC = json[CodingKeys.locationOfferC.stringValue].string
        self.lpsExecutiveOwnerC = json[CodingKeys.lpsExecutiveOwnerC.stringValue].string
        self.name = json[CodingKeys.name.stringValue].string
        self.payRateOfferC = json[CodingKeys.payRateOfferC.stringValue].int
        self.placementNameC = json[CodingKeys.placementNameC.stringValue].string
        self.placementTotalHoursC = json[CodingKeys.placementTotalHoursC.stringValue].int
        self.poNumberC = json[CodingKeys.poNumberC.stringValue].string
        self.projectNameOfferC = json[CodingKeys.projectNameOfferC.stringValue].string
        self.rateTypeOfferC = json[CodingKeys.rateTypeOfferC.stringValue].string
        self.rateTypeC = json[CodingKeys.rateTypeC.stringValue].string
        self.recordTypeID = json[CodingKeys.recordTypeID.stringValue].string
        self.relatedOfferC = json[CodingKeys.relatedOfferC.stringValue].string
        self.soWContractEndDateOfferC = json[CodingKeys.soWContractEndDateOfferC.stringValue].string
        self.soWContractStartDateOfferC = json[CodingKeys.soWContractStartDateOfferC.stringValue].string
        self.staffTypeC = json[CodingKeys.staffTypeC.stringValue].string
        self.startDateOfferC = json[CodingKeys.startDateOfferC.stringValue].string
        self.systemModstamp = json[CodingKeys.systemModstamp.stringValue].string
        self.targetWeeklyWorkHours2C = json[CodingKeys.targetWeeklyWorkHours2C.stringValue].double
        self.timesheetApproverOfferC = json[CodingKeys.timesheetApproverOfferC.stringValue].string
        self.timesheetApproverC = json[CodingKeys.timesheetApproverC.stringValue].string
        self.totalWeeklyWorkhoursOverC = json[CodingKeys.totalWeeklyWorkhoursOverC.stringValue].double
        self.totalWeeklyWorkhoursUnderC = json[CodingKeys.totalWeeklyWorkhoursUnderC.stringValue].double
        self.ts2ExtamsSubstatusC = json[CodingKeys.ts2ExtamsSubstatusC.stringValue].string
        self.ts2ExtamsActionButtonsC = json[CodingKeys.ts2ExtamsActionButtonsC.stringValue].string
        self.ts2ExtamsControlButtonsC = json[CodingKeys.ts2ExtamsControlButtonsC.stringValue].string
        self.ts2ExtamsCommunicationButtonsC = json[CodingKeys.ts2ExtamsCommunicationButtonsC.stringValue].string
        self.ts2AccountsPayableC = json[CodingKeys.ts2AccountsPayableC.stringValue].string
        self.ts2ClientC = json[CodingKeys.ts2ClientC.stringValue].string
        self.ts2CodeC = json[CodingKeys.ts2CodeC.stringValue].string
        self.ts2ContactEmailC = json[CodingKeys.ts2ContactEmailC.stringValue].string
        self.ts2ContactPhoneC = json[CodingKeys.ts2ContactPhoneC.stringValue].string
        self.ts2ContactC = json[CodingKeys.ts2ContactC.stringValue].string
        self.ts2EmployeeC = json[CodingKeys.ts2EmployeeC.stringValue].string
        self.ts2EndDateC = json[CodingKeys.ts2EndDateC.stringValue].string
        self.ts2HiringManagerC = json[CodingKeys.ts2HiringManagerC.stringValue].string
        self.ts2JobC = json[CodingKeys.ts2JobC.stringValue].string
        self.ts2LocationC = json[CodingKeys.ts2LocationC.stringValue].string
        self.ts2PayRateC = json[CodingKeys.ts2PayRateC.stringValue].string
        self.ts2StartDateC = json[CodingKeys.ts2StartDateC.stringValue].string
        self.ts2StatusC = json[CodingKeys.ts2StatusC.stringValue].string
        self.ts2ThirdPartyC = json[CodingKeys.ts2ThirdPartyC.stringValue].boolValue
        self.workingDaysC = json[CodingKeys.workingDaysC.stringValue].string
        return self
    }
}
