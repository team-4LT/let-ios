//
//  LoginModel.swift
//  beep
//
//  Created by cher1shRXD on 4/2/25.
//

struct LoginModel: Codable {
    let accessToken: String
    let refreshToken: String
}

struct LoginResponse: Codable {
    let data: LoginModel
    let status: Int
    let message : String
}
