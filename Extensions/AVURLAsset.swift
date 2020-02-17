//
//  AVURLAsset.swift
//  
//
//  Created by Pulkit Vora on 17/02/20.
//

import AVFoundation
import AVKit

extension AVURLAsset {
    var fileSize: Int? {
        let keys: Set<URLResourceKey> = [.totalFileSizeKey, .fileSizeKey]
        let resourceValues = try? url.resourceValues(forKeys: keys)
        
        return resourceValues?.fileSize ?? resourceValues?.totalFileSize
    }
}
