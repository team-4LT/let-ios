//
//  RedButto.swift
//  let
//
//  Created by 민덕 on 6/16/25.
//

import SwiftUI

struct RedButton: View {
    let action: () -> Void
    let text: String
    var body: some View {
        Button {
            action()
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .frame(maxWidth: .infinity, maxHeight: 55)
                .foregroundStyle(.red)
                .overlay {
                    Text(text)
                        .foregroundStyle(.white)
                }
        }
        
    }
}
