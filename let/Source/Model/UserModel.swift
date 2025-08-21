//
//  UserModel.swift
//  let
//
//  Created by 민덕 on 8/13/25.
//

import Foundation

struct User : Codable {
    let userId : Int
    let username : String
    let studentId : Int
    let realName : String
}

struct UserResponse : Codable {
    let data : User
    let status : Int
    let message : String
}

