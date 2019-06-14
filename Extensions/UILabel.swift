
import Foundation
import UIKit
extension UILabel {

    
    func setStrikethrough(text:String, color:UIColor = UIColor.black) {
        let attributedText = NSAttributedString(string: text , attributes: [NSAttributedStringKey.strikethroughStyle: NSUnderlineStyle.styleSingle.rawValue, NSAttributedStringKey.strikethroughColor: color])
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
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        self.attributedText = attributedString
    }

    func setLineHeight(lineHeight: CGFloat) {
        let text = self.text
        if let text = text {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            style.lineSpacing = lineHeight
            attributeString.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: NSMakeRange(0, text.count))
            self.attributedText = attributeString
        }
    }

    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFade
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionFade)
    }

    func setAttributedTextString(string: String) {
        self.attributedText = NSAttributedString(string: string, attributes: self.attributedText?.attributes(at: 0, effectiveRange: nil))
    }

    func setKern(kern: CGFloat) {
        var attributes = self.attributedText?.attributes(at: 0, effectiveRange: nil)
        attributes?[NSAttributedStringKey.kern] = kern
        self.attributedText = NSAttributedString(string: (self.attributedText?.string)!, attributes: attributes)
    }

    func setLineSpacing(lineSpacing: CGFloat) {
        let paragraphStyle =  NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        var attributes = self.attributedText?.attributes(at: 0, effectiveRange: nil)
        attributes?[NSAttributedStringKey.paragraphStyle] = paragraphStyle
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
                objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets!, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }

    override open func draw(_ rect: CGRect) {
        if let insets = padding {
            self.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
        } else {
            self.drawText(in: rect)
        }
    }

}
