//
//  DateCalendar.swift
//  let
//
//  Created by dgsw16 on 4/16/25.
//

import SwiftUI

struct CalendarDate: Identifiable {
    let id = UUID()
    let date: Date
    let dayString: String
    let dateNumber: Int
    var isToday: Bool
}

struct DateCalendar: View {
    @Binding var selectedDate: Date
    
    private let calendar = Calendar.current
    private let dateFormatter = DateFormatter()
    
    private var dateRange: [CalendarDate] {
        var dates: [CalendarDate] = []
        for i in -5...6 {
            if let newDate = calendar.date(byAdding: .day, value: i, to: Date()) {
                let day = dateFormatter.shortWeekdaySymbols[calendar.component(.weekday, from: newDate)-1]
                let dateNum = calendar.component(.day, from: newDate)
                let isToday = calendar.isDateInToday(newDate)
                
                dates.append(CalendarDate(
                    date: newDate,
                    dayString: day,
                    dateNumber: dateNum,
                    isToday: isToday
                ))
            }
        }
        return dates
    }
    
    init(selectedDate: Binding<Date>) {
           self._selectedDate = selectedDate
           dateFormatter.locale = Locale(identifier: "ko_KR")
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center,spacing: 0) {
                Spacer()
                ForEach(dateRange) { date in
                    let isSelected = calendar.isDate(date.date, inSameDayAs: selectedDate)
                    
                    VStack(alignment: .center,spacing: 0) {
                        Text("\(date.dateNumber)")
                            .font(.regular(18))
                            .foregroundColor(isSelected ? .white : .black)
                            .frame(width: 28, height: 28)
                            .background(isSelected ? Color.main2 : Color.clear)
                            .clipShape(Circle())
                            .layoutPriority(1)

                        Text(date.dayString)
                            .font(.semibold(7))
                            .foregroundColor(.black)
                            .fixedSize()
                    }

                    .onTapGesture {
                        selectedDate = date.date
                    }
                }
            }
        
        }
        .background(Color.clear)
    }
}


#Preview {
    Home()
}
