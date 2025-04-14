//
//  WorkOut.swift
//  let
//
//  Created by cher1shRXD on 4/14/25.
//

import SwiftUI

struct WorkOut: View {
    var body: some View {
        VStack{
            HStack{
                Text("운동")
                    .font(.semibold(24))
                Spacer()
            }.frame(height: 50)
            Spacer()
            Text("Hello, World!")
            Spacer()
        }
    }
}

#Preview {
    WorkOut()
}
