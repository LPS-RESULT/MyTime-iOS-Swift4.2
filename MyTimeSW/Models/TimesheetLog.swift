//
//  TimesheetLog.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 19/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import Foundation
import SharkORM
import SwiftyJSON

class TimesheetLog: SRKObject {
    var buyerGeneratedInvoiceC, candidateC, caseC, clientCodeC: String?
    var commentC, createdByID, createdDate, descriptionC: String?
    var employeeC: String?
    var expectedHoursC, friC: Int?
    var holidayNameC, timesheetId, invoiceStatusC: String?
    var isDeleted: Bool = false
    var lastActivityDate, lastModifiedByID, lastModifiedDate, lastReferencedDate: String?
    var lastViewedDate: String?
    var loggedHoursC: Int?
    var lpsManagerC: String?
    var monC: Int?
    var name, ownerID, placementC, quantityC: String?
    var rateTypeC, recordTypeID: String?
    var satC, serviceDeliveryManagerReportingC: Int?
    var statusC: String?
    var sunC: Int?
    var systemModstamp: String?
    var thuC, timesheetHoursC, tueC: Int?
    var unitTypeC: String?
    var utilisationDifferenceC: Int?
    var utilisationC: String?
    var wedC: Int?
    var weekEndDateC: String?
    var x24HoursPassedC: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case buyerGeneratedInvoiceC = "Buyer_Generated_Invoice__c"
        case candidateC = "Candidate__c"
        case caseC = "Case__c"
        case clientCodeC = "Client_Code__c"
        case commentC = "Comment__c"
        case createdByID = "CreatedById"
        case createdDate = "CreatedDate"
        case descriptionC = "Description__c"
        case employeeC = "Employee__c"
        case expectedHoursC = "Expected_Hours__c"
        case friC = "Fri__c"
        case holidayNameC = "Holiday_Name__c"
        case timesheetId = "Id"
        case invoiceStatusC = "InvoiceStatus__c"
        case isDeleted = "IsDeleted"
        case lastActivityDate = "LastActivityDate"
        case lastModifiedByID = "LastModifiedById"
        case lastModifiedDate = "LastModifiedDate"
        case lastReferencedDate = "LastReferencedDate"
        case lastViewedDate = "LastViewedDate"
        case loggedHoursC = "Logged_Hours__c"
        case lpsManagerC = "LPS_Manager__c"
        case monC = "Mon__c"
        case name = "Name"
        case ownerID = "OwnerId"
        case placementC = "Placement__c"
        case quantityC = "Quantity__c"
        case rateTypeC = "Rate_Type__c"
        case recordTypeID = "RecordTypeId"
        case satC = "Sat__c"
        case serviceDeliveryManagerReportingC = "Service_Delivery_Manager_Reporting__c"
        case statusC = "Status__c"
        case sunC = "Sun__c"
        case systemModstamp = "SystemModstamp"
        case thuC = "Thu__c"
        case timesheetHoursC = "Timesheet_Hours__c"
        case tueC = "Tue__c"
        case unitTypeC = "Unit_Type__c"
        case utilisationDifferenceC = "Utilisation_Difference__c"
        case utilisationC = "Utilisation__c"
        case wedC = "Wed__c"
        case weekEndDateC = "Week_End_Date__c"
        case x24HoursPassedC = "X24_Hours_Passed__c"
    }
    
    override init() {
        super.init()
    }
    
    func fromJSON(json: JSON) -> TimesheetLog {
        self.buyerGeneratedInvoiceC = json[CodingKeys.buyerGeneratedInvoiceC.stringValue].string
        self.candidateC = json[CodingKeys.candidateC.stringValue].string
        self.caseC = json[CodingKeys.caseC.stringValue].string
        self.clientCodeC = json[CodingKeys.clientCodeC.stringValue].string
        self.commentC = json[CodingKeys.commentC.stringValue].string
        self.createdByID = json[CodingKeys.createdByID.stringValue].string
        self.createdDate = json[CodingKeys.createdDate.stringValue].string
        self.descriptionC = json[CodingKeys.descriptionC.stringValue].string
        self.employeeC = json[CodingKeys.employeeC.stringValue].string
        self.expectedHoursC = json[CodingKeys.expectedHoursC.stringValue].int
        self.friC = json[CodingKeys.friC.stringValue].int
        self.holidayNameC = json[CodingKeys.holidayNameC.stringValue].string
        self.timesheetId = json[CodingKeys.timesheetId.stringValue].string
        self.invoiceStatusC = json[CodingKeys.invoiceStatusC.stringValue].string
        self.isDeleted = json[CodingKeys.isDeleted.stringValue].boolValue
        self.lastActivityDate = json[CodingKeys.lastActivityDate.stringValue].string
        self.lastModifiedByID = json[CodingKeys.lastModifiedByID.stringValue].string
        self.lastModifiedDate = json[CodingKeys.lastModifiedDate.stringValue].string
        self.lastReferencedDate = json[CodingKeys.lastReferencedDate.stringValue].string
        self.lastViewedDate = json[CodingKeys.lastViewedDate.stringValue].string
        self.loggedHoursC = json[CodingKeys.loggedHoursC.stringValue].int
        self.lpsManagerC = json[CodingKeys.lpsManagerC.stringValue].string
        self.monC = json[CodingKeys.monC.stringValue].int
        self.name = json[CodingKeys.name.stringValue].string
        self.ownerID = json[CodingKeys.ownerID.stringValue].string
        self.placementC = json[CodingKeys.placementC.stringValue].string
        self.quantityC = json[CodingKeys.quantityC.stringValue].string
        self.rateTypeC = json[CodingKeys.rateTypeC.stringValue].string
        self.recordTypeID = json[CodingKeys.recordTypeID.stringValue].string
        self.satC = json[CodingKeys.satC.stringValue].int
        self.serviceDeliveryManagerReportingC = json[CodingKeys.serviceDeliveryManagerReportingC.stringValue].int
        self.statusC = json[CodingKeys.statusC.stringValue].string
        self.sunC = json[CodingKeys.sunC.stringValue].int
        self.systemModstamp = json[CodingKeys.systemModstamp.stringValue].string
        self.thuC = json[CodingKeys.thuC.stringValue].int
        self.timesheetHoursC = json[CodingKeys.timesheetHoursC.stringValue].int
        self.tueC = json[CodingKeys.tueC.stringValue].int
        self.unitTypeC = json[CodingKeys.unitTypeC.stringValue].string
        self.utilisationDifferenceC = json[CodingKeys.utilisationDifferenceC.stringValue].int
        self.utilisationC = json[CodingKeys.utilisationC.stringValue].string
        self.wedC = json[CodingKeys.wedC.stringValue].int
        self.weekEndDateC = json[CodingKeys.weekEndDateC.stringValue].string
        self.x24HoursPassedC = json[CodingKeys.x24HoursPassedC.stringValue].boolValue
        return self
    }
}
