//
//  Home.swift
//  let
//
//  Created by cher1shRXD on 4/14/25.
//

import SwiftUI
import Moya

struct Home: View {
    @State private var check: Bool = false
    @State private var selectedDate: Date = Date()
    @State private var meals: [MealResponse] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    let provider = MoyaProvider<Api>()
    
    func fetchMeal(for date: Date) {
        isLoading = true
        errorMessage = nil
        
        provider.request(.getTodayMeal(today: date)) { result in
            isLoading = false
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
                    formatter.locale = Locale(identifier: "en_US_POSIX")
                    decoder.dateDecodingStrategy = .formatted(formatter)

                    let decoded = try decoder.decode(MealListResponse.self, from: response.data)

                    DispatchQueue.main.async {
                        let order: [String: Int] = ["조식": 0, "중식": 1, "석식": 2]
                        meals = (decoded.data ?? []).sorted {
                            (order[$0.mealType] ?? 99) < (order[$1.mealType] ?? 99)
                        }
                        print("meal 개수: \(meals.count)")
                    }
                    print("원본 응답: \(String(data: response.data, encoding: .utf8) ?? "nil")")
                } catch {
                    print("원본 응답: \(String(data: response.data, encoding: .utf8) ?? "nil")")
                    print("파싱 실패: \(error)")
                    errorMessage = "데이터 파싱 실패: \(error.localizedDescription)"
                }

            case .failure(let error):
                errorMessage = "네트워크 오류: \(error.localizedDescription)"
            }
        }
    }
    
    
    private var selectedDateString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "M월 d일 (E)"
        return formatter.string(from: selectedDate)
    }
    
    func imageForMealType(_ type: String) -> String {
        switch type {
        case "조식": return "Morning"
        case "중식": return "Lunch"
        case "석식": return "Dinner"
        default: return "Lunch"
        }
    }
    
    var mealListView: some View {
        VStack(spacing: 25) {
            ForEach(meals) { meal in
                Menu(
                    image: imageForMealType(meal.mealType),
                    time: meal.mealType,
                    menuList: meal.menus.map { $0.menuName }.joined(separator: ", ")
                )
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.leading, 26)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var emptyText: some View {
        Text("급식이 없습니다.")
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
                        .frame(maxWidth: .infinity, minHeight: 93)
                        .foregroundStyle(Color.main)
                        .overlay {
                            HStack {
                                Button(action: {
                                    check.toggle()
                                }) {
                                    Image("check")
                                        .resizable()
                                        .edgesIgnoringSafeArea(.all)
                                        .frame(width: 24, height: 24)
                                        .foregroundStyle(.white)
                                        .padding(.leading,18)
                                    VStack(alignment: .leading, spacing: 1) {
                                        Text("출석체크 하기")
                                            .font(.semibold(20))
                                        Text("NFC태그를 찍어주세요!")
                                            .font(.medium(12))
                                    }
                                    .foregroundStyle(.white)
                                    Spacer()
                                }
                            }
                        }
                    VStack(spacing: 0) {
                        Rectangle()
                            .frame(maxWidth: .infinity, minHeight: 93)
                            .foregroundStyle(.white)
                            .roundedCorners(8, corners:[.topLeft, .topRight])
                            .overlay {
                                Text(selectedDateString)
                                    .font(.semibold(20))
                            }
                        Rectangle()
                            .frame(maxWidth: .infinity, minHeight: 65)
                            .foregroundStyle(Color(hex: "F5F5F5"))
                            .overlay {
                                DateCalendar(selectedDate: $selectedDate)
                            }
                        Rectangle()
                            .frame(maxWidth: .infinity, minHeight: 258)
                            .foregroundStyle(.white)
                            .overlay {
                                Group {
                                    if meals.isEmpty {
                                        emptyText
                                    } else {
                                        mealListView
                                    }
                                }
                            }
                    }
                    RoundedRectangle(cornerRadius: 8)
                        .frame(maxWidth: .infinity, minHeight: 214)
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
                }
                .padding(.horizontal, 24)
            }
        }
        .onAppear {
            fetchMeal(for: selectedDate)
        }
        .onChange(of: selectedDate) { newDate in
            fetchMeal(for: newDate)
        }
        .background(Color(hex: "F8F8F8"))
    }
}

#Preview {
    Home()
}
