//
//  LoadingDotsView.swift
//  Animation_Swift
//
//  Created by TT on 2018/1/30.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit

class LoadingDotsView: UIView {

    var mainView: UIStackView!
    var topView: UIStackView!
    var bottomView: UIStackView!
    
    var logoView: UIImageView!
    var leftDot: UIImageView!
    var centerDot: UIImageView!
    var rightDot: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - 设置UI
extension LoadingDotsView {
    
    private func setupUI() {
        
        mainView = UIStackView(frame: CGRect(x: 20, y: 20, width: 126, height: 70))
        mainView.axis = .vertical
        addSubview(mainView)
        
        topView = UIStackView(frame: CGRect(x: 0, y: 0, width: 126, height: 34))
        topView.axis = .horizontal
        mainView.addSubview(topView)
        
        logoView = UIImageView(frame: CGRect(x: 0, y: 0, width: 126, height: 34))
        logoView.image = UIImage(named: "logo")
        topView.addSubview(logoView)
        
        bottomView = UIStackView(frame: CGRect(x: 42, y: 60, width: 42, height: 10))
        bottomView.axis = .horizontal
        bottomView.spacing = 6
        mainView.addSubview(bottomView)
        
        leftDot = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        leftDot.image = UIImage(named: "dot")
        bottomView.insertSubview(leftDot, at: 0)
        
        centerDot = UIImageView(frame: CGRect(x: 16, y: 0, width: 10, height: 10))
        centerDot.image = UIImage(named: "dot")
        bottomView.insertSubview(centerDot, at: 1)
        
        rightDot = UIImageView(frame: CGRect(x: 32, y: 0, width: 10, height: 10))
        rightDot.image = UIImage(named: "dot")
        bottomView.insertSubview(rightDot, at: 2)
    }
    
    /// 动画
    private func animation(delay: TimeInterval, animView: UIView) {
        UIView.animate(withDuration: 0.5, delay: delay, options: [.repeat, .autoreverse], animations: {
            animView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

// MARK: - 开始动画
extension LoadingDotsView {
    
    /// 开始动画
    public func startAnimation() {
        // 由小至大
        leftDot.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        centerDot.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        rightDot.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        animation(delay: 0, animView: leftDot)
        animation(delay: 0.2, animView: centerDot)
        animation(delay: 0.4, animView: rightDot)
    }
}
