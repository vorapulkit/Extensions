//
//  UIFont.swift
//  
//
//  Created by Pulkit Vora on 17/02/20.
//

import Foundation

extension UIFont{
    // Returns a scaled version of UIFont
    func scaled(scaleFactor: CGFloat) -> UIFont {
        let newDescriptor = fontDescriptor.withSize(fontDescriptor.pointSize * scaleFactor)
        return UIFont(descriptor: newDescriptor, size: 0)
    }
}
