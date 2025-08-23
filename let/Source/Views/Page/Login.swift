import SwiftUI
import FlexibleKit
import Moya

struct Login: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var isLoggingIn: Bool = false
    
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    
    @FocusState private var isUsernameFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    
    let provider = MoyaProvider<Api>()
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image("Stars")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4)
                    Spacer()
                }
                .ignoresSafeArea(.all)
                
                VStack {
                    Spacer()
                    VStack(alignment: .center) {
                        Image("Logo")
                            .resizable()
                            .frame(width: 142, height: 60)
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 12)
                        
                        TextField("아이디", text: $username)
                            .autocapitalization(.none)
                            .tint(Color(hex: "FF3939"))
                            .textFieldStyle(CustomTextField(focused: $isUsernameFocused))
                        
                        SecureField(text: $password, label: { Text("비밀번호") })
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(isPasswordFocused ? Color(hex: "FF3939") : Color.grey, lineWidth: 1)
                            )
                            .hideKeyBoard()
                            .focused($isPasswordFocused)
                            .tint(Color(hex: "FF3939"))
                            .autocapitalization(.none)
                        
                        Spacer()
                        
                        Button {
                            login()
                        } label: {
                            LinearGradient(
                                gradient: Gradient(colors: [.main, .main2]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .roundedCorners(8, corners: [.allCorners])
                            .overlay(HStack {
                                Text("로그인")
                                    .font(.medium(18))
                                    .foregroundStyle(Color.white)
                            })
                        }
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        
                        HStack {
                            Text("")
                            NavigationLink {
                                Signup1()
                            } label: {
                                Text("회원가입")
                            }
                        }
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 36)
                        
                        Text("Copyright 2025. ALT All rights reserved.")
                            .font(.system(size: 12, weight: .light))
                            .foregroundStyle(Color.grey)
                    }
                    .padding(.vertical, 48)
                    .padding(.horizontal, 24)
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.8)
                    .background(Color.white)
                    .roundedCorners(20, corners: [.topLeft, .topRight])
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
                .navigationDestination(isPresented: $isLoggingIn) {
                    TabbarView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
        .alert(errorMessage, isPresented: $showError) {
            Button("확인", role: .cancel) {}
        }
    }
    
    func login() {
        print(username, password)
        provider.request(.login(username: username, password: password)) { result in
            switch result {
            case .success(let response):
                if response.statusCode == 200 || response.statusCode == 201 {
                    do{
                        var accessToken = try response.map(LoginResponse.self).data.accessToken
                        print(accessToken)
                        UserDefaults.standard.set(accessToken, forKey: "accessToken")
                        DispatchQueue.main.async {
                            isLoggingIn = true
                        }
                    }catch{
                        DispatchQueue.main.async {
                            errorMessage = "파싱 실패"
                            showError = true
                        }
                    }
                    
                } else if response.statusCode == 401 {
                    DispatchQueue.main.async {
                        errorMessage = "아이디 또는 비밀번호가 잘못되었습니다."
                        showError = true
                    }
                } else {
                    print(errorMessage)
                    DispatchQueue.main.async {
                        errorMessage = "로그인에 실패했습니다. 다시 시도해주세요."
                        showError = true
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    errorMessage = error.localizedDescription
                    showError = true
                }
            }
        }
    }
}

#Preview {
    Login()
}
