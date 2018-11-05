//
//  Date+Extension.swift
//  NewsApp
//
//  Created by b2c on 11/4/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import Foundation
extension Date
{
    init(dateString:String) {
        self = Date.iso8601Formatter.date(from: dateString)!
    }
    
    static let iso8601Formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate,
                                   .withTime,
                                   .withDashSeparatorInDate,
                                   .withColonSeparatorInTime]
        return formatter
    }()
    func displayStringForFormat(_ format:DateFormats) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }

    func timeAgoSinceDate() -> String {
        let calendar = Calendar.current
//        let earliest = now.earlierDate(self)
//        let latest = (earliest == now) ? self : now
//        let components = calendar.dateComponents(components:[NSCalendar.Unit.minute , NSCalendar.Unit.hour , NSCalendar.Unit.day , NSCalendar.Unit.weekOfYear , NSCalendar.Unit.month , NSCalendar.Unit.year , NSCalendar.Unit.second], fromDate: self)
        let components =  calendar.dateComponents([Calendar.Component.minute , Calendar.Component.hour , Calendar.Component.day ,Calendar.Component.weekOfYear , Calendar.Component.month , Calendar.Component.year , Calendar.Component.second], from: self, to: Date())
        let _ = components.year ?? 0
        let _ = components.month ?? 0
        let _ = components.weekOfYear ?? 0
        let day = components.day ?? 0
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let second = components.second ?? 0

        guard day <= 1 else
        {
            return  displayStringForFormat(.displayFormatLong)
        }

        if day >= 1{
            return "Yesterday"
        }
        if hour >= 2 {
            return "\(hour) hours ago"
        }
        if hour >= 1{
                return "An hour ago"
        }
        if minute >= 2 {
            return "\(minute) minutes ago"
        }
        if minute >= 1{
                return "A minute ago"
        }
        if second >= 3 {
            return "\(second) seconds ago"
        }
        
            return "Just now"
        
    }
}
