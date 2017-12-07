//
//  GroupAnimationController.swift
//  Animation_Swift
//
//  Created by TAO on 2017/7/25.
//  Copyright © 2017年 Germtao. All rights reserved.
//

import UIKit

class GroupAnimationController: BaseViewController {
    
    var demoView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        operateTitleArray = ["同时", "连续"]
        
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
            // 组动画同时
            self.groupAnimation1()
        default:
            // 组动画连续
            self.groupAnimation2()
        }
    }
    
    // 组动画 - 同时
    func groupAnimation1() {
        
        // 位移动画
        let anim1 = CAKeyframeAnimation.init(keyPath: "position")
        let value0 = NSValue.init(cgPoint: CGPoint.init(x: 0, y: kSCREEN_HEIGHT / 2 - 50))
        let value1 = NSValue.init(cgPoint: CGPoint.init(x: kSCREEN_WIDTH / 3, y: kSCREEN_HEIGHT / 2 - 50))
        let value2 = NSValue.init(cgPoint: CGPoint.init(x: kSCREEN_WIDTH / 3, y: kSCREEN_HEIGHT / 2 + 50))
        let value3 = NSValue.init(cgPoint: CGPoint.init(x: kSCREEN_WIDTH * 2 / 3, y: kSCREEN_HEIGHT / 2 + 50))
        let value4 = NSValue.init(cgPoint: CGPoint.init(x: kSCREEN_WIDTH * 2 / 3, y: kSCREEN_HEIGHT / 2 - 50))
        let value5 = NSValue.init(cgPoint: CGPoint.init(x: kSCREEN_WIDTH, y: kSCREEN_HEIGHT / 2 - 50))
        anim1.values = [value0, value1, value2, value3, value4, value5]
        
        // 缩放动画
        let anim2 = CABasicAnimation.init(keyPath: "transform.scale")
        anim2.fromValue = NSNumber.init(value: 0.8)
        anim2.toValue = NSNumber.init(value: 2.0)
        
        // 旋转动画
        let anim3 = CABasicAnimation.init(keyPath: "transform.rotation")
        anim3.toValue = NSNumber.init(value: Double.pi * 4)
        
        // 组动画
        let groupAnim = CAAnimationGroup.init()
        groupAnim.animations = [anim1, anim2, anim3]
        groupAnim.duration = 4.0
        demoView.layer.add(groupAnim, forKey: "groupAnimation")
    }

    // MARK - 组动画 - 连续
    func groupAnimation2() {
        
        let currentTime = CACurrentMediaTime()
        
        // 位移动画
        let anim1 = CABasicAnimation.init(keyPath: "position")
        anim1.fromValue = NSValue.init(cgPoint: CGPoint.init(x: 0, y: kSCREEN_HEIGHT / 2 - 75))
        anim1.toValue = NSValue.init(cgPoint: CGPoint.init(x: kSCREEN_WIDTH / 2, y: kSCREEN_HEIGHT / 2 - 75))
        anim1.beginTime = currentTime
        anim1.duration = 1.0
        anim1.fillMode = kCAFillModeForwards
        anim1.isRemovedOnCompletion = false
        demoView.layer.add(anim1, forKey: "positionAnimatio")
        
        // 缩放动画
        let anim2 = CABasicAnimation.init(keyPath: "transform.scale")
        anim2.fromValue = NSNumber.init(value: 0.8)
        anim2.toValue = NSNumber.init(value: 2.0)
        anim2.beginTime = currentTime + 1.0
        anim2.duration = 1.0
        anim2.fillMode = kCAFillModeForwards
        anim2.isRemovedOnCompletion = false
        demoView.layer.add(anim2, forKey: "scaleAnimation")
        
        // 旋转动画
        let anim3 = CABasicAnimation.init(keyPath: "transform.rotation")
        anim3.toValue = NSNumber.init(value: Double.pi * 4)
        anim3.beginTime = currentTime + 2.0
        anim3.duration = 1.0
        anim3.fillMode = kCAFillModeForwards
        anim3.isRemovedOnCompletion = false
        demoView.layer.add(anim3, forKey: "rotateAnimation")
    }
}
