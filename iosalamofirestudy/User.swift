//
//  User.swift
//  iosalamofirestudy
//
//  Created by kenan on 27.08.2024.
//

import Foundation


class User : Codable {
    var user_id:String?
    var user_name:String?
    var user_phone:String?
    
    init(user_id: String? = nil, user_name: String? = nil, user_phone: String? = nil) {
        self.user_id = user_id
        self.user_name = user_name
        self.user_phone = user_phone
    }
    
}
