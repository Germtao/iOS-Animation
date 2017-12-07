//
//  TransitionAnimationController.swift
//  Animation_Swift
//
//  Created by TAO on 2017/7/25.
//  Copyright © 2017年 Germtao. All rights reserved.
//

import UIKit

class TransitionAnimationController: BaseViewController {
    
    var demoView: UIView!
    var demoLabel: UILabel!
    var index: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        operateTitleArray = ["fade", "moveIn", "push", "reveal", "cube", "suck", "oglFlip", "ripple", "Curl", "UnCurl", "caOpen", "caClose", "curlUp"]
        
        self.createButton(operateTitleArray)
        self.initSubViews()
    }

    func initSubViews() {
        
        demoView = UIView.init(frame: CGRect.init(x: kSCREEN_WIDTH / 2 - 90, y: kSCREEN_HEIGHT / 2 - 200, width: 180, height: 260))
        self.view.addSubview(demoView)
        
        demoLabel = UILabel.init(frame: CGRect.init(x: demoView.frame.width / 2 - 10, y: demoView.frame.height / 2 - 20, width: 20, height: 40))
        demoLabel.textAlignment = NSTextAlignment.center
        demoLabel.font = UIFont.systemFont(ofSize: 30)
        demoView.addSubview(demoLabel)
        
        self.changeLabelText(true)
    }
    
    override func BtnClicked(_ btn: UIButton) {
        
        self.changeLabelText(true)
        
        switch btn.tag {
        case 0:
            ///  淡入淡出
            fadeAnimation()
            
        case 1:
            moveInAnimation()
            
        case 2:
            pushAnimation()
            
        case 3:
            revealAnimation()
            
        case 4:
            cubeAnimation()
            
        case 5:
            suckEffectAnimation()
            
        case 6:
            oglFlipAnimation()
            
        case 7:
            rippleEffectAnimation()
            
        case 8:
            pageCurlAnimation()
            
        case 9:
            pageUnCurlAniamtion()
            
        case 10:
            cameraIrisHollowOpenAnimation()
            
        default:
            cameraIrisHollowCloseAnimation()
        }
        
    }
    
    // MARK - 设置 Label 的值
    func changeLabelText(_ isUp: Bool) {
        
        if index > 3 {
            index = 0
        }
        if index < 0 {
            index = 3
        }
        
        let colors = NSArray.init(objects: UIColor.cyan, UIColor.magenta, UIColor.orange, UIColor.purple)
        let titles = NSArray.init(objects: "1", "2", "3", "4")
        
        demoView.backgroundColor = colors.object(at: index) as? UIColor
        demoLabel.text = titles.object(at: index) as? String
        
        if isUp {
            index += 1
        } else {
            index -= 1
        }
        
    }
}

// MARK: - Animation
extension TransitionAnimationController {
    /// 淡入淡出
    func fadeAnimation() {
        let anim = CATransition.init()
        anim.type = kCATransitionFade  // 动画类型
        anim.subtype = kCATransitionFromRight // 动画方向
        //        anim.startProgress = 0.3  // 动画起点
        //        anim.endProgress = 0.8    // 动画终点
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "fadeAnimation")
    }
    
    /// 覆盖
    func moveInAnimation() {
        let anim = CATransition.init()
        anim.type = kCATransitionMoveIn
        anim.subtype = kCATransitionFromRight
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "moveInAnimation")
    }
    
    /// 推挤
    func pushAnimation() {
        let anim = CATransition.init()
        anim.type = kCATransitionPush
        anim.subtype = kCATransitionFromRight
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "pushAnimation")
    }
    
    /// 揭开
    func revealAnimation() {
        let anim = CATransition.init()
        anim.type = kCATransitionReveal
        anim.subtype = kCATransitionFromRight
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "revealAnimation")
    }
    
    /// 立体体
    func cubeAnimation() {
        let anim = CATransition.init()
        anim.type = "cube"
        anim.subtype = kCATransitionFromRight
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "cubeAnimation")
    }
    
    /// 吮吸
    func suckEffectAnimation() {
        let anim = CATransition.init()
        anim.type = "suckEffect"
        anim.subtype = kCATransitionFromRight
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "suckEffectAnimation")
    }
    
    /// 翻转
    func oglFlipAnimation() {
        let anim = CATransition.init()
        anim.type = "oglFlip"
        anim.subtype = kCATransitionFromRight
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "oglFlipAnimation")
    }
    
    /// 波纹
    func rippleEffectAnimation() {
        let anim = CATransition.init()
        anim.type = "rippleEffect"
        anim.subtype = kCATransitionFromRight
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "rippleEffectAnimation")
    }
    
    /// 翻页
    func pageCurlAnimation() {
        let anim = CATransition.init()
        anim.type = "pageCurl"
        anim.subtype = kCATransitionFromRight
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "pageCurlAnimation")
    }
    
    /// 反翻页
    func pageUnCurlAniamtion() {
        let anim = CATransition.init()
        anim.type = "pageUnCurl"
        anim.subtype = kCATransitionFromRight
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "pageUnCurlAnimation")
    }
    
    /// 开镜头
    func cameraIrisHollowOpenAnimation() {
        let anim = CATransition.init()
        anim.type = "cameraIrisHollowOpen"
        anim.subtype = kCATransitionFromRight
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "cameraIrisHollowOpenAnimation")
    }
    
    /// 关镜头
    func cameraIrisHollowCloseAnimation() {
        let anim = CATransition.init()
        anim.type = "cameraIrisHollowClose"
        anim.subtype = kCATransitionFromRight
        anim.duration = 1.0
        demoView.layer.add(anim, forKey: "cameraIrisHollowCloseAnimation")
    }
    
}
