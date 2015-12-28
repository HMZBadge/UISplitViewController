//
//  HMZFoodViewCell.swift
//  iPad-SplitViewController
//
//  Created by 赵志丹 on 15/12/28.
//  Copyright © 2015年 HMZBadge. All rights reserved.
//

import UIKit
private let cellID = "foodCellId"
class HMZFoodViewCell: UITableViewCell {
    
    @IBOutlet weak var iconView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var diffLabel: UILabel!
    
    var food: HMZFood?{
        didSet{
            let url = NSURL(string: food?.imageUrl ?? "")
            if url != nil {
                iconView.sd_setImageWithURL(url!, placeholderImage: UIImage(named: "123"))
            }
            nameLabel.text = food?.name
            timeLabel.text = "时间是: \(food?.time ?? "")"
            diffLabel.text = "难易程度是: \(food?.diff ?? "")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //为什么这里的控件没有初始化: 因为我没有正确加载XIB
        
        iconView.layer.cornerRadius = 40
        iconView.layer.masksToBounds = true
    }

    class func cellWithTableView(tableView: UITableView) -> HMZFoodViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? HMZFoodViewCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("HMZFoodViewCell", owner: nil, options: nil).last as? HMZFoodViewCell
        }
        return cell!
    }
}
