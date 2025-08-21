//
//  ExerciseModel.swift
//  let
//
//  Created by 민덕 on 8/21/25.
//

import Foundation


struct Mission: Identifiable, Decodable {
    let id: Int
    let category: String
    let duration: Int
    let title: String
    let description: String
    let method: String
}

struct MissionListResponse: Decodable {
    let data: [Mission]
    let status: Int
    let message: String
}
