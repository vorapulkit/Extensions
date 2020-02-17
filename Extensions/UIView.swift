
//  This is demo codes for fun only
//  Created by Pulkit on 17/02/20.

import Foundation
import UIKit



extension UIView {
  
    var heightConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .height && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
    var topConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .top && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
    var bottomConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .bottomMargin && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
    var widthConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .width && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
    func pathCurvedForView(givenView: UIView, curvedPercent:CGFloat) ->UIBezierPath
    {
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x:0, y:0))
        arrowPath.addLine(to: CGPoint(x:givenView.bounds.size.width, y:0))
        arrowPath.addLine(to: CGPoint(x:givenView.bounds.size.width, y:givenView.bounds.size.height - (givenView.bounds.size.height*curvedPercent)))
        arrowPath.addQuadCurve(to: CGPoint(x:0, y:givenView.bounds.size.height - (givenView.bounds.size.height*curvedPercent)), controlPoint: CGPoint(x:givenView.bounds.size.width/2, y:givenView.bounds.size.height))
        arrowPath.addLine(to: CGPoint(x:0, y:0))
        arrowPath.close()
        
        return arrowPath
    }
    func addCurves(curvedPercent : CGFloat){
        let shapeLayer = CAShapeLayer(layer: self.layer)
        shapeLayer.path = self.pathCurvedForView(givenView: self,curvedPercent: curvedPercent).cgPath
        shapeLayer.frame = self.bounds
        shapeLayer.masksToBounds = true
        self.layer.mask = shapeLayer
    }
    
    func fadeIn() {
        // Move our fade out code from earlier
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0 // Instead of a specific instance of, say, birdTypeLabel, we simply set [thisInstance] (ie, self)'s alpha
        }, completion: nil)
    }
    
    func fadeOut() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.5
        }, completion: nil)
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.leftAnchor
        }else {
            return self.leftAnchor
        }
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.rightAnchor
        }else {
            return self.rightAnchor
        }
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    func removeAllSubviews() {
        subviews.forEach { $0.removeFromSuperview()}
    }
    
    @IBInspectable var Corneredius:CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var BorderWidth:CGFloat{
        get{
            return layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
            self.layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var NewBorderColor:UIColor{
        get{
            return self.NewBorderColor
        }
        set{
            self.layer.borderColor = newValue.cgColor
            
        }
    }
    
    var NewRoundDynamic:Bool{
        get{
            return false
        }
        set{
            if newValue == true {
                
                self.perform(#selector(UIView.afterDelay), with: nil, afterDelay: 0.1)
            }
        }
    }
    
    @objc func afterDelay(){
        let  Height =  self.frame.size.height
        self.layer.cornerRadius = Height/2;
        self.layer.masksToBounds = true;
    }
    
    var NewRound:Bool{
        get{
            return false
        }
        set{
            if newValue == true {
                self.layer.cornerRadius = self.frame.size.height/2;
                self.layer.masksToBounds = true;
            }
        }
    }
    
    var NewShadow:Bool{
        get{
            return false
        }
        set{
            if newValue == true {
                self.layer.masksToBounds = false
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
                self.layer.shadowOpacity = 0.6;
            }
        }
    }
    
    var NewclipsToBounds:Bool{
        get{
            return false
        }
        set{
            if newValue == true {
                
                self.clipsToBounds = true;
            }else{
                self.clipsToBounds = false
            }
        }
    }
    
    func shadowWithcell() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height:0.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 6.0
    }
    
    func shadowWithHeader() {
        self.layer.masksToBounds = false
        //self.layer.shadowColor = color.lightGray.value.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height:0.0)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 6.0
    }
    
    func shadowBotton(alph:Float){
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = alph
    }
    
    func shadowWith(alph:Float){
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = alph
    }
    
    func shadowWithOffset(size:CGSize,alph:Float,radius:CGFloat,color: UIColor){
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = size
        self.layer.shadowOpacity = alph
        self.layer.shadowRadius = radius
    }
    
    class func shadowWithOffsetView(viewObj: UIView, size:CGSize,alph:Float,radius:CGFloat,color: UIColor){
        viewObj.layer.masksToBounds = false
        viewObj.layer.shadowColor = color.cgColor
        viewObj.layer.shadowOffset = size
        viewObj.layer.shadowOpacity = alph
        viewObj.layer.shadowRadius = radius
    }

    
    func shadowBottom(alph:Float){
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 0)
        self.layer.shadowOpacity = alph
        
    }
    
    func addShadowProfile(to edges:[UIRectEdge], radius:CGFloat,toColor : UIColor){
        
        //  let fromColor = CGColor.lightGray.value
        let toColor = toColor
        
        // Set up its frame.
        let viewFrame = self.frame
        for edge in edges{
            let gradientlayer          = CAGradientLayer()
            gradientlayer.colors       = [toColor.cgColor,toColor.cgColor]
            gradientlayer.shadowRadius = radius
            switch edge {
            case UIRectEdge.top:
                gradientlayer.startPoint = CGPoint(x: 0.5, y: 0.0)
                gradientlayer.endPoint = CGPoint(x: 0.5, y: 1.0)
                gradientlayer.frame = CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: gradientlayer.shadowRadius)
            case UIRectEdge.bottom:
                gradientlayer.startPoint = CGPoint(x: 0.5, y: 1.0)
                gradientlayer.endPoint = CGPoint(x: 0.5, y: 0.0)
                gradientlayer.frame = CGRect(x: 0.0, y: viewFrame.height - gradientlayer.shadowRadius, width: viewFrame.width, height: gradientlayer.shadowRadius)
            case UIRectEdge.left:
                gradientlayer.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradientlayer.endPoint = CGPoint(x: 1.0, y: 0.5)
                gradientlayer.frame = CGRect(x: 0.0, y: 0.0, width: gradientlayer.shadowRadius, height: viewFrame.height)
            case UIRectEdge.right:
                gradientlayer.startPoint = CGPoint(x: 1.0, y: 0.5)
                gradientlayer.endPoint = CGPoint(x: 0.0, y: 0.5)
                gradientlayer.frame = CGRect(x: viewFrame.width - gradientlayer.shadowRadius, y: 0.0, width: gradientlayer.shadowRadius, height: viewFrame.height)
            default:
                break
            }
            self.layer.addSublayer(gradientlayer)
        }
    }
    func addButtonShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
    
    
    func addShadow(to edges:[UIRectEdge], radius:CGFloat,toColor : UIColor){
        
        let fromColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1.0)
        let toColor = toColor
        
        // Set up its frame.
        let viewFrame = self.frame
        for edge in edges{
            let gradientlayer          = CAGradientLayer()
            gradientlayer.colors       = [fromColor.cgColor,toColor.cgColor]
            gradientlayer.shadowRadius = radius
            switch edge {
            case UIRectEdge.top:
                gradientlayer.startPoint = CGPoint(x: 0.5, y: 0.0)
                gradientlayer.endPoint = CGPoint(x: 0.5, y: 1.0)
                gradientlayer.frame = CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: gradientlayer.shadowRadius)
            case UIRectEdge.bottom:
                gradientlayer.startPoint = CGPoint(x: 0.5, y: 1.0)
                gradientlayer.endPoint = CGPoint(x: 0.5, y: 0.0)
                gradientlayer.frame = CGRect(x: 0.0, y: viewFrame.height - gradientlayer.shadowRadius, width: viewFrame.width, height: gradientlayer.shadowRadius)
            case UIRectEdge.left:
                gradientlayer.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradientlayer.endPoint = CGPoint(x: 1.0, y: 0.5)
                gradientlayer.frame = CGRect(x: 0.0, y: 0.0, width: gradientlayer.shadowRadius, height: viewFrame.height)
            case UIRectEdge.right:
                gradientlayer.startPoint = CGPoint(x: 1.0, y: 0.5)
                gradientlayer.endPoint = CGPoint(x: 0.0, y: 0.5)
                gradientlayer.frame = CGRect(x: viewFrame.width - gradientlayer.shadowRadius, y: 0.0, width: gradientlayer.shadowRadius, height: viewFrame.height)
            default:
                break
            }
            self.layer.addSublayer(gradientlayer)
        }
    }

    func setGradientTheme()
    {
        
        let color1 = UIColor()
        let color2 = UIColor()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.locations = [0.5 , 0.5] //here you can set percentage of color part are display beNewin 0 to 1
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        self.layoutIfNeeded()

    }
    func roundCorners(topLeft: CGFloat = 0, topRight: CGFloat = 0, bottomLeft: CGFloat = 0, bottomRight: CGFloat = 0) {//(topLeft: CGFloat, topRight: CGFloat, bottomLeft: CGFloat, bottomRight: CGFloat) {
        let topLeftRadius = CGSize(width: topLeft, height: topLeft)
        let topRightRadius = CGSize(width: topRight, height: topRight)
        let bottomLeftRadius = CGSize(width: bottomLeft, height: bottomLeft)
        let bottomRightRadius = CGSize(width: bottomRight, height: bottomRight)
        let maskPath = UIBezierPath(shouldRoundRect: bounds, topLeftRadius: topLeftRadius, topRightRadius: topRightRadius, bottomLeftRadius: bottomLeftRadius, bottomRightRadius: bottomRightRadius)
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    func addSubviews(views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    func layoutRelativeTo(otherView: AnyObject, insets: Inset...) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        for inset in insets {
            constraints.append(NSLayoutConstraint(item: self, attribute: inset.attr, relatedBy: NSLayoutConstraint.Relation.equal, toItem: otherView, attribute: inset.attr, multiplier: 1.0, constant: inset.value))
        }
        return constraints
    }
    
    private static let kRotationAnimationKey = "rotationanimationkey"
    
    func rotate(duration: Double = 1) {
        if layer.animation(forKey: UIView.kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            
            rotationAnimation.fromValue = Float.pi
            rotationAnimation.toValue = Double.pi * 3.0
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = Float.infinity
            layer.add(rotationAnimation, forKey: UIView.kRotationAnimationKey)
        }
    }
    
    func stopRotating() {
        if layer.animation(forKey: UIView.kRotationAnimationKey) != nil {
            layer.removeAnimation(forKey: UIView.kRotationAnimationKey)
        }
    }
    
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
       
}

