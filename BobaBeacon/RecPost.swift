//
//  RecPost.swift
//  BobaBeacon
//
//  Created by Kodo on 8/2/17.
//  Copyright © 2017 The Girl Code. All rights reserved.
//

import UIKit
import FirebaseDatabase.FIRDataSnapshot

class RecPost {
    var key: String?
    let drink: String
    let location: String
    let recommendation: String
    let creationDate: Date
    var likeCount: Int
    let recPost: String
    let poster: User
    var isLiked = false
    
    
    var dictValue: [String : Any] {
        let createdAgo = creationDate.timeIntervalSince1970
        let userDict = ["uid" : poster.uid, "username" : poster.username]
        return ["drink" : drink,
                "location" : location,
                "recommendation" : recommendation,
                "created_at" : createdAgo,
                "like_count": likeCount,
                "type_of_post": recPost,
                "poster": userDict]
    }
    
    init(drink: String, location: String, recommendation: String) {
        self.drink = drink
        self.location = location
        self.recommendation = recommendation
        self.creationDate = Date()
        self.likeCount = 0
        self.recPost = "recommendation"
        self.poster = User.current
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let drink = dict["drink"] as? String,
            let location = dict["location"] as? String,
            let recommendation = dict["recommendation"] as? String,
            let createdAgo = dict["created_at"] as? TimeInterval,
            let likeCount = dict["like_count"] as? Int,
            let recPost = dict["type_of_post"] as? String,
            let userDict = dict["poster"] as? [String : Any],
            let uid = userDict["uid"] as? String,
            let username = userDict["username"] as? String
            else { return nil }
        
        self.key = snapshot.key
        self.drink = drink
        self.location = location
        self.recommendation = recommendation
        self.creationDate = Date(timeIntervalSince1970: createdAgo)
        self.likeCount = likeCount
        self.recPost = recPost
        self.poster = User(uid: uid, username: username)
    }
    
    
    
    
}