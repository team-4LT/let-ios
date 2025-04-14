//
//  Color.swift
//  beep
//
//  Created by cher1shRXD on 3/29/25.
//

import SwiftUI

extension Color {
    static let main = Color(hex: "FF3939")
    static let main2 = Color(hex: "FE6B4B")
    static let main3 = Color(hex: "FE8856")
    static let grey = Color(hex: "DBDBDB")
    static let placeholder = Color(hex: "000000").opacity(0.5)
    static let black = Color(hex: "303030")
    static let bg = Color(hex: "F8F8F8")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
