
//  This is demo codes for fun only
//  Created by Pulkit on 17/02/20.


import Foundation
import UIKit


let YYYY_MM_DD_HH_MM_SS_zzzz = "yyyy-MM-dd HH:mm:ss +zzzz"
let YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss"
let DD_MM_YYYY = "dd-MM-yyyy"
let DD_MM_YY = "dd/MM/YY"
let DD_MMM_YY = "dd MMM yy"
let DD_MM_YYYY_1 = "dd/MM/yyyy"
let DD_MM_YYYY_2 = "yyyy/MM/dd"
let MM_DD_YYYY = "MM-dd-yyyy"
let MM_DD_YYYY_1 = "MM/dd/yyyy"
let YYYY_DD_MM = "yyyy-dd-MM"
let YYYY_MM_DD = "yyyy-MM-dd"
let YYYY_MM_DD_T_HH_MM_SS = "yyyy-MM-dd'T'HH:mm:ss"
let YYYY_MM_DD_T_HH_MM_SSZZ = "yyyy-MM-dd'T'HH:mm:ss'Z'"
let YYYY_MM_DD_T_HH_MM_SSZZZZ = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
let H_MM_A = "h:mm a"
let H_MM = "HH:mm"
let H_MM_SS = "HH:mm:ss"
let YYYY_MM_DD_Caps = "YYYY-MM-dd"
let EEE_MMM_DD_YYYY = "EEE, MMM d, yyyy"
let MMM_DD_YYYY = "MMM dd, yyyy"
let EEE = "EEE"
let D = "d"
let MMMM = "MMMM"
let YYYY = "yyyy"


extension NSDate{
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
}
