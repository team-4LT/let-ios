//
//  ChallangeBox.swift
//  let
//
//  Created by dgsw16 on 4/16/25.
//

import SwiftUI

struct ChallangeBox: View {
    let mission: String
    let missionDetail: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("MissionBG")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width * 0.9, height: 85)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.black.opacity(0.3))
                    .frame(width: geo.size.width * 0.9, height: 85)
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(mission).font(.system(size: 20, weight: .medium))
                    Text(missionDetail).font(.system(size: 12, weight: .light))
                }
                .padding(.leading, geo.size.width * 0.11)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(height: 85)
    }
}

#Preview {
    ChallangeBox(mission: "달리기 10분 뛰기", missionDetail: "달리기 10분 뛰십시오")


//    Home()
}
