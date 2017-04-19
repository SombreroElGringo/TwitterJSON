//
//  User.swift
//  Twitter
//
//  Created by Florent on 11/04/2017.
//  Copyright © 2017 SombreroElGringo. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {

    let name: String
    let username: String
    let bioText: String
    let profileImageUrl: String
    
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue
    }
}
