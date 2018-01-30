//
//  LockScreenViewController.swift
//  Animation_Swift
//
//  Created by TT on 2018/1/30.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit

class LockScreenViewController: UIViewController {
    
    lazy var toplockView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "toplock")
        view.addSubview(imageView)
        return imageView
    }()
    
    lazy var bottomlockView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bottomlock")
        view.addSubview(imageView)
        return imageView
    }()
    
    lazy var lockborderView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lockborder")
        view.addSubview(imageView)
        return imageView
    }()
    
    lazy var lockkeyholeView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lockkeyhole")
        view.addSubview(imageView)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toplockView.frame = CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: (kSCREEN_HEIGHT - kNAVIBAR_HEIGHT) / 2)
        bottomlockView.frame = CGRect(x: 0, y: (kSCREEN_HEIGHT - kNAVIBAR_HEIGHT) / 2, width: kSCREEN_WIDTH, height: (kSCREEN_HEIGHT - kNAVIBAR_HEIGHT) / 2)
        lockborderView.frame = CGRect(x: view.center.x - 110 / 2, y: toplockView.frame.maxY - 110 / 2, width: 110, height: 110)
        lockkeyholeView.frame = CGRect(x: view.center.x - 70 / 2, y: toplockView.frame.maxY - 70 / 2, width: 70, height: 70)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        openLock()
    }
    
    func openLock() {
        UIView.animate(withDuration: 1, delay: 2, options: [], animations: {
            self.lockkeyholeView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        }) { (_) in
            UIView.animate(withDuration: 1, delay: 2, options: [], animations: {
                
                let yDetal = self.toplockView.frame.maxY
                
                self.toplockView.center.y -= yDetal
                self.bottomlockView.center.y += yDetal
                self.lockborderView.center.y -= yDetal
                self.lockkeyholeView.center.y -= yDetal
                
            }, completion: { (_) in
                self.toplockView.removeFromSuperview()
                self.bottomlockView.removeFromSuperview()
                self.lockborderView.removeFromSuperview()
                self.lockkeyholeView.removeFromSuperview()
            })
        }
    }
}
