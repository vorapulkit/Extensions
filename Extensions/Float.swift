//
//  Float.swift
//  
//
//  Created by Pulkit Vora on 17/02/20.
//

import Foundation

extension Float
{
    var cleanValue: String
    {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
    func toDouble() -> Double? {
        return Double(self)
    }
    func toString() -> String
    {
        return String(self)
    }
    func toInt() -> Int? {
        if self > Float(Int.min) && self < Float(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
}
