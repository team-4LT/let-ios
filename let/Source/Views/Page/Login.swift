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
        VStack{
            Spacer()
            VStack(alignment: .leading){
                Button {
                    UserDefaults.standard.set("accessToken", forKey: "accessToken")
                } label: {
                    Text("Login")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height - 240)
            .background(Color.white)
            .roundedCorners(20, corners: [.topLeft, .topRight])
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .background(Color.black)
        
    }
}

#Preview {
    Login()
}
