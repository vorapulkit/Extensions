//
//  Int.swift
//  
//
//  Created by Pulkit Vora on 17/02/20.
//

import Foundation
extension Int {
    var roundedWithAbbreviations: String {
        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1000000
        if million >= 1.0 {
            return "\(round(million*10)/10)M"
        }
        else if thousand >= 1.0 {
            return "\(round(thousand*10)/10)K"
        }
        else {
            return "\(self)"
        }
    }
    
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }

    func random(_ range:Range<Int>) -> Int
    {
        return range.lowerBound + Int(arc4random_uniform(UInt32(range.upperBound - range.lowerBound)))
    }
    func toTimeParts() -> TimeParts {
        let seconds = self
        var mins = 0
        var secs = seconds
        if seconds >= 60 {
            mins = Int(seconds / 60)
            secs = seconds - (mins * 60)
        }
        
        return TimeParts(seconds: secs, minutes: mins)
    }
    
    /// The string representation of the time parts (ex: 07:37)
    func asTimeString() -> String {
        return toTimeParts().description
    }
    
    var abbreviated: String {
        let abbrev = "KMBTPE"
        return abbrev.enumerated().reversed().reduce(nil as String?) { accum, tuple in
            let factor = Double(self) / pow(10, Double(tuple.0 + 1) * 3)
            let format = (factor.truncatingRemainder(dividingBy: 1)  == 0 ? "%.0f%@" : "%.1f%@")
            return accum ?? (factor > 1 ? String(format: format, factor, String(tuple.1)) : nil)
            } ?? String(self)
    }
    func toString() -> String
    {
        return String(self)
    }
    func toDouble() -> Double
    {
        return Double(self)
    }
    var currentTimeStamp: String {
        get {
            let date = NSDate(timeIntervalSince1970: TimeInterval(self)/1000)
            let dateFormatter = DateFormatter()
            
            // don't forget to set locale, otherwise you may get **周五** instead of **FRI**
            dateFormatter.locale = NSLocale(localeIdentifier: "en_US") as Locale?
            
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            return dateFormatter.string(from: date as Date)
        }
    }
    var trimZero: String {
        get {
            return String(format: "%g", Double(self))
        }
    }
    
}
