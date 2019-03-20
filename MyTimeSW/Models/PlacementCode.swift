//
//  PlacementCode.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 20/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import Foundation
import SharkORM
import SwiftyJSON

class PlacementCode: SRKObject {
    var createdByID, createdDate, placementCodeId: String?
    var isDeleted: Bool = false
    var lastModifiedByID, lastModifiedDate, name, placementC: String?
    var systemModstamp: String?
    
    enum CodingKeys: String, CodingKey {
        case createdByID = "CreatedById"
        case createdDate = "CreatedDate"
        case placementCodeId = "Id"
        case isDeleted = "IsDeleted"
        case lastModifiedByID = "LastModifiedById"
        case lastModifiedDate = "LastModifiedDate"
        case name = "Name"
        case placementC = "Placement__c"
        case systemModstamp = "SystemModstamp"
    }
    
    override init() {
        super.init()
    }
    
    func fromJSON(json: JSON) -> PlacementCode {
        self.createdByID = json[CodingKeys.createdByID.stringValue].string
        self.createdDate = json[CodingKeys.createdDate.stringValue].string
        self.placementCodeId = json[CodingKeys.placementCodeId.stringValue].string
        self.isDeleted = json[CodingKeys.isDeleted.stringValue].boolValue
        self.lastModifiedByID = json[CodingKeys.lastModifiedByID.stringValue].string
        self.lastModifiedDate = json[CodingKeys.lastModifiedDate.stringValue].string
        self.name = json[CodingKeys.name.stringValue].string
        self.placementC = json[CodingKeys.placementC.stringValue].string
        self.systemModstamp = json[CodingKeys.systemModstamp.stringValue].string
        return self
    }
}
