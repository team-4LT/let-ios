//
//  Timer.swift
//  let
//
//  Created by 임현우 on 4/23/25.
//

import SwiftUI
import Combine

struct TimerView: View {
    let date = Date()
    @State var start: Bool = false
    @State var zero: Bool = false
    @State var time: Int = 180
    @State var timeRemaining : Int = 1
    @State var timer = Timer.publish(every: 1, on: .main, in: .common)
    @State var cancellable: Cancellable?
    var body: some View {
        VStack{
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
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: 179, height: 289)
                }

            }
            ZStack {
                HStack {
                    Image("alarm")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: 30, height: 28)
                    Text(convertSecondsToTime(timeInSeconds:timeRemaining))
                        .font(.system(size: 36, weight: .semibold))
                        .onReceive(timer) { _ in
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                            } else {
                                cancellable?.cancel()
                            }
                        }
                        .onAppear {
                            calcRemain()
                            cancellable = timer.connect()
                        }
                }
            }
            Button(action: {
                start.toggle()
            }) {
                Text("시작하기")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(width: 344, height: 55)
                    .foregroundStyle(Color(.white))
                    .background(Color(.red))
                    .cornerRadius(8)
            }
        }
    }
        
        func convertSecondsToTime(timeInSeconds: Int) -> String {
            let minutes = timeInSeconds / 60
            let seconds = timeInSeconds % 60
            return String(format: "%02i:%02i",minutes,seconds)
        }
    
        func calcRemain() {
            let calendar = Calendar.current
            let targetTime : Date = calendar.date(byAdding: .second, value: time, to: date, wrappingComponents: false) ?? Date()
            let remainSeconds = Int(targetTime.timeIntervalSince(date))
            self.timeRemaining = remainSeconds
        }
}

#Preview {
    TimerView()
}
