//
//  MasterViewController.swift
//  Animation_Swift
//
//  Created by TT on 2018/1/24.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit

/// 屏幕缩放比, 以 iPhone6 为
let kScreenWidthScale  = kSCREEN_WIDTH / 375
let kScreenHeightScale = kSCREEN_HEIGHT / 667

/// 左视图出现需要拖动的距离
let paddingSpaceToLeftEdge = 80 * kScreenWidthScale
/// 显示出来的左视图的右边缘距离屏幕的宽度
let marginToRightEdge  = 80 * kScreenWidthScale

let leftSideContainerViewOffsetX = -220 * kScreenWidthScale
let masterContainerViewOffsetX   = 305 * kScreenWidthScale

class MasterViewController: UIViewController {
    
    var masterContainerView: UIView!
    
    var leftSideContainerView: UIView!
    
    var isLeftSideViewShow: Bool = false
    
    
    lazy var leftMaskView: UIView = {
        let leftmask = UIView()
        leftmask.backgroundColor = UIColor.black
        return leftmask
    }()
    
    lazy var masterMaskView: UIView = {
        let masterMask = UIView()
        masterMask.backgroundColor = UIColor.black
        masterMask.isHidden = true
        return masterMask
    }()
    
    lazy var tap: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(respondsToTap(_:)))
        return tap
    }()
    
    lazy var leftScreenEdgePan: UIScreenEdgePanGestureRecognizer = {
        let pan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(respondsToPan(_:)))
        pan.edges = .left
        return pan
    }()
    
    lazy var pan = UIPanGestureRecognizer(target: self, action: #selector(respondsToPan(_:)))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let leftVC = LeftViewController()
        leftVC.view.backgroundColor = UIColor.cyan
        leftSideContainerView = leftVC.view
        leftSideContainerView.frame = CGRect(x: 0, y: 0, width: kSCREEN_WIDTH - marginToRightEdge, height: kSCREEN_HEIGHT)
        view.addSubview(leftSideContainerView)
        
        let vc = UINavigationController(rootViewController: ViewController())
        vc.view.backgroundColor = UIColor.red
        masterContainerView = vc.view
        masterContainerView.frame = view.bounds
        view.addSubview(masterContainerView)

        leftMaskView.frame = CGRect(x: 0, y: 0, width: leftSideContainerView.frame.width, height: leftSideContainerView.frame.height)
        leftSideContainerView.addSubview(leftMaskView)
        
        masterMaskView.frame = CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT)
        masterContainerView.addSubview(masterMaskView)
        
        masterMaskView.addGestureRecognizer(tap)
        view.addGestureRecognizer(leftScreenEdgePan)
        
        leftSideContainerView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        leftSideContainerView.transform = leftSideContainerView.transform.concatenating(CGAffineTransform(translationX: leftSideContainerViewOffsetX, y: 0))
    }
}

// MARK: - 手势事件处理
extension MasterViewController {
    
