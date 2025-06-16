

import SwiftUI

struct Profile: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack {
                    RoundedRectangle(cornerRadius: 14)
                        .foregroundStyle(.white)
                        .overlay {
                            VStack {
                                VStack {
                                    Image("duck")
                                        .padding(.bottom,18)
                                    Text("임동규")
                                        .font(.system(size: 24).weight(.semibold))
                                        .padding(.bottom,2)
                                    Text("2학년 2반 4번")
                                        .font(.system(size: 20).weight(.regular))
                                }.offset(y:-110)
                                RedButton(action: {
                                    print("logout")
                                }, text: "로그아웃")
                                Spacer()
                            }
                            .padding(.horizontal,24)
                        }
                }
                .frame(height: UIScreen.main.bounds.height - 220)
            }
            .background {
                Image("Starbg")
                    .scaledToFill()
            }
            .ignoresSafeArea(.all)
        }}
}

#Preview {
    Profile()
}
