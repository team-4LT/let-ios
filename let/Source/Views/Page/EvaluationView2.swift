//
//  EvaluationView2.swift
//  LET
//
//  Created by dgsw07 on 5/14/25.
//

import SwiftUI

import SwiftUI

struct EvaluationView2: View {
    var rating: Int
    var menus: [String] = [
        "북성로 불고기", "김치찌개", "된장찌개", "치킨", "피자", "김치"
    ]
    
    @State private var selectedMenu: String? = nil
    @State private var goToNext = false

    var body: some View {
        NavigationView {
            VStack {
                Prograss(percent: 0.66)
                
                VStack(spacing: 0) {
                    Text("가장 맛있었던\n급식은 무엇인가요?")
                        .frame(height: 50)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 65)
                        .padding(.top, 90)

                    ForEach(menus, id: \.self) { menu in
                        MenuBox(menu: menu, isSelected: selectedMenu == menu)
                            .padding(.bottom, 15)
                            .onTapGesture {
                                selectedMenu = menu
                                goToNext = true
                            }
                    }

                    Spacer()
                    
                
                    NavigationLink(
                        destination: EvaluationView3().navigationBarBackButtonHidden(),
                        isActive: $goToNext
                    ) {
                        EmptyView()
                    }
                }
                .padding(.horizontal, 48)
            }
        }
    }
}

#Preview {
    EvaluationView2(rating: 1)
}




