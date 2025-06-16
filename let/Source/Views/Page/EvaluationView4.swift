
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
            RedButton(action: {
                print("홈으로")
            }, text: "홈으로")
        }
        .padding(.horizontal, 48)
    }
}
#Preview {
    EvaluationView4()
}

