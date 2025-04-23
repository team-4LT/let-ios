//
//  WorkOut.swift
//  let
//
//  Created by cher1shRXD on 4/14/25.
//

import SwiftUI

struct WorkOut: View {
    @State private var level: Bool = false
    
    var missions = [
        Mission(id: 1, mission: "달리기 3분", missoinDetail: "달리기 3분을 뛰세요"),
        Mission(id: 2, mission: "달리기 5분", missoinDetail: "달리기 5분을 뛰세요"),
        Mission(id: 3, mission: "달리기 7분", missoinDetail: "달리기 7분을 뛰세요"),
        Mission(id: 4, mission: "달리기 10분", missoinDetail: "달리기 10분을 뛰세요"),
        Mission(id: 5, mission: "달리기 30분", missoinDetail: "달리기 30분을 뛰세요"),
    ]
    
    //MARK: 더미미션 나중에 api 받으면 수정행
    
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    Text("운동").font(.semibold(24))
                    Spacer()
                    Button {
                        withAnimation{
                            level.toggle()
                        }
                    } label: {
                        Text("난이도 설정").font(.regular(16))
                            .foregroundStyle(Color(hex: "303030"))
                    }
                }
                .padding(.horizontal, 24)
                ScrollView {
                    LazyVStack {
                        ForEach(missions, id: \.id) { mission in
                            ChallangeBox(
                                mission: mission.mission,
                                missionDetail: mission.missoinDetail
                            )
                        }
                    }
                }
            }
            if level {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                            level = false
                    }
                withAnimation{
                    PopUP()
                        .transition(.move(edge: .bottom))
                }
            }
        }
    }
}

#Preview {
    WorkOut()
}


struct Mission {
    var id: Int
    var mission: String
    var missoinDetail: String
}
