//
//  String.swift
//  
//
//  Created by Pulkit Vora on 17/02/20.
//

import Foundation

extension String {
  
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width + 40
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }

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
    func toDateFormatterString(customFormat : String) -> String
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        //Specify Format of String to Parse
        dateFormatter.dateFormat = DD_MM_YYYY_1
        
        //Parse into NSDate
        let dateFromString = dateFormatter.date(from: self)!
        
        dateFormatter.dateFormat = customFormat

        //Return Parsed Date
        return dateFormatter.string(from: dateFromString)

    }
    
    func toDateTime() -> Date
    {
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        //Parse into NSDate
        let dateFromString : Date = dateFormatter.date(from: self)! as Date
        
        //Return Parsed Date
        return dateFromString
    }
    
    func toDate() -> NSDate
    {
        
        //Create Date Formatter
        let dateFormatter = DateFormatter()
        
        //Specify Format of String to Parse
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm a"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        
        //Parse into NSDate
        let dateFromString : NSDate = dateFormatter.date(from: self)! as NSDate
        
        //Return Parsed Date
        return dateFromString
    }
    


    
//    func getDate() -> Date? {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-dd-MM HH:mm a"
//        dateFormatter.timeZone = TimeZone.current
//        dateFormatter.locale = Locale.current
//        return dateFormatter.date(from: self) // replace Date String
//    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func toArrayOfElements() -> [String] {
        return self.components(separatedBy: ",")
    }
    
   
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }
    
    func trim()->String{
        return self.trimmingCharacters(in: .whitespaces)
    }
    func trimLines()->String{
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    
    static func documentDirectory()->String{
        
        let path  = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true);
        return  path[0] as String;
    }
    
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    func isValidPassword() -> Bool {
         let emailRegEx = "^[a-zA-Z0-9]{6,30}$"
         let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
         return emailTest.evaluate(with: self)
     }
     
    
    func isValidFLName() -> Bool {
        let nameRegEx = "^[a-zA-Z ]+$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return !emailTest.evaluate(with: self)
    }
    
    func isValidName() -> Bool {
        let invalidCharSet = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ").inverted
        let filtered: String = self.components(separatedBy: invalidCharSet).joined(separator: "")
        return self == filtered
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
    
    func fileName() -> String {
        return NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent ?? ""
    }
    
    func fileExtension() -> String {
        return NSURL(fileURLWithPath: self).pathExtension ?? ""
    }
    
    func checkFileType() ->  FileType{
        if self.fileExtension() == "png" || self.fileExtension() == "jpg" || self.fileExtension() == "jpeg"{
            return FileType.IMAGE
        }
        
        if self.fileExtension() == "mp4" || self.fileExtension() == "mov"{
            return FileType.VIDEO
        }
        return FileType.OTHER
    }

    
}
