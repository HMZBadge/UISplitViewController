//
//  HMZColorViewController.swift
//  iPad-SplitViewController
//
//  Created by 赵志丹 on 15/12/29.
//  Copyright © 2015年 HMZBadge. All rights reserved.
//

import UIKit

class HMZColorViewController: UIViewController {

    @IBOutlet weak var colorWheelView: UIImageView!
    
    var selectColorBlock: ((color: UIColor) ->())?
    
    init(selectColorBlock: (color: UIColor) ->()) {
        super.init(nibName: nil, bundle: nil)
        self.selectColorBlock = selectColorBlock
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let point = touches.first?.locationInView(view)
        let color = colorWheelView.image?.pixelColorAtLocation(point!)
        selectColorBlock?(color: color!)
    }
}
