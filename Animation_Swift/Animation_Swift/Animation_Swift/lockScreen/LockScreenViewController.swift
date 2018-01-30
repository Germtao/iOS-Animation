//
//  LockScreenViewController.swift
//  Animation_Swift
//
//  Created by TT on 2018/1/30.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit

class LockScreenViewController: UIViewController {
    
    var toplockView: UIImageView!
    
    var bottomlockView: UIImageView!
    
    var lockborderView: UIImageView!
    
    var lockkeyholeView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = UIColor.purple
        openLock()
    }
    
    func openLock() {
        UIView.animate(withDuration: 1, delay: 2, options: .curveEaseInOut, animations: { [weak self] in
            self?.lockkeyholeView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        }) { (_) in
            UIView.animate(withDuration: 1, delay: 2, options: [], animations: { [weak self] in
                
                guard let yDetal = self?.toplockView.frame.maxY else { return }
                
                self?.toplockView.center.y -= yDetal
                self?.bottomlockView.center.y += yDetal
                self?.lockborderView.center.y -= yDetal
                self?.lockkeyholeView.center.y -= yDetal
                
            }, completion: { (_) in
                self.toplockView.removeFromSuperview()
                self.bottomlockView.removeFromSuperview()
                self.lockborderView.removeFromSuperview()
                self.lockkeyholeView.removeFromSuperview()
            })
        }
    }
}

// MARK: - 创建 UI
extension LockScreenViewController {
    
    func createUI() {
        
        toplockView = createView(imageName: "toplock")
        toplockView.frame = CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: (kSCREEN_HEIGHT - kNAVIBAR_HEIGHT) / 2)
        view.addSubview(toplockView)
        
        bottomlockView = createView(imageName: "bottomlock")
        bottomlockView.frame = CGRect(x: 0, y: (kSCREEN_HEIGHT - kNAVIBAR_HEIGHT) / 2, width: kSCREEN_WIDTH, height: (kSCREEN_HEIGHT - kNAVIBAR_HEIGHT) / 2)
        view.addSubview(bottomlockView)
        
        lockborderView = createView(imageName: "lockborder")
        lockborderView.frame = CGRect(x: view.center.x - 110 / 2, y: toplockView.frame.maxY - 110 / 2, width: 110, height: 110)
        view.addSubview(lockborderView)
        
        lockkeyholeView = createView(imageName: "lockkeyhole")
        lockkeyholeView.frame = CGRect(x: view.center.x - 70 / 2, y: toplockView.frame.maxY - 70 / 2, width: 70, height: 70)
        view.addSubview(lockkeyholeView)
    }
    
    private func createView(imageName: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        return imageView
    }
    
}
