//
//  NSObject.swift
//  
//
//  Created by Pulkit Vora on 17/02/20.
//

import Foundation

extension NSObject {
    /// Returns the className for the Class, removing the project namespace.
    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? NSStringFromClass(self)
        
    }
}
