//
//  HMZCommon.swift
//  iPad-SplitViewController
//
//  Created by 赵志丹 on 15/12/29.
//  Copyright © 2015年 HMZBadge. All rights reserved.
//

import UIKit

class HMZCommon: NSObject {
    var isPad: Bool = false
    var isPhone: Bool = false
    static let share = HMZCommon()
    private override init() {
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            isPad = true
        }
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            isPhone = true
        }
    }
}
