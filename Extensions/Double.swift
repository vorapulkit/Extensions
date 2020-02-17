//
//  Double.swift
//  
//
//  Created by Pulkit Vora on 17/02/20.
//

import Foundation

extension Double {
    mutating func square() {
        let pi = 3.1415
        self = pi * self * self
    }
    func celsiusToFahrenheit() -> Double {
        return self * 9 / 5 + 32
    }
    
    func fahrenheitToCelsius() -> Double {
        return (self - 32) * 5 / 9
    }
    
    func toInt() -> Int? {
        if self > Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
    
    func cleanValue()->String?{
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
