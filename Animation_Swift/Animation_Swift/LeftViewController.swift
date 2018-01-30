//
//  LeftViewController.swift
//  Animation_Swift
//
//  Created by TT on 2018/1/24.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.backgroundColor =  UIColor.white
        table.contentInset = UIEdgeInsetsMake(10, 0, 10, 0)
        table.tableFooterView = UIView()
        table.delegate = self
        table.dataSource = self
        view.addSubview(table)
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        
        return table
    }()
    
    lazy var dataSource = [
        "NavBarAnimation",
        "LockScreenAnimation",
        "MapLocationAnimation",
        "LoadingDotsAnimation",
        "UnderlineAnimation",
        "StretchyHeaderAnimation",
        "ProgressAnimation",
        "GradientAnimation",
        "PullToRefreshAnimation",
        "SecretTextAnimation",
        "GifAnimation"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: kSAFEAREA_HEIGHT)
        
//        navigationController?.hidesBarsOnSwipe = true
    }
    
    let gray = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
    }
}

extension LeftViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        var vc = UIViewController()
        
        switch indexPath.row {
        case 0:
            vc = NavBarAnimationController()
        default:
            break
        }
        
        vc.title = dataSource[indexPath.row]
        vc.hidesBottomBarWhenPushed = true
        vc.view.backgroundColor = view.backgroundColor
        navigationController?.pushViewController(vc, animated: true)
    }
}
