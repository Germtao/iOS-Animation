//
//  BasicAnimationController.swift
//  Animation_Swift
//
//  Created by TAO on 2017/7/25.
//  Copyright © 2017年 Germtao. All rights reserved.
//

import UIKit

class BasicAnimationController: BaseViewController {

    var demoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        operateTitleArray = ["位移", "透明度", "缩放", "旋转", "背景色", "弹簧动画"]
        
        self.createButton(operateTitleArray)
        self.initSubViews()
    }
    
    func initSubViews() {
        
        demoView = UIView.init(frame: CGRect.init(x: kSCREEN_WIDTH / 2 - 50, y: kSCREEN_HEIGHT / 2 - 100, width: 100, height: 100))
        demoView.backgroundColor = UIColor.red;
        self.view.addSubview(demoView)
    }
    
    override func BtnClicked(_ btn: UIButton) {
        
        switch btn.tag {
        case 0:
            // 位移动画
            self.positionAnimation()
        
        case 1:
            // 透明度动画
            self.opacityAnimation()
            
        case 2:
            // 缩放动画
            self.scaleAnimation()
            
        case 3:
            // 旋转动画
            self.rotateAnimation()
            
        case 4:
            // 背景色
            self.backgroundAnimation()
            
        case 5:
            // 弹簧动画
            self.springAnimation()
            
        default: break
        }
    }
    
    // MARK - 位移动画
    func positionAnimation() {
        
        // 1. 使用 CABasicAnimation 创建基础动画
        let anim = CABasicAnimation.init(keyPath: "position")
        anim.fromValue = NSValue.init(cgPoint: CGPoint.init(x: 0.0, y: kSCREEN_HEIGHT / 2 - 75))
        anim.toValue = NSValue.init(cgPoint: CGPoint.init(x: kSCREEN_WIDTH, y: kSCREEN_HEIGHT / 2 - 75))
        anim.duration = 1.0
//        anim.fillMode = kCAFillModeForwards
//        anim.isRemovedOnCompletion = false
        anim.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        demoView.layer.add(anim, forKey: "positionAnimation")
        
        // 2. 使用 UIView Animation Block 调用
//        demoView.frame = CGRect.init(x: 0, y: kSCREEN_HEIGHT / 2 - 50, width: 50, height: 50)
//        UIView.animate(withDuration: 1.0, animations: { 
//            self.demoView.frame = CGRect.init(x: kSCREEN_WIDTH, y: kSCREEN_HEIGHT / 2 - 50, width: 50, height: 50)
//        }) { (true) in
//            self.demoView.frame = CGRect.init(x: kSCREEN_WIDTH / 2 - 25, y: kSCREEN_HEIGHT / 2 - 50, width: 50, height: 50)
//        }
        
        // 3. 使用 UIView [begin, commit] 
//        demoView.frame = CGRect.init(x: 0, y: kSCREEN_HEIGHT / 2 - 50, width: 50, height: 50)
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(1.0)
//        demoView.frame = CGRect.init(x: kSCREEN_WIDTH, y: kSCREEN_HEIGHT / 2 - 50, width: 50, height: 50)
//        UIView.commitAnimations()
    }
    
    // MARK - 透明度动画
    func opacityAnimation() {
        let anim = CABasicAnimation.init(keyPath: "opacity")
        anim.fromValue = NSNumber.init(value: 1.0)
        anim.toValue = NSNumber.init(value: 0.2)
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "opacityAnimation")
        
    }
    
    // MARK - 缩放动画
    func scaleAnimation() {
        
//        let anim = CABasicAnimation.init(keyPath: "bounds")
//        anim.toValue = NSValue.init(cgRect: CGRect.init(x: 0, y: 0, width: 200, height: 200))
//        anim.duration = 1.0
        
        let anim = CABasicAnimation.init(keyPath: "transform.scale") // 同上
        anim.toValue = NSNumber.init(value: 2.0)
        anim.duration = 1.0

//        let anim = CABasicAnimation.init(keyPath: "transform.scale.x")
//        anim.toValue = NSNumber.init(value: 2.0)
//        anim.duration = 1.0
        
        demoView.layer.add(anim, forKey: "scaleAnimation")
        
    }
    
    // MARK - 旋转动画
    func rotateAnimation() {
        
        let anim = CABasicAnimation.init(keyPath: "transform.rotation.z")
        anim.toValue = NSNumber.init(value: Double.pi)
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "rotateAnimation")
    }
    
    // MARK - 背景色动画
    func backgroundAnimation() {
        
        let anim = CABasicAnimation.init(keyPath: "backgroundColor")
        anim.toValue = UIColor.green.cgColor
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "backgroundAnimation")
    }
    
    // MARK - 弹簧动画
    func springAnimation() {
        
        let spring = CASpringAnimation.init(keyPath: "position.x")
        spring.damping = 5 // 阻尼系数 >= 0, Default 10
        spring.stiffness = 100  // 弹性系数
        spring.mass = 1    // 质量
        spring.initialVelocity = 0  // 初始速度
        spring.fromValue = demoView.layer.position.x
        spring.toValue = demoView.layer.position.x + 100
        spring.duration = spring.settlingDuration  // 结算时间
        demoView.layer.add(spring, forKey: "springAnimation")
    }
}
