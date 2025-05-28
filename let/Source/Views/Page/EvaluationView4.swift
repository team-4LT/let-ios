
//  Created by dgsw07 on 5/14/25.
//

import SwiftUI


struct EvaluationView4: View {
    
    
    var body: some View {
        VStack(spacing: 0) {
            Text("설문에 참여해 주셔서\n감사합니다.")
                .font(.system(size: 32).weight(.semibold))
                .multilineTextAlignment(.center)
                .padding(.bottom, 95)
            ToHomeButton ()
        }
        .padding(.horizontal, 48)
    }
}
#Preview {
    EvaluationView4()
}
struct ToHomeButton: View {
    
    
    var body: some View {
        Button{print("홈으로")} label: {
            
            
            RoundedRectangle(cornerRadius: 8)
                .frame(maxWidth: .infinity, maxHeight: 55)
                .foregroundStyle(.red)
                .overlay {
                    Text("홈으로")
                        .foregroundStyle(.white)
                }
        }
    }
}
