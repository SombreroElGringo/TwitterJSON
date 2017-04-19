//
//  Tweet.swift
//  Twitter
//
//  Created by Florent on 12/04/2017.
//  Copyright © 2017 SombreroElGringo. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
