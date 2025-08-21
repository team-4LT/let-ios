//
//  Signup.swift
//  let
//
//  Created by 임현우 on 6/11/25.
//

import SwiftUI
import FlexibleKit

struct Signup1: View {
    @State var realName: String = ""
    @State var schoolNum: String = ""
    @State var schoolID: String = ""
    @State var isLoggingIn: Bool = false
    @FocusState private var isRealNameocused : Bool
    @FocusState private var isSchoolNumFocused : Bool
    @FocusState private var isSchoolIDFocused : Bool
    
    
    
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
                        
                        
                       TextField("이름을 입력하세요",text: $realName)
                            .autocapitalization(.none)
                            .tint(Color(hex: "FF3939"))
                            .textFieldStyle(CustomTextField(focused: $isRealNameocused))
                        TextField("학번을 입력하세요",text: $schoolNum)
                            .autocapitalization(.none)
                             .tint(Color(hex: "FF3939"))
                             .textFieldStyle(CustomTextField(focused: $isSchoolNumFocused))
                        TextField("학교ID를 입력하세요",text: $schoolID)
                            .autocapitalization(.none)
                             .tint(Color(hex: "FF3939"))
                             .textFieldStyle(CustomTextField(focused: $isSchoolIDFocused))
                        
                      
                        Spacer()
                        
                        Button {
                            isLoggingIn.toggle()
                            UserDefaults.standard.set("accessToken", forKey: "accessToken")
                            
                        } label: {
                            LinearGradient(
                                gradient: Gradient(colors: [.main, .main2]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .roundedCorners(8, corners: [.allCorners])
                            .overlay(HStack{
                                Text("다음")
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
                    Signup2(realName: realName,
                             studentId: schoolNum,
                             schoolId: Int(schoolID) ?? 0)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    Signup1()
}
