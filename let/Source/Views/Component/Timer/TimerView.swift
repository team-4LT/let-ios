//
//  Timer.swift
//  let
//
//  Created by 임현우 on 4/23/25.
//

import SwiftUI
import Combine

struct TimerView: View {
    @State private var isRunning = false
    @State private var timeRemaining: Int = 2
    @State private var timer: AnyCancellable?
    @State private var isPaused: Bool = false

    var body: some View {
        VStack {
            ZStack {
                Image("light")
                    .frame(width: 442, height: 442)
                VStack {
                    Text("가볍게 뛰며")
                        .font(.system(size: 28, weight: .semibold))
                    Text("음식 소화를 시켜보아요!")
                        .font(.system(size: 28, weight: .semibold))
                        .padding(.bottom, 50)
                    Image("Girlrunning")
                        .resizable()
                        .frame(width: 179, height: 289)
                }
            }
            ZStack {
                HStack {
                    Image("alarm")
                        .resizable()
                        .frame(width: 30, height: 28)
                    Text(convertSecondsToTime(timeInSeconds: timeRemaining))
                        .font(.system(size: 36, weight: .semibold))
                }
            }

            Button(action: {
                isRunning.toggle()
                
                if isRunning {
                    startTimer()
                } else {
                    stopTimer()
                }
            }) {
                Text(isRunning ? "일시정지" : "시작하기")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(width: 344, height: 55)
                    .foregroundStyle(Color.white)
                    .background(Color.red)
                    .cornerRadius(8)
            }
        }
        .onDisappear {
            stopTimer()
        }
        .onDisappear{
            popup()
        }
    }
    
    func startTimer() {
        timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    stopTimer()
                }
            }
    }
    
    func popup() {
        RoutinePopUP.init()
    }
    //sheet 사용해서 저 함수 호출 시키거나 그냥 뷰 호출 시키기
    func stopTimer() {
        timer?.cancel()
        timer = nil
    }

    func convertSecondsToTime(timeInSeconds: Int) -> String {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    TimerView()
}
