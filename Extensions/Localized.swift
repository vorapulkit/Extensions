
//  This is demo codes for fun only
//  Created by Pulkit on 17/02/20.

import Foundation
import UIKit

protocol Localizable {
    var localized: String { get }
}
extension String: Localizable {
    var localized: String {
        return APPMANAGER.read_Localizable(self)
    }
}
protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}
protocol XSeries {
    var newConstraint: NSLayoutConstraint? { get set }
}
extension NSLayoutConstraint: XSeries {
    @IBInspectable var newConstraint: NSLayoutConstraint? {
        get { return nil }
        set(key) {
            if hasTopNotch && key != nil{
                self.constant = key!.constant
            }
        }
    }
    

}
extension UILabel: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }
}
extension UITextView: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }
}
extension UITextField: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }
}
extension UIButton: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { return nil }
        set(key) {
            setTitle(key?.localized, for: .normal)
        }
   }
}
