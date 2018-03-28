//
//  ProgressView.swift
//  Animation_Swift
//
//  Created by TT on 2018/2/1.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit

class ProgressView: UIView {

    struct Color {
        static let teal   = UIColor(red:0.27, green:0.80, blue:0.80, alpha:1.0)
        static let orange = UIColor(red:0.90, green:0.59, blue:0.20, alpha:1.0)
        static let pink   = UIColor(red:0.98, green:0.12, blue:0.45, alpha:1.0)
    }
    
    var centerView: UIView!
    var progressLabel: UILabel!
    var precentLabel: UILabel!
    var titleLable: UILabel!
    
    let progressLayer = CAShapeLayer()
    /// 梯度图层
    let gradientLayer = CAGradientLayer()
    
    var range: CGFloat = 128
    var currentValue: CGFloat = 0 {
        didSet {
            animateStroke()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createUI()
        setupLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setupLayer()
    }
}

extension ProgressView {
    
    func createUI() {
        
        centerView = UIView(frame: CGRect(x: (frame.width - 100) / 2, y: (frame.height - 80) / 2, width: 100, height: 80))
        centerView.backgroundColor = UIColor.red
        addSubview(centerView)
        
        progressLabel = UILabel(frame: CGRect(x: 3, y: 0, width: 50, height: 64))
        progressLabel.text = "0"
        progressLabel.font = UIFont.systemFont(ofSize: 24)
        progressLabel.textAlignment = .right
        centerView.addSubview(progressLabel)
        
        precentLabel = UILabel(frame: CGRect(x: 37, y: 0, width: 20, height: 64))
        precentLabel.text = "%"
        progressLabel.font = UIFont.systemFont(ofSize: 24)
        centerView.addSubview(precentLabel)
        
        titleLable = UILabel(frame: CGRect(x: 5, y: 60, width: 50, height: 16))
        titleLable.text = "GALLON"
        titleLable.textColor = UIColor.lightGray
        titleLable.font = UIFont.systemFont(ofSize: 12)
        titleLable.textAlignment = .center
        centerView.addSubview(titleLable)
    }
    
    /// 设置layer
    func setupLayer() {
        
        progressLayer.position  = .zero
        progressLayer.lineWidth = 3
        progressLayer.strokeEnd = 0
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.black.cgColor
        
        let radius = CGFloat(bounds.height / 2) - progressLayer.lineWidth
        let startAngle = CGFloat.pi / 2
        let endAngle = CGFloat.pi * 3 / 2
        let width = bounds.width
        let height = bounds.height
        let modelCenter = CGPoint(x: width / 2, y: height / 2)
        
        let path = UIBezierPath(arcCenter: modelCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        progressLayer.path = path.cgPath
        layer.addSublayer(progressLayer)
        
        /// 梯度图层
        gradientLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        gradientLayer.colors = [Color.teal, Color.orange, Color.pink]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.mask = progressLayer
        layer.addSublayer(gradientLayer)
    }
    
    func animateStroke() {
        let fromValue = progressLayer.strokeEnd
        let toValue = currentValue / range
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = fromValue
        animation.toValue = toValue
        
        progressLayer.add(animation, forKey: "stroke")
        progressLayer.strokeEnd = toValue
    }
}
