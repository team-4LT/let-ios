//
//  Home.swift
//  let
//
//  Created by cher1shRXD on 4/14/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            HStack{
                Image("Logo")
                    .resizable()
                    .frame(width: 72, height: 32)
                Spacer()
            }.frame(height: 50)
            Spacer()
            Text("Hello, World!")
            Spacer()
        }
    }
}

#Preview {
    Home()
}
