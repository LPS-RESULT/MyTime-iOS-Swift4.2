//
//  MTDefaults.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 18/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import Foundation
import SwiftyJSON

class MTDefaults {
    
    struct UserDetails {
        var username: String
        var accessToken: String
        var instanceUrl: String
        var id: String
        
        init(username: String, accessToken: String, instanceUrl: String, id: String) {
            self.username = username
            self.accessToken = accessToken
            self.instanceUrl = instanceUrl
            self.id = id
        }
        
        init(fromJSON json: JSON, username: String) {
            self.username = username
            self.accessToken = json["access_token"].stringValue
            self.instanceUrl = json["instance_url"].stringValue
            self.id = json["id"].stringValue
        }
    }
    
    static var userDetails: UserDetails? {
        set {
            UserDefaults.standard.set(newValue?.accessToken, forKey: "udAccessToken")
            UserDefaults.standard.set(newValue?.id, forKey: "udId")
            UserDefaults.standard.set(newValue?.username, forKey: "udUsername")
            UserDefaults.standard.set(newValue?.instanceUrl, forKey: "udInstanceUrl")
        }
        get {
            let username: String = UserDefaults.standard.value(forKey: "udUsername") as? String ?? ""
            let accessToken: String = UserDefaults.standard.value(forKey: "udAccessToken") as? String ?? ""
            let instanceUrl: String = UserDefaults.standard.value(forKey: "udInstanceUrl") as? String ?? ""
            let id: String = UserDefaults.standard.value(forKey: "udId") as? String ?? ""
            if (username.isEmpty || accessToken.isEmpty || instanceUrl.isEmpty || id.isEmpty) {
                return nil
            }
            
            let userDetails = UserDetails(username: username, accessToken: accessToken, instanceUrl: instanceUrl, id: id)
            return userDetails
        }
    }
    
}
