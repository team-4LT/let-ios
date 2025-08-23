//
//  EvaluationView1.swift
//  LET
//
//  Created by dgsw16 on 5/14/25.
//

import SwiftUI

struct EvaluationView1: View {
    @State private var rating = 1
    @State private var navigate = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Prograss(percent: 0.25)

                Spacer()

                Text("오늘의 급식은 어땠나요?")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.bottom, 169)

                HStack(spacing: 5) {
                    ForEach(1...5, id: \.self) { star in
                        Image(systemName: "star.fill")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(star <= rating ? .yellow : .gray)
                            .onTapGesture {
                                rating = star
                            }
                    }
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                // 다음 버튼 추가
                Button(action: {
                    navigate = true
                }) {
                    Text("다음")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 344, height: 55)
                        .background(Color.main)
                        .cornerRadius(12)
                }
                .padding(.bottom, 60)

                .navigationDestination(isPresented: $navigate) {
                    EvaluationView2(rating: rating)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    EvaluationView1()
}

struct Prograss: View {
    var percent: CGFloat
    var body: some View {
        GeometryReader { scale in
            Rectangle()
                .foregroundStyle(Color.main)
                .frame(width: scale.size.width * percent, height: 8)
        }
        .frame(height: 8)
    }
}
