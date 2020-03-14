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
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
       
        addSubviewLayout(courseTableView)
        courseTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        courseTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        courseTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        courseTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubviewLayout(backButton)
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
