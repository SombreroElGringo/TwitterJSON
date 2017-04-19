//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Florent on 09/04/2017.
//  Copyright © 2017 SombreroElGringo. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

var numberOfUserBySection: Int = 2

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        
        guard let usersJsonArray = json["users"].array, let tweetsJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid."])
        }
        
        self.users = usersJsonArray.map({ return User(json: $0)})
        self.tweets = tweetsJsonArray.map({ return Tweet(json: $0)})
    }
    
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        print("over")
        print(numberOfUserBySection)
        return numberOfUserBySection //users.count
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    func incrementNumberOfUserBySection() {
        
        if numberOfUserBySection <= users.count {
            numberOfUserBySection = numberOfUserBySection + 2
            print("+2")
            print(numberOfUserBySection)
        }
    }
}
