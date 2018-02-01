//
//  LoadingDotsViewController.swift
//  Animation_Swift
//
//  Created by TT on 2018/1/30.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit

class LoadingDotsViewController: UIViewController {
    
    lazy var loadingDots = LoadingDotsView(frame: CGRect(origin: CGPoint(x: view.center.x - 126/2, y: view.center.y - 70), size: CGSize(width: 126, height: 70)))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(loadingDots)
        loadingDots.startAnimation()
    }

    

}
