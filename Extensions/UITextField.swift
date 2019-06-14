
import Foundation
import UIKit

extension UITextField
{
    enum Direction
    {
        case Left
        case Right
    }
    
    func setImage(direction:Direction,imageName:String,Frame:CGRect,backgroundColor:UIColor)
    {
        let View = UIView(frame: CGRect(x: Frame.origin.x, y: Frame.origin.y, width: Frame.size.width + 25, height: Frame.size.height))
        View.backgroundColor = backgroundColor
        
        let imageView = UIImageView(frame: Frame)
        imageView.image = UIImage(named: imageName)
        imageView.tintColor = getThemeColor()
        
        View.addSubview(imageView)
        
        if Direction.Left == direction
        {
            self.leftViewMode = .always
            self.leftView = View
        }
        else
        {
            self.rightViewMode = .always
            self.rightView = View
        }
    }
    
    func useUnderline() {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func cornerRadius(){
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
    func borderColor(){
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func setPlaceHolderColor(color : UIColor){
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor :color,NSAttributedStringKey.font : UIFont.init(name: Font.FontName.ProximaNova_Semibold.rawValue, size: 16) as Any])
    }
    
    func borderWidth(size:CGFloat){
        self.layer.borderWidth = size
    }
    
    func blank() -> Bool{
        let strTrimmed = self.text!.trim()//get trimmed string
        if(strTrimmed.count == 0)//check textfield is nil or not ,if nil then return false
        {
            return true
        }
        return false
    }
    
    //set begginning space - left space
    func setLeftPadding(paddingValue:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingValue, height: self.frame.size.height))
        self.leftViewMode = .always
        self.leftView = paddingView
    }
    
    //set end of space
    func setRightPadding(paddingValue:CGFloat){
        let paddingView = UIView(frame: CGRect(x: (self.frame.size.width - paddingValue), y: 0, width: paddingValue, height: self.frame.size.height))
        self.rightViewMode = .always
        self.rightView = paddingView
    }
    
    func setBottomBorder(_ color:UIColor, height:CGFloat) {
        var view = self.viewWithTag(2525)
        if view == nil {
            
            view = UIView(frame:CGRect(x: 0, y: self.frame.size.height - height, width:  self.frame.size.width, height: 1))
            view?.backgroundColor = color
            view?.tag = 2525
            self .addSubview(view!)
        }
    }
    
    func leftButton(image:UIImage?) {
        let btn = UIButton.init(type: .custom)
        btn.setImage(image, for: .normal)
        btn.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.height, height:  self.frame.size.height)
        self.leftView = btn;
        self.leftViewMode = .always
        // return btn
    }
    
    func rightButton(imageName:String) {
        let btn = UIButton.init(type: .custom)
        btn.setImage(UIImage.init(named: imageName), for: .normal)
        //  btn.frame = CGRect.init(x:  (ScreenSize.SCREEN_WIDTH - self.frame.size.height), y: 0, width: self.frame.size.height, height:  self.frame.size.height)
        self.rightView = btn;
        self.rightViewMode = .always
        // return btn
    }
}
