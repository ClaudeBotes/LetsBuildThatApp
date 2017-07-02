//
//  Video.swift
//  YouTubeClone
//
//  Created by Claude on 2/7/2017.
//  Copyright © 2017 Claude. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var subTitle: String?
    
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
