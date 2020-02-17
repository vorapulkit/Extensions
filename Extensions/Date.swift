
//  This is demo codes for fun only
//  Created by Pulkit on 17/02/20.


import Foundation
import UIKit


//MARK:
//MARK: Date

extension Date{
    
    func isBetween(_ date1: Date, and date2: Date) -> Bool {
        return (min(date1, date2) ... max(date1, date2)) ~= self
    }
    
    func convert(from initTimeZone: TimeZone, to targetTimeZone: TimeZone) -> Date {
        let delta = TimeInterval(initTimeZone.secondsFromGMT() - targetTimeZone.secondsFromGMT())
        return addingTimeInterval(delta)
    }
    
    var millisecondsSince1970:Int {
        return Int((Date().timeIntervalSince1970 * 1000.0).rounded())
        
    }
    
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    
    func dayOfMonth() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self as Date).capitalized
        // or use capitalized(with: locale) if you want
    }
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self as Date).capitalized
        // or use capitalized(with: locale) if you want
    }
    func monthOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self as Date).capitalized
        // or use capitalized(with: locale) if you want
    }
    func fullMonthOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self as Date).capitalized
        // or use capitalized(with: locale) if you want
    }
    func yearNum() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: self as Date).capitalized
        // or use capitalized(with: locale) if you want
    }
    func dayNumOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self as Date).capitalized
        // or use capitalized(with: locale) if you want
    }
    func monthNumOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        return dateFormatter.string(from: self as Date).capitalized
        // or use capitalized(with: locale) if you want
    }
    func currentUTCTimeZoneDate() -> Date {
        let dtf = DateFormatter()
        //dtf.timeZone = TimeZone.current
        dtf.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dtf.date(from: dtf.string(from: self))!
    }
    //convert string to date
    static func convertStringToDate(strDate:String, dateFormate strFormate:String) -> Date{
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = strFormate
        dateFormate.timeZone = TimeZone.init(abbreviation: "UTC")
        let dateResult:Date = dateFormate.date(from: strDate)!
        return dateResult
    }
    
    //Function for old date format to new format from UTC to local
    static func convertDateUTCToLocal(strDate:String, oldFormate strOldFormate:String, newFormate strNewFormate:String) -> String{
        let dateFormatterUTC:DateFormatter = DateFormatter()
        dateFormatterUTC.timeZone = NSTimeZone(abbreviation: "UTC") as TimeZone?//set UTC timeZone
        dateFormatterUTC.dateFormat = strOldFormate //set old Format
        if let oldDate:Date = dateFormatterUTC.date(from: strDate)  as Date?//convert date from input string
        {
            dateFormatterUTC.timeZone = NSTimeZone.local//set localtimeZone
            dateFormatterUTC.dateFormat = strNewFormate //make new dateformatter for output format
            if let strNewDate:String = dateFormatterUTC.string(from: oldDate as Date) as String?//convert dateInUTC into string and set into output
            {
                return strNewDate
            }
            return strDate
        }
        return strDate
    }
    
    //Convert without UTC to local
    func convertDateToLocal(strDate:String, oldFormate strOldFormate:String, newFormate strNewFormate:String) -> String{
        let dateFormatterUTC:DateFormatter = DateFormatter()
        //set local timeZone
        dateFormatterUTC.dateFormat = strOldFormate //set old Format
        if let oldDate:Date = dateFormatterUTC.date(from: strDate) as Date?//convert date from input string
        {
            dateFormatterUTC.timeZone = NSTimeZone.local
            dateFormatterUTC.dateFormat = strNewFormate //make new dateformatter for output format
            if let strNewDate = dateFormatterUTC.string(from: oldDate as Date) as String?//convert dateInUTC into string and set into output
            {
                return strNewDate
            }
            return strDate
        }
        return strDate
    }
    
    //Convert Date to String
    func convertDateToString(strDateFormate:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = strDateFormate
        //        dateFormatter.timeZone = TimeZone.current
        //dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let strDate = dateFormatter.string(from: self)
        
        //      dateFormatter = nil
        return strDate
    }
    
    //Convert local to utc
    static func convertLocalToUTC(strDate:String, oldFormate strOldFormate:String, newFormate strNewFormate:String) -> String{
        let dateFormatterUTC:DateFormatter = DateFormatter()
        dateFormatterUTC.timeZone = NSTimeZone.local as TimeZone?//set UTC timeZone
        dateFormatterUTC.dateFormat = strOldFormate //set old Format
        if let oldDate:Date = dateFormatterUTC.date(from: strDate)  as Date?//convert date from input string
        {
            dateFormatterUTC.timeZone = NSTimeZone.init(abbreviation: "UTC")! as TimeZone//set localtimeZone
            dateFormatterUTC.dateFormat = strNewFormate //make new dateformatter for output format
            if let strNewDate:String = dateFormatterUTC.string(from: oldDate as Date) as String?//convert dateInUTC into string and set into output
            {
                return strNewDate
            }
            return strDate
        }
        return strDate
    }
    
    //Comparison two date
    static func compare(date:Date, compareDate:Date) -> String{
        var strDateMessage:String = ""
        let result:ComparisonResult = date.compare(compareDate)
        switch result {
        case .orderedAscending:
            strDateMessage = "Future Date"
            break
        case .orderedDescending:
            strDateMessage = "Past Date"
            break
        case .orderedSame:
            strDateMessage = "Same Date"
            break
            //        default:
            //            strDateMessage = "Error Date"
            //            break
        }
        return strDateMessage
    }
    
    
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
    
    func timeAgoDisplay() -> String {
        
        let calendar = Calendar.current
        let minuteAgo = calendar.date(byAdding: .minute, value: -1, to: Date())!
        let hourAgo = calendar.date(byAdding: .hour, value: -1, to: Date())!
        let dayAgo = calendar.date(byAdding: .day, value: -1, to: Date())!
        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
        
        if minuteAgo < self {
            let diff = Calendar.current.dateComponents([.second], from: self, to: Date()).second ?? 0
            //            return "\(diff) sec ago"
            
            return "\(diff) s"
            
        } else if hourAgo < self {
            let diff = Calendar.current.dateComponents([.minute], from: self, to: Date()).minute ?? 0
            //            if diff > 1{
            //                return "\(diff) mins ago"
            //            }
            //            return "\(diff) min ago"
            return "\(diff) m"
        } else if dayAgo < self {
            let diff = Calendar.current.dateComponents([.hour], from: self, to: Date()).hour ?? 0
            //            if diff > 1{
            //                return "\(diff) hrs ago"
            //            }
            //return "\(diff) hr ago"
            return "\(diff) h"
        } else if weekAgo < self {
            let diff = Calendar.current.dateComponents([.day], from: self, to: Date()).day ?? 0
            //            if diff > 1{
            //                return "\(diff) days ago"
            //            }
            //            return "\(diff) day ago"
            return "\(diff) d"
        }
        let diff = Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear ?? 0
        //        if diff > 1{
        //            return "\(diff) weeks ago"
        //        }
        //        return "\(diff) week ago"
        return "\(diff) w"
    }
}
