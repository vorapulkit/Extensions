
import Foundation
import UIKit
import AVFoundation

extension AVPlayer {
    var isPlaying: Bool {
        if (self.rate != 0 && self.error == nil) {
            return true
        } else {
            return false
        }
    }
}
extension CAShapeLayer {
    func drawRoundedRect(rect: CGRect, andColor color: UIColor, filled: Bool) {
        fillColor = filled ? color.cgColor : UIColor.white.cgColor
        strokeColor = color.cgColor
        path = UIBezierPath(roundedRect: rect, cornerRadius: 7).cgPath
    }
}

private var handle: UInt8 = 0;

extension UIBarButtonItem {
    
    var badgeLayer: CAShapeLayer? {
        if let b: AnyObject = objc_getAssociatedObject(self, &handle) as AnyObject? {
            return b as? CAShapeLayer
        } else {
            return nil
        }
    }
    
    func setBadge(text: String?, withOffsetFromTopRight offset: CGPoint = CGPoint.zero, andColor color:UIColor = UIColor.red, andFilled filled: Bool = true, andFontSize fontSize: CGFloat = 11) {
        badgeLayer?.removeFromSuperlayer()
        if (text == nil || text == "") {
            return
        }
        //addBadge(text: text!, withOffset: offset, andColor: color, andFilled: filled)
    }
    
    //    func addBadge(text: String, withOffset offset: CGPoint = CGPoint.zero, andColor color: UIColor = UIColor.red, andFilled filled: Bool = true, andFontSize fontSize: CGFloat = (DeviceType.IS_IPAD ? 20 : 13)) {
    //        guard let view = self.value(forKey: "view") as? UIView else { return }
    //
    //        var font = UIFont.systemFont(ofSize: fontSize)
    //
    //        if #available(iOS 9.0, *) {
    //            font = UIFont.monospacedDigitSystemFont(ofSize: fontSize, weight: UIFont.Weight.regular)
    //        }
    //
    //        let badgeSize = text.size(withAttributes: [NSAttributedStringKey.font: font])
    //
    //        //initialize Badge
    //        let badge = CAShapeLayer()
    //
    //        let height = badgeSize.height;
    //        var width = badgeSize.width + (DeviceType.IS_IPAD ? 4 : 2) /* padding */
    //
    //        //make sure we have at least a circle
    //        if (width < height) {
    //            width = height
    //        }
    //
    //        //x position is offset from right-hand side
    //        let x = view.frame.width - width + offset.x
    //
    //        let badgeFrame = CGRect(origin: CGPoint(x: x, y: offset.y), size: CGSize(width: width, height: height))
    //
    //        badge.drawRoundedRect(rect: badgeFrame, andColor: color, filled: filled)
    //        view.layer.addSublayer(badge)
    //
    //        //initialiaze Badge's label
    //        let label = CATextLayer()
    //        label.string = text
    //        label.alignmentMode = kCAAlignmentCenter
    //        label.font = font
    //        label.fontSize = font.pointSize
    //
    //        label.frame = badgeFrame
    //        label.foregroundColor = UIColor.white.cgColor
    //        //  label.backgroundColor = UIColor.white.cgColor
    //        label.contentsScale = UIScreen.main.scale
    //        badge.addSublayer(label)
    //
    //        //save Badge as UIBarButtonItem property
    //        objc_setAssociatedObject(self, &handle, badge, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    //
    //        //bring layer to front
    //        badge.zPosition = 1000
    //    }
    
    func removeBadge() {
        badgeLayer?.removeFromSuperlayer()
    }
    
}
extension NSObject {
    /// Returns the className for the Class, removing the project namespace.
    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? NSStringFromClass(self)
        
    }
}

//MARK:
//MARK: UIFont

extension UIFont{
    // Returns a scaled version of UIFont
    func scaled(scaleFactor: CGFloat) -> UIFont {
        let newDescriptor = fontDescriptor.withSize(fontDescriptor.pointSize * scaleFactor)
        return UIFont(descriptor: newDescriptor, size: 0)
    }
}

//MARK:
//MARK: UIScroll View

extension UIScrollView{
    
    func AumaticScroller() {
        var contentRect = CGRect.zero
        for view in self.subviews{
            contentRect = contentRect.union(view.frame);
        }
        self.contentSize = contentRect.size;
    }
    
    func AumaticScrollerFaxible() {
        var contentRect = CGRect.zero
        for view in self.subviews{
            contentRect = contentRect.union(view.frame);
        }
        self.contentSize = CGSize(width: contentRect.width, height: contentRect.height + 60)
    }
}

//MARK:
//MARK: Autolayout

struct Inset {
    let value: CGFloat
    let attr: NSLayoutAttribute
    
    init(_ value: CGFloat, from attr: NSLayoutAttribute) {
        self.attr = attr;
        switch (attr) {
        case .right, .bottom:  self.value = -value
        default: self.value = value
        }
    }
}

