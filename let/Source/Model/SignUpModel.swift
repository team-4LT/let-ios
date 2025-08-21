//
//  SignUpModal.swift
//  let
//
//  Created by 민덕 on 6/25/25.
//

import Foundation


struct SignUpModel: Codable {
    let username: String
    let password: String
    let studentId: Int
    let realName: String
}

struct SignUpResponse: Codable {
    let data: SignUpModel
    let status: Int
    let message: String
}


