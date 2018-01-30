//
//  AnnotationView.swift
//  Animation_Swift
//
//  Created by TT on 2018/1/30.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit
import MapKit

class AnnotationView: MKAnnotationView {
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        startAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AnnotationView {
    
    /// 声纳
    private func sonar(_ beginTime: CFTimeInterval) {
        
        // 最小的圆圈
        let circlePath1 = UIBezierPath(arcCenter: center, radius: CGFloat(3), startAngle: CGFloat(0), endAngle: CGFloat.pi * 2, clockwise: true)
        
        // 最大的圆圈
        let circlePath2 = UIBezierPath(arcCenter: center, radius: CGFloat(80), startAngle: CGFloat(0), endAngle: CGFloat.pi * 2, clockwise: true)
        
        // 配置layer
        let shaperLayer = CAShapeLayer()
        shaperLayer.strokeColor = UI.Color.green.cgColor
        shaperLayer.fillColor   = UI.Color.green.cgColor
        shaperLayer.path = circlePath1.cgPath
        layer.addSublayer(shaperLayer)
        
        // path animation.
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = circlePath1.cgPath
        pathAnimation.toValue   = circlePath2.cgPath
        
        // alpha animation.
        let alphaAnimation = CABasicAnimation(keyPath: "opacity")
        alphaAnimation.fromValue = 0.8
        alphaAnimation.toValue   = 0
        
        // group animation
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 2
        groupAnimation.beginTime = beginTime
        groupAnimation.repeatCount = MAXFLOAT
        groupAnimation.animations = [pathAnimation, alphaAnimation]
        groupAnimation.isRemovedOnCompletion = false
        groupAnimation.fillMode = kCAFillModeForwards
        
        shaperLayer.add(groupAnimation, forKey: "sonarAnimation")
    }
    
    func startAnimation() {
        sonar(CACurrentMediaTime())
        sonar(CACurrentMediaTime() + 0.56)
        sonar(CACurrentMediaTime() + 1.44)
    }
}
