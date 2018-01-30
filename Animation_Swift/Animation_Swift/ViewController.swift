//
//  ViewController.swift
//  Animation_Swift
//
//  Created by TAO on 2017/7/25.
//  Copyright © 2017年 Germtao. All rights reserved.
//

import UIKit

var titles: [String] = []

class ViewController: UIViewController {
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        
        initSubViews()
    }
    
    // MARK - Helper Func
    func setMessageLabel(_ messageLabel: UILabel, frame: CGRect, text: String, textColor: UIColor, numberOfLines: Int, textAlignment: NSTextAlignment, font: UIFont) {
        
        messageLabel.frame = frame
        messageLabel.text = text
        messageLabel.textColor = textColor
        messageLabel.numberOfLines = numberOfLines
        messageLabel.textAlignment = textAlignment
        messageLabel.font = font
        messageLabel.sizeToFit()
    }
    
    func setCellWithData(_ cell: UITableViewCell, title: String) {
        
        cell.textLabel?.text = title;
    }
    
    // MARK - Private Method
    private func initData() {
        titles = ["基础动画", "关键帧动画", "组动画", "过渡动画", "仿射变换"]
    }

    private func initSubViews() {
        let frame: CGRect = CGRect.init(x: 0, y: 0, width: kSCREEN_WIDTH, height: kSAFEAREA_HEIGHT)
        tableView = UITableView.init(frame: frame, style: UITableViewStyle.plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0)
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if titles.count != 0 {
            return titles.count
        } else {
            let messageLabel: UILabel = UILabel()
            
            setMessageLabel(messageLabel, frame: CGRect.init(x: 0, y: 20, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT - 20), text: "没有数据", textColor: UIColor.black, numberOfLines: 0, textAlignment: NSTextAlignment.center, font: UIFont.init(name: "Palatino-Italic", size: 20)!)
            
            self.tableView.backgroundView = messageLabel
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID: String = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        
        setCellWithData(cell!, title: titles[(indexPath as NSIndexPath).row])
        
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        var vc = BaseViewController()
        
        switch indexPath.row {
        case 0:
            vc = BasicAnimationController()
        case 1:
            vc = KeyFrameAnimationController()
        case 2:
            vc = GroupAnimationController()
        case 3:
            vc = TransitionAnimationController()
        case 4:
            vc = AffineTransformController()
        default:
            break
        }
        vc.title = titles[indexPath.row]
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

