//
//  DateFormatter.swift
//  ServiceListApp
//
//  Created by Purnasindhu-749 on 10/07/25.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm a"
        let time = formatter.string(from: self)

        if calendar.isDateInToday(self) {
            return "Today, \(time)"
        } else if calendar.isDateInYesterday(self) {
            return "Yesterday, \(time)"
        } else if calendar.isDate(self, inSameDayAs: calendar.date(byAdding: .day, value: 1, to: Date())!) {
            return "Tomorrow, \(time)"
        } else {
            formatter.dateFormat = "dd/MM/yyyy, h:mm a"
            return formatter.string(from: self)
        }
    }
}
