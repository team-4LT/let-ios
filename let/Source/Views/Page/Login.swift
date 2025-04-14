//
//  Login.swift
//  let
//
//  Created by cher1shRXD on 4/14/25.
//

import SwiftUI
import FlexibleKit

struct Login: View {
    var body: some View {
        ZStack{
            VStack {
                Image("Stars")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 220)
                Spacer()
            }.ignoresSafeArea(.all)
            VStack{
                Spacer()
                VStack(alignment: .leading){
                    Button {
                        UserDefaults.standard.set("accessToken", forKey: "accessToken")
                    } label: {
                        Text("Login")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height - 200)
                .background(Color.white)
                .roundedCorners(20, corners: [.topLeft, .topRight])
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
            
        }
        
        
    }
}

#Preview {
    Login()
}
