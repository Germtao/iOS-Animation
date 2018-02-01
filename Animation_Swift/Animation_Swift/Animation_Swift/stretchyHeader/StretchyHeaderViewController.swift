//
//  StretchyHeaderViewController.swift
//  Animation_Swift
//
//  Created by TT on 2018/2/1.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit

class StretchyHeaderViewController: UIViewController {
    
    var tableView: UITableView!
    let tableHeaderH: CGFloat = 300
    var headerView: HeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
}

extension StretchyHeaderViewController {
    
    private func createUI() {
        
        let header = HeaderView(frame: CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: tableHeaderH))
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = header
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        view.addSubview(tableView)
        
        createTableHeader()
        tableView.contentInset  = UIEdgeInsetsMake(tableHeaderH, 0, 0, 0)
        tableView.contentOffset = CGPoint(x: 0, y: -tableHeaderH)
        updateHeaderView()
    }
    
    private func createTableHeader() {
        headerView = tableView.tableHeaderView as! HeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
    }
    
}

extension StretchyHeaderViewController {
    
    private func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -tableHeaderH, width: kSCREEN_WIDTH, height: tableHeaderH)
        if tableView.contentOffset.y < -tableHeaderH {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
            headerRect.size.width = kSCREEN_WIDTH - tableView.contentOffset.y - tableHeaderH
        }
        headerView.frame = headerRect
        headerView.update()
    }
}

extension StretchyHeaderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
}
