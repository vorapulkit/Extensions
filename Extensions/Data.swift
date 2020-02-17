//
//  Data.swift
//  
//
//  Created by Pulkit Vora on 17/02/20.
//

import Foundation

extension Data {
    var hexString: String {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
}
