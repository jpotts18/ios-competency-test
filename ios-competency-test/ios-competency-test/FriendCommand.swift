//
//  FriendCommand.swift
//  ios-competency-test
//
//  Created by Sam Gubler on 3/27/15.
//  Copyright (c) 2015 Sam Gubler. All rights reserved.
//

import UIKit
import Alamofire

let listOfFriendsURLString =  "http://private-5bdb3-friendmock.apiary-mock.com/friends"

class FriendCommand: NSObject {
    
    class func getListOfFriends() -> [Friend]
    {
        var response: NSURLResponse?
        var error: NSError?
        let urlData = NSURLConnection.sendSynchronousRequest(NSURLRequest(URL: NSURL(string: listOfFriendsURLString)!), returningResponse: &response, error: &error)
        var responseArray = NSJSONSerialization.JSONObjectWithData(urlData!, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSArray
        var friends : [Friend] = []
        for item in responseArray!
        {
            var friend = Friend()
            if let json = item as? NSDictionary
            {
                friend.status = json["status"]? as? String
                friend.available = json["available"]? as? Bool
                friend.img = json["img"]? as? String
                friend.id = json["id"]? as? Int
                friend.firstName = json["first_name"]? as? String
                friend.lastName = json["last_name"]? as? String
                friends.append(friend)
            }
        }
        return friends
    }
}
