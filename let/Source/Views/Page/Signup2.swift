//
//  Signup.swift
//  let
//
//  Created by 임현우 on 6/11/25.
//

import SwiftUI
import FlexibleKit
import Moya

struct Signup2: View {
    
    let realName: String
    let studentId: String
    let schoolId: Int
    @State var username: String = ""
    @State var password: String = ""
    @State var passwordCheck: String = ""
    @State var isLoggingIn: Bool = false
    @State var showError: Bool = false
    @State var errorMessage: String = ""
    @FocusState private var isUsernameFocused : Bool
    @FocusState private var isPasswordFocused : Bool
    @FocusState private var isPasswordCheckFocused : Bool
    
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack {
                    Image("Stars")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4)
                    Spacer()
                    
                }.ignoresSafeArea(.all)
                VStack{
                    Spacer()
                    VStack(alignment: .center){
                        Image("Logo")
                            .resizable()
                            .frame(width: 142, height: 60)
                        
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: 12)
                        
                        
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isUsernameFocused ? Color(hex: "FF3939") : Color.grey, lineWidth: 1)
                            .frame(height: 69)
                            .hideKeyBoard()
                        
                        
                            .overlay {
                                HStack {
                                    TextField("아이디를 입력하세요",text: $username)
                                        .autocapitalization(.none)
                                        .padding()
                                        .tint(Color(hex: "FF3939"))
                                        .focused($isUsernameFocused)
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(Color(hex: "#DBDBDB"))
                                        .frame(width: 67, height: 37, alignment: .center)
                                        .overlay {
                                            Text("중복확인")
                                                .font(.medium(12))
                                                .foregroundStyle(.white)
                                        }
                                }
                                .padding(.trailing,13)
                            }
                        TextField("비밀번호를 입력하세요",text: $password)
                            .autocapitalization(.none)
                            .tint(Color(hex: "FF3939"))
                            .textFieldStyle(CustomTextField(focused: $isPasswordFocused))
                        TextField("비밀번호를 재입력하세요",text: $passwordCheck)
                            .autocapitalization(.none)
                            .tint(Color(hex: "FF3939"))
                            .textFieldStyle(CustomTextField(focused: $isPasswordCheckFocused))
                        
                        
                        Spacer()
                        
                        Button {
                            let provider = MoyaProvider<Api>()
                            provider.request(.signup(
                                username: username,
                                password: password,
                                studentId: studentId,
                                realName: realName,
                                schoolId: schoolId
                            )) { result in
                                switch result {
                                case .success(let response):
                                    if response.statusCode == 200 || response.statusCode == 201 {
                                        print("회원가입 성공:", response.statusCode)
                                        UserDefaults.standard.set("accessToken", forKey: "accessToken")
                                        DispatchQueue.main.async {
                                            isLoggingIn = true 
                                        }
                                    } else if response.statusCode == 409 {
                                        DispatchQueue.main.async {
                                            errorMessage = "이미 존재하는 아이디입니다. 다른 아이디를 사용하세요."
                                            showError = true
                                        }
                                    } else {
                                        DispatchQueue.main.async {
                                            errorMessage = "회원가입에 실패했습니다. 다시 시도해주세요."
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
                        } label: {
                            LinearGradient(
                                gradient: Gradient(colors: [.main, .main2]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .roundedCorners(8, corners: [.allCorners])
                            .overlay(HStack{
                                Text("회원가입")
                                    .font(.medium(18))
                                    .foregroundStyle(Color.white)
                            })
                        }.frame(maxWidth: .infinity, maxHeight: 50)
                        
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
        .alert("에러", isPresented: $showError) {
            Button("확인", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
    }
}
