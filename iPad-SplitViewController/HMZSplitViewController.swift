//
//  HMZSplitViewController.swift
//  iPad-SplitViewController
//
//  Created by 赵志丹 on 15/12/28.
//  Copyright © 2015年 HMZBadge. All rights reserved.
//

import UIKit

class HMZSplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let masterVc = childViewControllers[0].childViewControllers[0] as? HMZMasterViewController
        let detailVc = childViewControllers[1].childViewControllers[0] as? HMZDetailViewController
        
        masterVc?.foodTypeDelegate = detailVc
        delegate = detailVc
    }
}
