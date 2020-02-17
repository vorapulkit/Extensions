//
//  CAShapeLayer.swift
//  
//
//  Created by Pulkit Vora on 17/02/20.
//

import Foundation

extension CAShapeLayer {
    func drawRoundedRect(rect: CGRect, andColor color: UIColor, filled: Bool) {
        fillColor = filled ? color.cgColor : UIColor.white.cgColor
        strokeColor = color.cgColor
        path = UIBezierPath(roundedRect: rect, cornerRadius: 7).cgPath
    }
}
