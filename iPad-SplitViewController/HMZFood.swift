//
//  HMZFood.swift
//  iPad-SplitViewController
//
//  Created by 赵志丹 on 15/12/28.
//  Copyright © 2015年 HMZBadge. All rights reserved.
//

import UIKit

class HMZFood: NSObject {
    var diff:String?
    var idstr:String?
    var imageUrl:String?
    var name:String?
    var time:String?
    var url:String?
    
    init(dict: [String:AnyObject]){
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {    }
    
    override var description: String {
        let keys = [ "idstr", "name", "diff", "imageUrl", "time", "url" ]
        return dictionaryWithValuesForKeys(keys).description
    }
    
    class func foods(idstr: String) -> [HMZFood]?{
        var list = [HMZFood]()
        let path = NSBundle.mainBundle().pathForResource("type_\(idstr)_foods.plist", ofType: nil)
        if path != nil {
            let array = NSArray(contentsOfFile: path!)
            array?.enumerateObjectsUsingBlock({ (dict, _, _) -> Void in
                list.append(HMZFood(dict: dict as! [String: AnyObject]))
            })
            return list;
        } else {
            return nil
        }
    }
    
}
