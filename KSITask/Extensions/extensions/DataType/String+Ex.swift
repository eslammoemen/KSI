//
//  String+Ex.swift
//  Sokyakom
//
//  Created by Ghoost on 10/4/20.
//

import Foundation

extension String {
    func htmlAttributedString() -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
        guard let html = try? NSMutableAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil) else { return nil }
        return html
    }
}


extension String {
    
    var isValidEmail:Bool {
        let emailStr = self
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

           let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailPred.evaluate(with: emailStr)
    }
    var isSaudiNumber:Bool {
        let emailStr = self
        let emailRegEx = #"^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$"#

           let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailPred.evaluate(with: emailStr)
    }
    var isValidPhone:Bool{
        let phoneStr = self
        let phoneRegEx = "^\\d{3}-\\d{3}-\\d{4}$"

           let phonePred = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
           return phonePred.evaluate(with: phoneStr)
    }
    var isValidPassword:Bool{
        //Minimum 8 characters at least 1 Alphabet and 1 Number and All in English
        let passStr = self
        let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{7,}$"
           let passPred = NSPredicate(format:"SELF MATCHES %@", passRegEx)
           return passPred.evaluate(with: passStr)
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
     func localized() -> String{
        return NSLocalizedString(self, comment: "")
    }
    
    
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    func toDate(format: String)-> Date?{
           let dateFormatter = DateFormatter()
           dateFormatter.locale = Locale(identifier: "en_US_POSIX")
           dateFormatter.dateFormat = format
           let date = dateFormatter.date(from: self)
           return date

       }
    
    func hasRange(_ range: NSRange) -> Bool {
        return Range(range, in: self) != nil
    }
    
}

extension Data {
var html2AttributedString: NSAttributedString? {
    do {
        return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
    } catch {
        print("error:", error)
        return  nil
}}}
extension String {
    func getFormattedDat(fromFormatter:String, toFormat:String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = fromFormatter
        dateFormatterGet.timeZone = TimeZone(identifier: "UTC")
        dateFormatterGet.locale = Locale(identifier: "en_US_POSIX")

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = toFormat
        dateFormatterPrint.timeZone = TimeZone.current
        dateFormatterPrint.locale = Locale(identifier: "en_US_POSIX")

        let date: Date? = dateFormatterGet.date(from: self)
        return dateFormatterPrint.string(from: date!);
    }
    
}
