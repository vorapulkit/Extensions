
import Foundation
import UIKit

/// Represents parts of time
struct TimeParts: CustomStringConvertible {
    var seconds = 0
    var minutes = 0
    /// The string representation of the time parts (ex: 07:37)
    var description: String {
        return NSString(format: "%01d:%02d", minutes, seconds) as String
    }
}
/// Represents unset or empty time parts
let EmptyTimeParts = 0.toTimeParts()


extension Float
{
    var cleanValue: String
    {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
    func toDouble() -> Double? {
        return Double(self)
    }
    
    func toInt() -> Int? {
        if self > Float(Int.min) && self < Float(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
}

extension Int {
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
        return abbrev.characters.enumerated().reversed().reduce(nil as String?) { accum, tuple in
            let factor = Double(self) / pow(10, Double(tuple.0 + 1) * 3)
            let format = (factor.truncatingRemainder(dividingBy: 1)  == 0 ? "%.0f%@" : "%.1f%@")
            return accum ?? (factor > 1 ? String(format: format, factor, String(tuple.1)) : nil)
            } ?? String(self)
    }
    func toString() -> String
    {
        return String(self)
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

extension Double {
    mutating func square() {
        let pi = 3.1415
        self = pi * self * self
    }
    func celsiusToFahrenheit() -> Double {
        return self * 9 / 5 + 32
    }
    
    func fahrenheitToCelsius() -> Double {
        return (self - 32) * 5 / 9
    }
    
    func toInt() -> Int? {
        if self > Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
    
    func cleanValue()->String?{
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

extension NSAttributedString {
    
    
    func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.width)
    }
}

extension String {

    var jsonStringRedecoded: String? {
        let data = ("\""+self+"\"").data(using: .utf8)!
        let result = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! String
        return result
    }
    
    func getEmojies()-> String {
        
        let aData: Data? = self.data(using: .utf8)!
        let decodedValue = String(data:aData!, encoding: String.Encoding(rawValue: String.Encoding.nonLossyASCII.rawValue))
        
        if decodedValue != nil {return decodedValue!} else
        { if let tmpString = self.jsonStringRedecoded{return tmpString}}
        return self}
    
    func toDouble() -> Double? {
        return Double(self)
    }
    
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
    
    func toInt() -> Int {
        if let num = NumberFormatter().number(from: self)?.intValue{
            return num
        }
        return 0
    }
    
    func toFloat() -> Float {
        
        if let num = NumberFormatter().number(from: self)?.floatValue{
            return num
        }
        return 0.0
    }
    
    func toDateTime() -> NSDate
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        //Parse into NSDate
        let dateFromString : NSDate = dateFormatter.date(from: self)! as NSDate
        
        //Return Parsed Date
        return dateFromString
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func toArrayOfElements() -> [String] {
        return self.components(separatedBy: ",")
    }
    
    var bundleShortVersion:String? {
        get {
            if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
                return version
            }
            return nil
        }
    }
    var bundleVersion:String? {
        get {
            if let version = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
                return version
            }
            return nil
        }
    }
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }
    
    func trim()->String{
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    static func documentDirectory()->String{
        
        var path  = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
        return  path[0] as String;
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidPassWord() -> Bool {
        if count > 6 {
            return true
        }
        return false
    }
    
    func isValidName() -> Bool {
        let invalidCharSet = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ").inverted
        let filtered: String = self.components(separatedBy: invalidCharSet).joined(separator: "")
        return self == filtered
    }
    
    func isValidZipcode() -> Bool {
        
        if count == 5 || count == 6 {
            return true
        }
        return false
    }
    
    func isValidMobile() -> Bool {
        if count == 10 {
            return true
        }
        return false
    }
    
    func isEmptyText() -> Bool {
        let string = self.trimmingCharacters(in: NSCharacterSet.whitespaces)
        return string.isEmpty
    }
    
    func substring(_ from: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        return String(self[start ..< endIndex])
    }
    
    var toNSString: NSString {
        return self as NSString
    }
}

extension Array {
    var string: String? {
        
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
            return String(data: data, encoding: .nonLossyASCII)
            
        } catch {
            
            return nil
        }
    }
    
    func withPriority(priority: UILayoutPriority) -> [NSLayoutConstraint] {
        var members: [NSLayoutConstraint] = []
        for member in self {
            switch member {
            case let constraint as NSLayoutConstraint:
                constraint.priority = priority
                members.append(constraint)
            default: break
            }
        }
        return members
    }
}
