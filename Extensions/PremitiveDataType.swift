
//  This is demo codes for fun only
//  Created by Pulkit on 17/02/20.


import Foundation
import UIKit

/// Represents parts of time
struct TimeParts: CustomStringConvertible {
    var seconds = 0
    var minutes = 0
    /// The string representation of the time parts (ex: 07:37)
    var description: String {
        return NSString(format: "%01d:%02d", minutes, seconds) as String
    }
}
/// Represents unset or empty time parts
let EmptyTimeParts = 0.toTimeParts()