    /// 点击手势
    @objc private func respondsToTap(_ tap: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    /// 滑动手势
    @objc private func respondsToPan(_ pan: UIPanGestureRecognizer) {
        
        let translationPoint = pan.translation(in: masterMaskView)
        var translationX : CGFloat?
        
        /// 建立静态变量
        
        switch pan.state {
        case .began:
            translationX = translationPoint.x
            
            //从左往右拖的时候拖出了左视图显示时的宽度
            if abs(translationX!) > kSCREEN_WIDTH - marginToRightEdge {
                return
            }
            //caculator the factor
            var factor = translationX! / (kSCREEN_WIDTH - marginToRightEdge)
            
            //从左往右滑的情况,系数需要作调整
            if isLeftSideViewShow {
                factor = 1 + factor
            }
            
            /// 从右往左拖了一点后立刻往右拖的情况
            if isLeftSideViewShow {
                if translationX! > 0 {
                    showLeftContainerViewAnimated(animated: false, completion: nil)
                    
                    return
                }
            }
            /// 从左往右拖了一点后立刻往左拖的情况
            else {
                if translationX! < 0 {
                    
                    hideLeftContainerViewAnimated(animated: false, completion: nil)
                    return
                }
            }
            
            //由于scale一开始就是0.5倍，所以相应的乘以0.5
            leftSideContainerView.transform = CGAffineTransform(translationX: leftSideContainerViewOffsetX * (1 - factor) * 0.5, y: 0)
            //由0.5 -> 1
            leftSideContainerView.transform = leftSideContainerView.transform.concatenating(CGAffineTransform(scaleX: 0.5 + 0.5 * factor, y: 0.5 + 0.5 * factor))
            //1 -> 0
            leftMaskView.alpha = 1 - factor
            //1 -> 0.9
            self.masterContainerView.transform = CGAffineTransform(scaleX: 1 - 0.1 * factor, y: 1 - 0.1 * factor)
            //做一些偏移
            self.masterContainerView.transform = masterContainerView.transform.concatenating(CGAffineTransform(translationX: masterContainerViewOffsetX * factor, y: 0))
            //0 -> 0.5
            self.masterMaskView.alpha = 0.5 * factor
            
        case .ended:
            translationX = abs(translationPoint.x)
            
            let velocity = pan.velocity(in: view)
            
            //如果滑动结束时，水平速度的方向向右
            if velocity.x > 0 {
                showLeftContainerViewAnimated(animated: true, completion: nil)
            }
            else if velocity.x < 0{
                hideLeftContainerViewAnimated(animated: true, completion: nil)
            }
                //不知为什么，触发ScreenEdgePan的时候velocity为0，所以我做了以下判断，有发现原因的开发者可以告知我一下
            else {
                if translationX! > paddingSpaceToLeftEdge {
                    showLeftContainerViewAnimated(animated: true, completion: nil)
                }
                else {
                    hideLeftContainerViewAnimated(animated: true, completion: nil)
                }
            }
        default:
            break
        }
        
    }
}

// MARK: - Animation
extension MasterViewController {
    
    /// 动画显示 左视图
    private func showLeftContainerViewAnimated(animated: Bool, completion: (()->())?) {
        let duration = animated ? 0.3 : 0
        
        UIView.animate(withDuration: duration, animations: {
            
            self.leftSideContainerView.transform = CGAffineTransform.identity
            
//            self.masterContainerView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
//            self.masterContainerView.transform = self.masterContainerView.transform.concatenating(CGAffineTransform(translationX: masterContainerViewOffsetX, y: 0))
            self.masterContainerView.transform = CGAffineTransform(translationX: masterContainerViewOffsetX, y: 0)
            
            self.leftMaskView.alpha = 0
            self.masterMaskView.alpha = 0.5
            
        }) { (_) in
            self.leftMaskView.isHidden = true
            self.masterMaskView.isHidden = false
            self.isLeftSideViewShow = true
            self.view.removeGestureRecognizer(self.leftScreenEdgePan)
            self.masterMaskView.addGestureRecognizer(self.pan)
        }
    }
    
    /// 动画隐藏 左视图
    private func hideLeftContainerViewAnimated(animated: Bool, completion: (()->())?) {
        let duration = animated ? 0.3 : 0
        
        UIView.animate(withDuration: duration, animations: {
            
            self.leftSideContainerView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.leftSideContainerView.transform = self.leftSideContainerView.transform.concatenating(CGAffineTransform(translationX: leftSideContainerViewOffsetX, y: 0))
            
            self.masterContainerView.transform = CGAffineTransform.identity
            
            self.leftMaskView.alpha = 1
            self.masterMaskView.alpha = 0
            
        }) { (_) in
            self.leftMaskView.isHidden = false
            self.masterMaskView.isHidden = true
            self.isLeftSideViewShow = false
            self.view.addGestureRecognizer(self.leftScreenEdgePan)
            self.masterMaskView.removeGestureRecognizer(self.pan)
        }
    }
    
}
