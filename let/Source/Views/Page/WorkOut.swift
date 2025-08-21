//
//  WorkOut.swift
//  let
//
//  Created by cher1shRXD on 4/14/25.
//

import SwiftUI
import Moya

struct WorkOut: View {
    @State private var level: Bool = false
    @State private var missions: [Mission] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    let provider = MoyaProvider<Api>()
    
    func fetchMissions() {
        isLoading = true
        provider.request(.getExercises) { result in
            switch result {
            case .success(let response):
                print(String(data: response.data, encoding: .utf8) ?? "nil") // <- 실제 JSON 확인
                do {
                    let decoded = try JSONDecoder().decode(MissionListResponse.self, from: response.data)
                    DispatchQueue.main.async {
                        self.missions = decoded.data
                    }
                } catch {
                    print("파싱 실패: \(error)")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("운동").font(.semibold(24))
                    Spacer()
                    Button {
                        withAnimation {
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
                        ForEach(missions) { mission in
                            ChallangeBox(
                                mission: mission.title,
                                missionDetail: mission.method
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
                withAnimation {
                    LevelPopUP()
                        .transition(.move(edge: .bottom))
                }
            }
        }
        .onAppear {
            fetchMissions()
        }
    }
}


#Preview {
    WorkOut()
}

