//
//  Home.swift
//  let
//
//  Created by cher1shRXD on 4/14/25.
//

import SwiftUI

struct Home: View {
    @State private var selectedDate: Date = Date()

    private var selectedDateString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "M월 d일 (E)"
        return formatter.string(from: selectedDate)
    }


    var body: some View {
        VStack(spacing: 0) {
            HStack{
                Image("Logo")
                    .resizable()
                    .frame(width: 72, height: 32)
                Spacer()
                 
            }
            .padding(.horizontal, 24)
            .padding(.bottom,27.62)
            ScrollView {
                LazyVStack(spacing: 25) {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: .infinity, height: 93)
                        .foregroundStyle(Color.main)
                        .overlay {
                            HStack {
                                Image("AddPhoto")
                                    .padding(.leading,18)
                                VStack(alignment: .leading, spacing: 1) {
                                    Text("인증사진 찍기")
                                        .font(.semibold(20))
                                    Text("인증사진을 올려주세요!")
                                        .font(.medium(12))
                                }
                                .foregroundStyle(.white)
                                Spacer()
                            }
                        }
                    VStack(spacing: 0) {
                        Rectangle()
                            .frame(width: .infinity, height: 93)
                            .foregroundStyle(.white)
                            .roundedCorners(8, corners:[.topLeft, .topRight])
                            .overlay {
                                Text(selectedDateString)
                                    .font(.semibold(20))
                            }
                        Rectangle()
                            .frame(width: .infinity, height: 45)
                            .foregroundStyle(Color(hex: "F5F5F5"))
                            .overlay {
                                DateCalendar(selectedDate: $selectedDate)
                            }
                        Rectangle()
                            .frame(width: .infinity, height: 258)
                            .foregroundStyle(.white)
                            .overlay {
                                HStack {
                                    VStack(spacing: 25) {
                                        Menu(image: "Morning", time: "아침", menuList: "현미밥, 들깨무채국, 명엽채조림, 닭불고기, 배추김치, 윌미니")
                                        Menu(image: "Lunch", time: "점심", menuList: "현미밥, 들깨무채국, 명엽채조림, 닭불고기, 배추김치, 윌미니")
                                        Menu(image: "Dinner", time: "저녁", menuList: "현미밥, 들깨무채국, 명엽채조림, 닭불고기, 배추김치, 윌미니")
                                    } //MARK: ForEach로 수정피료
                                    .padding(.leading,26)
                                    Spacer()
                                }
                            }
                    }
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: .infinity, height: 214)
                        .foregroundStyle(Color(hex: "FFFFFF"))
                        .overlay {
                            VStack(spacing: 0) {
                                HStack {
                                    Text("운동 추천")
                                        .font(.semibold(20))
                                        .padding(.leading, 22)
                                        .padding(.top, 19.62)
                                    Spacer()
                                }
                                .padding(.bottom, 22.38)
                                ChallangeBox(mission: "달리기 3분", missionDetail: "달리기 3분 뛰세용")
                                Spacer()
                            }
                        }
                }.padding(.horizontal, 24)
            }
        }
    
//        .background(Color(hex: "000001"))
        .background(Color(hex: "F8F8F8"))
    }
}

#Preview {
    Home()
}
