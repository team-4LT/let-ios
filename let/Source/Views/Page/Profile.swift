//
//  Profile.swift
//  let
//
//  Created by cher1shRXD on 4/14/25.
//

import SwiftUI

struct Profile: View {
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
                        UserDefaults.standard.removeObject(forKey: "accessToken")
                    } label: {
                        Text("Logout")
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
    Profile()
}
