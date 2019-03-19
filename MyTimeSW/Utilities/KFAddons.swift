//
//  KFAddons.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 19/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//

import Foundation
import Kingfisher

class TokenPlugin: ImageDownloadRequestModifier {
    let token:String
    
    init(token:String) {
        self.token = token
    }
    
    func modified(for request: URLRequest) -> URLRequest? {
        var request = request
        request.addValue(token, forHTTPHeaderField: "Authorization")
        return request
    }
}
