//
//  Array.swift
//  
//
//  Created by Pulkit Vora on 17/02/20.
//

import Foundation

extension Array {
    func filterDuplicates(includeElement: @escaping (_ lhs: Element, _ rhs: Element) -> Bool) -> [Element] {
        
        var results = [Element]()
        
        forEach { (element) in
            
            let existingElements = results.filter {
                return includeElement(element, $0)
            }
            
            if existingElements.count == 0 {
                results.append(element)
            }
        }
        return results
    }
    var string: String? {
        
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
            return String(data: data, encoding: .nonLossyASCII)
            
        } catch {
            
            return nil
        }
    }
    
    func withPriority(priority: UILayoutPriority) -> [NSLayoutConstraint] {
        var members: [NSLayoutConstraint] = []
        for member in self {
            switch member {
            case let constraint as NSLayoutConstraint:
                constraint.priority = priority
                members.append(constraint)
            default: break
            }
        }
        return members
    }
}
