//
//  EvaluationView1.swift
//  LET
//
//  Created by dgsw16 on 5/14/25.
//

import SwiftUI

import SwiftUI

struct EvaluationView1: View {
    @State private var rating = 1
    @State private var navigate = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Prograss(percent: 0.33)

                Spacer()

                Text("오늘의 급식은 어땠나요?")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.bottom, 100)

                HStack(spacing: 5) {
                    ForEach(1...5, id: \.self) { star in
                        Image(systemName: "star.fill")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(star <= rating ? .yellow : .gray)
.onTapGesture {
                                rating = star
                                navigate = true
                            }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 120)

                Spacer()

                NavigationLink("", destination: EvaluationView2(rating: rating).navigationBarBackButtonHidden(), isActive: $navigate)
                    .opacity(0)
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
                .frame(width: scale.size.width * percent,height: 8)
        }
        .frame(height: 8)
    }
    
}
