//
//  KeyFrameAnimationController.swift
//  Animation_Swift
//
//  Created by TAO on 2017/7/25.
//  Copyright © 2017年 Germtao. All rights reserved.
//

import UIKit

class KeyFrameAnimationController: BaseViewController {
    
    var demoView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        operateTitleArray = ["关键帧", "路径", "抖动"]
        
        self.createButton(operateTitleArray)
        self.initSubViews()
    }
    
    // MARK -
    func initSubViews() {
        
        demoView = UIView.init(frame: CGRect.init(x: kSCREEN_WIDTH / 2 - 50, y: kSCREEN_HEIGHT / 2 - 100, width: 100, height: 100))
        demoView.backgroundColor = UIColor.red;
        self.view.addSubview(demoView)
    }
    
    override func BtnClicked(_ btn: UIButton) {
        
        switch btn.tag {
        case 0:
            // 关键帧动画
            self.keyFrameAnimation()
            
        case 1:
            // 路径动画
            self.pathAnimatio()
            
        case 2:
            // 抖动效果
            self.shakeAnimation()
            
        default:
            break
        }
        
    }
    
    // MARK - 关键帧动画
    func keyFrameAnimation() {
        
        let anim = CAKeyframeAnimation.init(keyPath: "position")
        let value0 = NSValue.init(cgPoint: CGPoint.init(x: 0, y: kSCREEN_HEIGHT / 2 - 50))
        let value1 = NSValue.init(cgPoint: CGPoint.init(x: kSCREEN_WIDTH / 3, y: kSCREEN_HEIGHT / 2 - 50))
        let value2 = NSValue.init(cgPoint: CGPoint.init(x: kSCREEN_WIDTH / 3, y: kSCREEN_HEIGHT / 2 + 50))
        let value3 = NSValue.init(cgPoint: CGPoint.init(x: kSCREEN_WIDTH * 2 / 3, y: kSCREEN_HEIGHT / 2 + 50))
        let value4 = NSValue.init(cgPoint: CGPoint.init(x: kSCREEN_WIDTH * 2 / 3, y: kSCREEN_HEIGHT / 2 - 50))
        let value5 = NSValue.init(cgPoint: CGPoint.init(x: kSCREEN_WIDTH, y: kSCREEN_HEIGHT / 2 - 50))
        
        anim.values = [value0, value1, value2, value3, value4, value5]
        anim.duration = 2.0
        anim.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        anim.delegate = self
        demoView.layer.add(anim, forKey: "keyFrameAnimation")
    }

    // MARK - Path 动画
    func pathAnimatio() {
        
        let anim = CAKeyframeAnimation.init(keyPath: "position")
        
        let path = UIBezierPath.init(ovalIn: CGRect.init(x: kSCREEN_WIDTH / 2 - 100, y: kSCREEN_HEIGHT / 2 - 100, width: 200, height: 200))
        
        anim.path = path.cgPath
        anim.duration = 2.0
        demoView.layer.add(anim, forKey: "pathAnimation")
    }
    
    // MARK - 抖动效果
    func shakeAnimation() {
        
        let anim = CAKeyframeAnimation.init(keyPath: "transform.rotation")
        
        let value1 = NSNumber.init(value: -(Double.pi / 180 * 4))
        let value2 = NSNumber.init(value: Double.pi / 180 * 4)
        let value3 = NSNumber.init(value: -(Double.pi / 180 * 4))
        
        anim.values = [value1, value2, value3]
        anim.repeatCount = MAXFLOAT
        
        demoView.layer.add(anim, forKey: "shakeAnimation")
    }
}

// MARK: - CAAnimationDelegate
extension KeyFrameAnimationController: CAAnimationDelegate {
    
    func animationDidStart(_ anim: CAAnimation) {
        print("Did Start Animate")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("Did Stop Animate")
    }
}
