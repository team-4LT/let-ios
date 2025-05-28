//
//  PopUP.swift
//  let
//
//  Created by 임현우 on 4/21/25.
//

import SwiftUI

struct LevelPopUP: View {
    @State var easy: Bool = true
    @State var medium: Bool = false
    @State var hard: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("난이도 설정")
                    .font(.system(size: 20, weight: .semibold))

                Button(action: {
                    easy = true
                    if easy { medium = false; hard = false }
                }) {
                    Text("초급")
                        .frame(width: 296, height: 47)
                        .foregroundStyle(easy ? Color.white :
                            Color.red)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(easy ? Color.red : Color.white)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 1)
                        )
                }

                Button(action: {
                    medium = true
                    if medium { easy = false; hard = false }
                }) {
                    Text("중급")
                        .frame(width: 296, height: 47)
                        .foregroundStyle(medium ? Color.white :
                            Color.red)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(medium ? Color.red : Color.white)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 1)
                        )
                }
                Button(action: {
                    hard = true
                    if hard { easy = false; medium = false }
                }) {
                    Text("고급")
                        .frame(width: 296, height: 47)
                        .foregroundStyle(hard ? Color.white :
                            Color.red)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(hard ? Color.red : Color.white)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.pink, lineWidth: 1)
                        )
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .frame(width: 372, height: 279)
        }
        .padding()
    }
}

#Preview {
    LevelPopUP()
}
