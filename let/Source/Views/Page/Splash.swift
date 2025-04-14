//
//  Splash.swift
//  beep
//
//  Created by cher1shRXD on 4/3/25.
//

import SwiftUI

struct Splash: View {
    var body: some View {
        VStack(alignment: .center, spacing: 16){
            Spacer()
            Image("Logo")
                .resizable()
                .frame(width: 142, height: 60)
            Spacer()
            Text("Copyright 2025. ALT All rights reserved.")
                .font(.system(size: 12, weight: .light))
                .foregroundStyle(Color.grey)
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundStyle(.white)
    }
}

#Preview {
    Splash()
}
