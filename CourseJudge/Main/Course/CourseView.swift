//
//  CourseView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-13.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class CourseView: UIView {
    
    var backButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.back, for: .normal)
        
        return button
    }()
    
    var courseTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    var bottomView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    var rateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Rate course", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.7)
        
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 18.0)
        button.contentEdgeInsets  = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
       
        addSubviewLayout(courseTableView)
        courseTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        courseTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        courseTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        addSubviewLayout(backButton)
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
        
        addSubviewLayout(bottomView)
        bottomView.addSubviewLayout(rateButton)
        
        bottomView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomView.topAnchor.constraint(equalTo: rateButton.topAnchor, constant: -100.0).isActive = true
        
        rateButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -30.0).isActive = true
        rateButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20.0).isActive = true
        rateButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20.0).isActive = true
        
        // TABLE VIEW BOTTOM
        courseTableView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: 100.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    var didLayoutAlready = false
    
    func viewDidLayoutSubviews() {
        if (!didLayoutAlready) {
            didLayoutAlready = true
            
            bottomView.setGradient(colors: [UIColor.white.withAlphaComponent(0), .white])
        }
    }
    
    func addStyle(_ btn: UIButton, _ color: UIColor) {
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: btn.bounds, cornerRadius: 25.0).cgPath
        shadowLayer.fillColor = color.cgColor
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shadowLayer.shadowOpacity = 0.09
        shadowLayer.shadowRadius = 4
        
        btn.layer.insertSublayer(shadowLayer, at: 0)
    }
}
