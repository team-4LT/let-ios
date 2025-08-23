//  Created by dgsw016 on 5/14/25.
//

import SwiftUI

struct EvaluationViewlast: View {
    @State private var navigateToHome = false
    
    var body: some View {
        ZStack {
            if !navigateToHome {
                VStack(spacing: 0) {
                    Spacer()
                    
                    Text("설문에 참여해 주셔서\n감사합니다.")
                        .font(.system(size: 32).weight(.semibold))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 95)
                        .padding(.horizontal, 20)
                    
                    RedButton(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            navigateToHome = true
                        }
                    }, text: "홈으로")
                    
                    Spacer()
                }
                .padding(.horizontal, 48)
                .transition(.move(edge: .leading))
            }
            
            if navigateToHome {
                NavigationStack {
                    Home()
                }
                .id(UUID()) // 완전히 새로운 NavigationStack으로 강제 리셋
                .transition(.move(edge: .trailing))
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationStack {
        EvaluationViewlast()
    }
}
