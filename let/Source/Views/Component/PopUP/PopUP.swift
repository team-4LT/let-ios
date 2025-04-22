//
//  PopUP.swift
//  let
//
//  Created by 임현우 on 4/21/25.
//

import SwiftUI

struct PopUP: View {
    @State var easy: Bool = false
    @State var medium: Bool = false
    @State var hard: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("난이도 설정")
                    .font(.system(size: 20, weight: .semibold))

                Button(action: {
                    easy.toggle()
                    if easy { medium = false; hard = false }
                }) {
                    Text("초급")
                        .frame(width: 296, height: 47)
                        .foregroundColor(.white)
                        .background(easy ? Color.red : Color.gray.opacity(0.3))
                        .cornerRadius(10)
                }

                Button(action: {
                    medium.toggle()
                    if medium { easy = false; hard = false }
                }) {
                    Text("중급")
                        .frame(width: 296, height: 47)
                        .foregroundColor(.white)
                        .background(medium ? Color.red : Color.gray.opacity(0.3))
                        .cornerRadius(10)
                }
                Button(action: {
                    hard.toggle()
                    if hard { easy = false; medium = false }
                }) {
                    Text("고급")
                        .frame(width: 296, height: 47)
                        .foregroundColor(.white)
                        .background(hard ? Color.red : Color.gray.opacity(0.3))
                        .cornerRadius(10)
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
    PopUP()
}
