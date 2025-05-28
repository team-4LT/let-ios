//
//  RoutinePopUP.swift
//  let
//
//  Created by 임현우 on 5/13/25.
//

import SwiftUI

struct RoutinePopUP: View {
    var body: some View {
        ZStack{
            VStack{
                Text("축하해요!🎉")
                    .foregroundStyle(Color(.gray))
                Text("운동루틴을 완료했어요")
                    .font(.system(size: 20, weight: .semibold))
//                Text("총 \(time)동안")
                Text("뛰었어요")
                Button(action: {
                }) {
                    Text("확인")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 298, height: 47)
                        .foregroundStyle(Color(.white))
                        .background(Color(.red))
                        .cornerRadius(8)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .frame(width: 372, height: 279)
        }
    }
}

#Preview {
    RoutinePopUP()
}
