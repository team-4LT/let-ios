//
//  Menu.swift
//  let
//
//  Created by dgsw16 on 4/16/25.
//

import SwiftUI

struct Menu: View {
    let image : String
    let time : String
    let menuList : String
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 10) {
                Image(image)
                
                Text(time)
                    .font(.medium(16))
            }
            Text(menuList)
                .font(.regular(12))
        }
    }
}

#Preview {
    Menu(image: "Morning", time: "아침", menuList: "현미밥, 들깨무채국, 명엽채조림, 닭불고기, 배추김치, 윌미니")
}
