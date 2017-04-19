//
//  Service.swift
//  Twitter
//
//  Created by Florent on 12/04/2017.
//  Copyright © 2017 SombreroElGringo. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://www.florentpailhes.com")
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error?) -> ()) {
        //route to follow to get the data
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/dev/json/nichijou_tweets.json")
        
        request.perform(withSuccess: { (homeDatasource) in
            print("Successfully fetched our json objects")
            
            completion(homeDatasource, nil)
            
        }) { (err) in
            
            completion(nil, err)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
}


