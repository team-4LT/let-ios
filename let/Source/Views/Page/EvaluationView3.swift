//
//  EvaluationView3.swift
//  LET
//
//  Created by dgsw16 on 5/14/25.
//

import SwiftUI

struct EvaluationView3: View {
    var menus: [String] = [
        "북성로 불고기", "김치찌개", "된장찌개", "치킨", "피자", "김치"
    ]
    
    @State private var selectedMenu: String? = nil
    @State private var goToNext = false

    var body: some View {
        VStack(spacing: 20) {
            Prograss(percent: 0.75)
            
            Spacer()
            
            Text("가장 맛없었던\n급식은 무엇인가요?")
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
                Text("완료")
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
                EvaluationView4()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    NavigationStack {
        EvaluationView3()
    }
}

struct MenuBox: View {
    var menu: String
    var isSelected: Bool

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(isSelected ? Color.red : Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.red, lineWidth: 1)
            )
            .frame(maxWidth: .infinity, maxHeight: 55)
            .overlay {
                Text(menu)
                    .foregroundStyle(isSelected ? .white : .red)
            }
    }
}
