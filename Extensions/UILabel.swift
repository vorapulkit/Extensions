
//  This is demo codes for fun only
//  Created by Pulkit on 17/02/20.

import Foundation
import UIKit
extension UILabel {
    
    func attributedText(withString string: String, boldString: String, font: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string,
                                                         attributes: [NSAttributedString.Key.font: font])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: font.pointSize)]
        let range = (string as NSString).range(of: boldString)
        attributedString.addAttributes(boldFontAttribute, range: range)
        return attributedString
    }
    
    func setStrikethrough(text:String, color:UIColor = UIColor.black) {
        let attributedText = NSAttributedString(string: text , attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.strikethroughColor: color])
        self.attributedText = attributedText
    }
    
    func setLabelLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
    
    func setLineHeight(lineHeight: CGFloat) {
        let text = self.text
        if let text = text {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            style.lineSpacing = lineHeight
            attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0, text.count))
            self.attributedText = attributeString
        }
    }
    
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: convertFromCATransitionType(CATransitionType.fade))
    }
    
    func setAttributedTextString(string: String) {
        self.attributedText = NSAttributedString(string: string, attributes: self.attributedText?.attributes(at: 0, effectiveRange: nil))
    }
    
    func setKern(kern: CGFloat) {
        var attributes = self.attributedText?.attributes(at: 0, effectiveRange: nil)
        attributes?[NSAttributedString.Key.kern] = kern
        self.attributedText = NSAttributedString(string: (self.attributedText?.string)!, attributes: attributes)
    }
    
    func setLineSpacing(lineSpacing: CGFloat) {
        let paragraphStyle =  NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        var attributes = self.attributedText?.attributes(at: 0, effectiveRange: nil)
        attributes?[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        self.attributedText = NSAttributedString(string: (self.attributedText?.string)!, attributes: attributes)
    }
    
    var defaultFont: UIFont? {
        get { return self.font }
        set { self.font = newValue }
    }
    
    private struct AssociatedKeys {
        static var padding = UIEdgeInsets()
    }
    
    var padding: UIEdgeInsets? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    override open func draw(_ rect: CGRect) {
        if let insets = padding {
            self.drawText(in: rect.inset(by: insets))
        } else {
            self.drawText(in: rect)
        }
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromCATransitionType(_ input: CATransitionType) -> String {
    return input.rawValue
}
