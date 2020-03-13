//
//  CourseView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-13.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class CourseView: UIView {
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .random()
        
        return view
    }()
    
    let courseNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Course Name"
        
        return label
    }()
    
    let courseCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Course Code"
        
        return label
    }()
    
    let numberOfRatingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of ratings"
        
        return label
    }()
    
    let overallRatingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Overall rating"
        
        return label
    }()
    
    
    var backButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.back, for: .normal)
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        addSubviewLayout(topView)
        topView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
        topView.addSubviewLayout(courseNameLabel)
        courseNameLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10.0).isActive = true
        courseNameLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10.0).isActive = true
        
        topView.addSubviewLayout(courseCodeLabel)
        courseCodeLabel.topAnchor.constraint(equalTo: courseNameLabel.bottomAnchor, constant: 10.0).isActive = true
        courseCodeLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10.0).isActive = true
        
        topView.addSubviewLayout(overallRatingsLabel)
        overallRatingsLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10.0).isActive = true
        overallRatingsLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10.0).isActive = true
        
        topView.addSubviewLayout(numberOfRatingsLabel)
        numberOfRatingsLabel.bottomAnchor.constraint(equalTo: overallRatingsLabel.topAnchor, constant: -10.0).isActive = true
        numberOfRatingsLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10.0).isActive = true
        
        addSubviewLayout(backButton)
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
