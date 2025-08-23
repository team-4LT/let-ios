//
//  EvaluationView2.swift
//  LET
//
//  Created by dgsw16 on 5/14/25.
//

import SwiftUI

struct EvaluationView2: View {
    var rating: Int
    var menus: [String] = [
        "북성로 불고기", "김치찌개", "된장찌개", "치킨", "피자", "김치"
    ]
    
    @State private var selectedMenu: String? = nil
    @State private var goToNext = false

    var body: some View {
            VStack(spacing: 20) {
                Prograss(percent: 0.5)
                
                Spacer()
                
                Text("가장 맛있었던\n급식은 무엇인가요?")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 65)

                VStack(spacing: 15) {
                    ForEach(menus, id: \.self) { menu in
                        MenuBox(menu: menu, isSelected: selectedMenu == menu)
                            .onTapGesture {
                                selectedMenu = menu
                            }
                    }
                }
                .padding(.horizontal, 48)
                
                Spacer()
                
                // 다음 버튼 추가
                Button(action: {
                    goToNext = true
                }) {
                    Text("다음")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 344, height: 55)
                        .background(selectedMenu != nil ? Color.main : Color.gray)
                        .cornerRadius(12)
                }
                .disabled(selectedMenu == nil)
                .padding(.bottom, 60)
                
                .navigationDestination(isPresented: $goToNext) {
                    EvaluationView3()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }


#Preview {
    EvaluationView2(rating: 1)
}
