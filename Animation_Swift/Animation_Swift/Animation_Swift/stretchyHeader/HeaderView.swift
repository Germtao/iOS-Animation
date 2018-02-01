//
//  HeaderView.swift
//  Animation_Swift
//
//  Created by TT on 2018/2/1.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    var iconView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .cyan
        
        iconView = UIImageView(frame: frame)
        iconView.image = UIImage(named: "castle")
        addSubview(iconView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func update() {
        var rect = iconView.frame
        rect.size.height = frame.height
        rect.size.width = frame.width
        iconView.frame = rect
    }
}
