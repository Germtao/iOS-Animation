//
//  AffineTransformController.swift
//  Animation_Swift
//
//  Created by TAO on 2017/7/25.
//  Copyright © 2017年 Germtao. All rights reserved.
//

import UIKit

class AffineTransformController: BaseViewController {

    var demoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        operateTitleArray = ["位移", "缩放", "旋转", "组合", "反转"]
        
        self.createButton(operateTitleArray)
        self.initSubViews()
    }
    
    func initSubViews() {
        
        demoView = UIView.init(frame: CGRect.init(x: kSCREEN_WIDTH / 2 - 50, y: kSCREEN_HEIGHT / 2 - 100, width: 100, height: 100))
        demoView.backgroundColor = UIColor.red;
        self.view.addSubview(demoView)
    }
    
    override func BtnClicked(_ btn: UIButton) {
        
        demoView.transform = CGAffineTransform.identity
        
        switch btn.tag {
        case 0:
            self.positionAnimation()
            
        case 1:
            self.scaleAnimation()
            
        case 2:
            self.rotateAnimation()
            
        case 3:
            self.combinationAnimation()
            
        default:
            self.invertAnimation()
        }
    }
    
    // MARK - Animation
    func positionAnimation() {
        
        UIView.animate(withDuration: 1.0) { 
            self.demoView.transform = CGAffineTransform.init(translationX: 100, y: 100)
        }
    }
    
    func scaleAnimation() {
        
        UIView.animate(withDuration: 1.0) { 
            self.demoView.transform = CGAffineTransform.init(scaleX: 2, y: 2)
        }
    }
    
    func rotateAnimation() {
        
        UIView.animate(withDuration: 1.0) { 
            self.demoView.transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi))
        }
    }
    
    // 仿射变换的组合使用
    func combinationAnimation() {
        
        UIView.animate(withDuration: 1.0) { 
            
            let transform1 = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi))
            let transform2 = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
            let transform3 = transform1.concatenating(transform2)
            
            let transform4 = CGAffineTransform.init(translationX: 100, y: 100)
            
            self.demoView.transform = transform3.concatenating(transform4)
        }
    }
    
    // 矩阵反转
    func invertAnimation() {
        
        UIView.animate(withDuration: 1.0) {
            
            let transform = CGAffineTransform.init(scaleX: 2, y: 2)
            
            self.demoView.transform = transform.inverted()
        }
    }
}
