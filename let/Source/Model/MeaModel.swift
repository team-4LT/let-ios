//
//  MeaModel.swift
//  let
//
//  Created by 민덕 on 6/25/25.
//

import Foundation

struct MealResponse: Decodable, Identifiable {
    let mealId: Int
    let mealDate: Date
    let mealType: String
    let calorie: Double
    let menus: [MenuItem]

    var id: Int { mealId } 
}

struct MenuItem: Decodable {
    let menuId: Int
    let menuName: String
}

struct MealListResponse: Decodable {
    let data: [MealResponse]?
    let status: Int
    let message: String
}



