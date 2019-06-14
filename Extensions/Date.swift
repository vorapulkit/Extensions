
import Foundation
import UIKit

//MARK:
//MARK: Date

extension Date{
    
    func currentUTCTimeZoneDate() -> Date {
        let dtf = DateFormatter()
        dtf.timeZone = TimeZone.current
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
    static func convertDateToLocal(strDate:String, oldFormate strOldFormate:String, newFormate strNewFormate:String) -> String{
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
    func timeAgoDisplay() -> String {
        
        let calendar = Calendar.current
        let minuteAgo = calendar.date(byAdding: .minute, value: -1, to: Date())!
        let hourAgo = calendar.date(byAdding: .hour, value: -1, to: Date())!
        let dayAgo = calendar.date(byAdding: .day, value: -1, to: Date())!
        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
        
        if minuteAgo < self {
            let diff = Calendar.current.dateComponents([.second], from: self, to: Date()).second ?? 0
            return "\(diff) sec ago"
            
        } else if hourAgo < self {
            let diff = Calendar.current.dateComponents([.minute], from: self, to: Date()).minute ?? 0
            if diff > 1{
                return "\(diff) mins ago"
            }
            return "\(diff) min ago"
        } else if dayAgo < self {
            let diff = Calendar.current.dateComponents([.hour], from: self, to: Date()).hour ?? 0
            if diff > 1{
                return "\(diff) hrs ago"
            }
            return "\(diff) hr ago"
        } else if weekAgo < self {
            let diff = Calendar.current.dateComponents([.day], from: self, to: Date()).day ?? 0
            if diff > 1{
                return "\(diff) days ago"
            }
            return "\(diff) day ago"

        }
        let diff = Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear ?? 0
        if diff > 1{
            return "\(diff) weeks ago"
        }
        return "\(diff) week ago"
    }
}
