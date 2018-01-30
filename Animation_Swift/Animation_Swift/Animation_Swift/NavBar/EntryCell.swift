//
//  EntryCell.swift
//  Animation_Swift
//
//  Created by TT on 2018/1/26.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit

let kEntryCellID = "EntryCell"

class EntryCell: UITableViewCell {

    lazy var entryLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(label)
        return label
    }()
    
    lazy var entryView: UIImageView = {
        let imageView = UIImageView()
        contentView.addSubview(imageView)
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.bringSubview(toFront: entryLabel)
        entryLabel.frame = CGRect(x: 12, y: contentView.frame.height - 30, width: contentView.frame.width, height: 30)
        entryView.frame  = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
    }
}
