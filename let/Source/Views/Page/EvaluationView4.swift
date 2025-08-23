//
//  EvaluationView4.swift
//  LET
//
//  Created by dgsw16 on 5/14/25.
//

import SwiftUI

struct EvaluationView4: View {
    var portions: [String] = [
        "많음", "적당함", "적음"
    ]
    
    @State private var selectedPortion: String? = nil

    var body: some View {
        VStack(spacing: 20) {
            Prograss(percent: 1.0) // 마지막 페이지라고 가정
            
            Spacer()
            
            Text("오늘 급식의 양은\n어떠셨나요?")
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 65)

            VStack(spacing: 15) {
                ForEach(portions, id: \.self) { portion in
                    PortionBox(portion: portion, isSelected: selectedPortion == portion)
                        .onTapGesture {
                            selectedPortion = portion
                        }
                }
            }
            .padding(.horizontal, 48)
            
            Spacer()
            
            // NavigationLink로 변경
            NavigationLink(destination: EvaluationViewlast()
                .navigationBarBackButtonHidden()) {
                Text("완료")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 344, height: 55)
                    .background(selectedPortion != nil ? Color.main : Color.gray)
                    .cornerRadius(12)
            }
            .disabled(selectedPortion == nil)
            .padding(.bottom, 60)
        }
    }
}

#Preview {
    NavigationStack {
        EvaluationView4()
    }
}

struct PortionBox: View {
    var portion: String
    var isSelected: Bool

    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(isSelected ? Color.main : Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.main, lineWidth: 1)
            )
            .frame(maxWidth: .infinity, maxHeight: 55)
            .overlay {
                Text(portion)
                    .font(.headline)
                    .foregroundStyle(isSelected ? .white : Color.main)
            }
    }
}
