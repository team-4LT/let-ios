import SwiftUI
import Moya

struct Profile: View {
    @AppStorage("accessToken") var accessToken: String?
    
    @State private var isLoggedOut: Bool = false
    @State private var user: User? = nil
    
    let provider = MoyaProvider<Api>(plugins: [NetworkLoggerPlugin()])
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    VStack {
                        Rectangle()
                            .roundedCorners(20, corners: [.topLeft, .topRight])
                            .foregroundStyle(.white)
                            .overlay {
                                VStack {
                                    VStack {
                                        Image("duck")
                                            .padding(.bottom, 18)
                                        Text(user?.realName ?? "로딩중...")
                                            .font(.system(size: 24).weight(.semibold))
                                            .padding(.bottom, 2)
                                        if let studentId = user?.studentId {
                                            let grade = studentId / 1000
                                            let cls = (studentId % 1000) / 100
                                            let number = studentId % 100
                                            Text("\(grade)학년 \(cls)반 \(number)번")
                                                .font(.system(size: 20).weight(.regular))
                                        }
                                    }
                                    .offset(y: -110)
                                    
                                    RedButton(action: {
                                        logout()
                                    }, text: "로그아웃")
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 24)
                            }
                    }
                    .frame(height: UIScreen.main.bounds.height - 220)
                }
                .background {
                    Image("Starbg")
                        .scaledToFill()
                }
                .ignoresSafeArea(.all)
            }
            .navigationDestination(isPresented: $isLoggedOut) {
                Login()
                    .navigationBarBackButtonHidden(true)
            }
            .onAppear {
                fetchUser()
            }
        }
    }
    
    func fetchUser() {
        guard let token = accessToken else { return }
        
        let authPlugin = AccessTokenPlugin { _ in token }
        let provider = MoyaProvider<Api>(plugins: [authPlugin, NetworkLoggerPlugin()])
        
        provider.request(.getMe) { result in
            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONDecoder().decode(UserResponse.self, from: response.data)
                    self.user = decoded.data
                } catch {
                    print("디코딩 실패:", error)
                }
            case .failure(let error):
                print("네트워크 실패:", error)
            }
        }
    }
    
    func logout() {
        accessToken = nil
        print("로그아웃 완료 토큰 삭제")
        isLoggedOut = true
    }
}

#Preview {
    Profile()
        .onAppear {
            UserDefaults.standard.set(
                "eyJ0eXAiOiJBQ0NFU1MiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0amFsc2VqciIsImlhdCI6MTc1NTA3MTYyMCwiZXhwIjoxNzU1MDc1MjIwfQ.08o7kc-xMizgHlt407yY4w4lfkKJa89OXDVooSz6N3b9kgMdfTE32IDMQL-KUsnI8lWTA7xq8wgCaRQHUEfCwA",
                forKey: "accessToken"
            )
        }
}
