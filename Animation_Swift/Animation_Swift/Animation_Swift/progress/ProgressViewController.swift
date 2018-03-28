//
//  ProgressViewController.swift
//  Animation_Swift
//
//  Created by TT on 2018/2/1.
//  Copyright © 2018年 ShaggyT. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    
    var titleLabel: UILabel!
    
    var progressView: ProgressView!
    
    var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configuration()
    }
}

extension ProgressViewController {
    
    func setupUI() {
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 50, width: kSCREEN_WIDTH, height: 21))
        titleLabel.text = "1 GALLON A DAY"
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.darkText
        view.addSubview(titleLabel)
        
        progressView = ProgressView(frame: CGRect(x: (kSCREEN_WIDTH - 300) / 2, y: 180, width: 300, height: 300))
        progressView.backgroundColor = UIColor.white
        view.addSubview(progressView)
        
        addButton = UIButton(frame: CGRect(x: (kSCREEN_WIDTH - 60) / 2, y: kSAFEAREA_HEIGHT - 60, width: 60, height: 60))
        addButton.setImage(UIImage(named: "add"), for: .normal)
        addButton.addTarget(self, action: #selector(incrementProgress(_:)), for: .touchUpInside)
        view.addSubview(addButton)
    }
    
    func configuration() {
        progressView.currentValue = 0
        progressView.range = 128
    }
    
    func numberAsPercentage(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.percentSymbol = ""
        return formatter.string(from: NSNumber(value: number))!
    }
}

extension ProgressViewController {
    
    @objc func incrementProgress(_ sender: UIButton) {
        guard progressView.currentValue < 128 else { return }
        
        progressView.currentValue += 8
        let percentAngle = Double(progressView.currentValue) / 128
        progressView.progressLabel.text = numberAsPercentage(percentAngle)
    }
}
