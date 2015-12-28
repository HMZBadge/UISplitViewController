//
//  HMZFoodType.swift
//  iPad-SplitViewController
//
//  Created by 赵志丹 on 15/12/28.
//  Copyright © 2015年 HMZBadge. All rights reserved.
//

import UIKit

class HMZFoodType: NSObject {
    /// 标识  决定右边显示的内容
    var idstr: String?
    ///  菜系名字
    var name: String?
    
    override init() {
        super.init()
    }
    
    init(dict:[String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
      //  HMZFoodType.description()
    }
    
    
    override var description: String {
        let keys = [ "idstr", "name" ]
        return dictionaryWithValuesForKeys(keys).description
    }

    
}
