//
//  NavBarAnimationController.swift
//  Animation_Swift
//
//  Created by TT on 2018/1/26.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit

class NavBarAnimationController: UIViewController {
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kTABBAR_BOTTOM_HEIGHT, right: 0)
        view.addSubview(table)
        
        table.register(EntryCell.self, forCellReuseIdentifier: kEntryCellID)
        
        return table
    }()
    
    var entries = [
        Entry(title: "留恋雨夜幕雨中一角", image: UIImage(named: "one")!),
        Entry(title: "延续我要送你归家的路", image: UIImage(named: "two")!),
        Entry(title: "夜静的街中　歌声中", image: UIImage(named: "three")!),
        Entry(title: "是一个个热吻", image: UIImage(named: "four")!),
        Entry(title: "谁令到我心加速跳动", image: UIImage(named: "five")!),
        Entry(title: "甜丝丝溢自你的嘴角", image: UIImage(named: "six")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.frame = CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT - kNAVIBAR_HEIGHT)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
//        setStatusBarBackgroundColor(UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1))
    }
    
    func setStatusBarBackgroundColor(_ color: UIColor) {
        guard let statusBar = (UIApplication.shared.value(forKey: "statusBarWindow") as AnyObject).value(forKey: "statusBar") as? UIView else { return }
        statusBar.backgroundColor = color
    }
}

extension NavBarAnimationController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kEntryCellID, for: indexPath) as! EntryCell
        
        let entry = entries[indexPath.row]
        
        cell.entryLabel.text = entry.title
        cell.entryView.image = entry.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
