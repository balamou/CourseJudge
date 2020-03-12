//
//  UniversityView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-12.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class UniversityView: UIView {
    
    var backButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.back, for: .normal)
        
        return button
    }()
    
    var universityTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubviewLayout(universityTableView)
        
        universityTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        universityTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        universityTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        universityTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubviewLayout(backButton)
        
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
