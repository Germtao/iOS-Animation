//
//  BaseViewController.swift
//  Animation_Swift
//
//  Created by TAO on 2017/7/25.
//  Copyright © 2017年 Germtao. All rights reserved.
//

import UIKit

var operateTitleArray: [String] = []

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func createButton (_ array: [String]) {
        
        if  array.count > 0 {
            
            let row: NSInteger = array.count % 4 == 0 ? array.count / 4 : array.count / 4 + 1
            let operateView = UIView.init(frame: CGRect(x: 0.0, y: kSCREEN_HEIGHT - CGFloat(row*50+20) - kTABBAR_HEIGHT - kTABBAR_BOTTOM_HEIGHT, width: kSCREEN_WIDTH, height: CGFloat(row*50+20) + kTABBAR_BOTTOM_HEIGHT))
            operateView.backgroundColor = UIColor.cyan
            self.view.addSubview(operateView)
            
            for i in 0..<array.count {
                
                let button = self.setTitleButton(self.setRectForBtnAtIndex(i, totalNum: array.count), title: array[i])
                button.tag = i;
                button.addTarget(self, action: #selector(BtnClicked), for: UIControlEvents.touchUpInside)
                operateView.addSubview(button)
            }
        }
        
    }
    
    // MARK - Action
    @objc func BtnClicked (_ btn: UIButton) {
        
    }

    // MARK - Helper Method
    func setTitleButton (_ frame: CGRect, title: String) -> UIButton {
        
        let button = UIButton.init(frame: frame)
        button.setTitle(title, for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.backgroundColor = UIColor.lightGray
        return button
    }
    
    func setRectForBtnAtIndex (_ index: NSInteger, totalNum: NSInteger) -> CGRect {
        
        // 每行最多显示4个
        let maxColumnNum: NSInteger = 4
        
        let columnMargin: CGFloat = 20.0 // 每个按钮的列间距
        let rowMargin: CGFloat = 20.0    // 每个按钮的行间距
        
        // 行数
//        let row = totalNum / maxColumnNum
        // 每个按钮的宽度
        let btnW: CGFloat = (kSCREEN_WIDTH - columnMargin * 5) / 4
        // 每个按钮的高度
        let btnH: CGFloat = 30
        
        // 每个按钮的偏移
        let offsetX: CGFloat = columnMargin + CGFloat(index % maxColumnNum) * (btnW + columnMargin)
        let offsetY: CGFloat = rowMargin + CGFloat(index / maxColumnNum) * (btnH + rowMargin)
        
        return CGRect.init(x: offsetX, y: offsetY, width: btnW, height: btnH)
    }
}
