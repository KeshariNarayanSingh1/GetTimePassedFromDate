//
//  DateExtension.swift
//  GetTimePass
//
//  Created by Keshari  on 13/07/24.
//

import Foundation

extension Date {
    func getTimePass(isDateOlderFromCurrent: Bool = false) -> TimePassComponent {
        let calendar = Calendar.current
        var timePassComponent = TimePassComponent()
        let components = (calendar as NSCalendar).components([.year, .month,.weekOfMonth, .day, .hour, .minute, .second], from: isDateOlderFromCurrent ? self : Date(), to: isDateOlderFromCurrent ? Date() : self, options: [])
        timePassComponent.year = if let y = components.year, y > 0  { y } else { nil }
        timePassComponent.month = if let m = components.month, m > 0  { m } else { nil }
        timePassComponent.weekOfMonth = if let wom = components.weekOfMonth, wom > 0  { wom } else { nil }
        timePassComponent.day = if let d = components.day, d > 0  { d } else { nil }
        timePassComponent.hour = if let h = components.hour, h > 0  { h } else { nil }
        timePassComponent.minute = if let min = components.minute, min > 0  { min } else { nil }
        timePassComponent.second = if let s = components.second, s > 0  { s } else { nil }
        return timePassComponent
    }
}


struct TimePassComponent {
    var year, month, weekOfMonth, day, hour, minute, second : Int?
    // When you use this return string then use replace method to remove "~" symbol
    // Like toStringFromLocaliseKey().replacingOccurrences(of: "~", with: " ")
    // If you need only two component then you can use toStringFromLocaliseKey().components(separatedBy: "~").prefix(4).joined(separator: " ")
    
    // if you get time 1 day 0 hr 45 min  but you want to show only 1 month then send "isToReturnEarly" true
    func toStringFromLocaliseKey(
        yearKey: String = "yr",
        yearsKey: String = "yrs",
        monthKey: String = "mnth",
        monthsKey: String = "mnths",
        weekKey: String = "week",
        weeksKey: String = "weeks",
        dayKey: String = "day",
        daysKey: String = "days",
        hourKey: String = "hr",
        hoursKey: String = "hrs",
        minuteKey: String = "min",
        minutesKey: String = "mins",
        secondKey: String = "sec",
        secondsKey: String = "secs",
        isToShowSecond:Bool = false,isToReturnEarly:Bool = false) -> String {
            
            var timePassStr: String = ""
            if let year {
                timePassStr += "\(year)~\(year == 1 ? yearKey : yearsKey)~"
            }
            if let month {
                if month == 0, isToReturnEarly{
                    return removeLastSpecialChar(timePassStr: timePassStr)
                }
                timePassStr += "\(month)~\(month == 1 ? monthKey : monthsKey)~"
            }else{
                if isToReturnEarly, !timePassStr.isEmpty{
                    return removeLastSpecialChar(timePassStr: timePassStr)
                }
            }
            if let weekOfMonth {
                if weekOfMonth == 0, isToReturnEarly{
                    return removeLastSpecialChar(timePassStr: timePassStr)
                }
                timePassStr += "\(weekOfMonth)~\(weekOfMonth == 1 ? weekKey : weeksKey)~"
            }else{
                if isToReturnEarly, !timePassStr.isEmpty{
                    return removeLastSpecialChar(timePassStr: timePassStr)
                }
            }
            if let day {
                if day == 0, isToReturnEarly {
                    return removeLastSpecialChar(timePassStr: timePassStr)
                }
                timePassStr += "\(day)~\(day == 1 ? dayKey : daysKey)~"
            }else{
                if isToReturnEarly, !timePassStr.isEmpty{
                    return removeLastSpecialChar(timePassStr: timePassStr)
                }
            }
            if let hour {
                if hour == 0, isToReturnEarly {
                    return removeLastSpecialChar(timePassStr: timePassStr)
                }
                timePassStr += "\(hour)~\(hour == 1 ? hourKey : hoursKey)~"
            }else{
                if isToReturnEarly, !timePassStr.isEmpty{
                    return removeLastSpecialChar(timePassStr: timePassStr)
                }
            }
            if let minute {
                if minute == 0, isToReturnEarly {
                    return removeLastSpecialChar(timePassStr: timePassStr)
                }
                timePassStr += "\(minute)~\(minute == 1 ? minuteKey : minutesKey)~"
            }else{
                if isToReturnEarly, !timePassStr.isEmpty{
                    return removeLastSpecialChar(timePassStr: timePassStr)
                }
            }
            if let second,isToShowSecond {
                timePassStr += "\(second)~\(second == 1 ? secondKey : secondsKey)"
            }
            return removeLastSpecialChar(timePassStr: timePassStr)
        }
    
    private func removeLastSpecialChar(timePassStr: String) -> String {
        if let lastChar = timePassStr.last, lastChar == "~"{
            return String(timePassStr.dropLast())
        }else{
            return timePassStr
        }
    }
}
