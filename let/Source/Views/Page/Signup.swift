//
//  Signup.swift
//  let
//
//  Created by 임현우 on 6/11/25.
//

import SwiftUI
import FlexibleKit

struct Signup: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var isLoggingIn: Bool = false
    @FocusState private var isUsernameFocused : Bool
    @FocusState private var isPasswordFocused : Bool
    
    
    
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
                        
                        
                        TextField(text: $username, label: { Text("아이디") })
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(isUsernameFocused ? Color(hex: "FF3939") : Color.grey, lineWidth: 1))
                            .hideKeyBoard()
                            .focused($isUsernameFocused)
                            .tint(Color(hex: "FF3939"))
                            .autocapitalization(.none)
                        
                        SecureField(text: $password, label: { Text("비밀번호") })
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(isPasswordFocused ? Color.init(hex: "#FF3939") : Color.grey, lineWidth: 1))
                            .hideKeyBoard()
                            .focused($isPasswordFocused)
                            .tint(Color(hex: "FF3939"))
                            .autocapitalization(.none)
                        
                        Spacer()
                        
                        Button {
                            isLoggingIn.toggle()
                            UserDefaults.standard.set("accessToken", forKey: "accessToken")
                            print(username, password)
                        } label: {
                            LinearGradient(
                                gradient: Gradient(colors: [.main, .main2]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .roundedCorners(8, corners: [.allCorners])
                            .overlay(HStack{
                                Text("로그인")
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
    }
}

#Preview {
    Signup()
}
