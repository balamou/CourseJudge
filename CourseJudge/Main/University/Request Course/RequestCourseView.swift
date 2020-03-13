//
//  RequestCourseView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-12.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class RequestCourseView: UIView {
    
    let wrappedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20.0
        view.backgroundColor = .white
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Course Request"
        
        return label
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        
        button.backgroundColor = UIColor.systemRed.withAlphaComponent(0.7)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 15.0)
        button.contentEdgeInsets  = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        
        button.layer.cornerRadius = 20.0
        button.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        return button
    }()
    
    let requestButton: UIButton = {
        let button = UIButton()
        button.setTitle("Request", for: .normal)
 
        button.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.7)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 15.0)
        button.contentEdgeInsets  = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
        
        button.layer.cornerRadius = 20.0
        button.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        return button
    }()
    
    let courseCode: MessageTextField = {
        let textField = MessageTextField()
        textField.header = "Course code"
        
        return textField
    }()
    
    let courseName: MessageTextField = {
        let textField = MessageTextField()
        textField.header = "Course name"
        
        return textField
    }()
    
    init() {
        super.init(frame: .zero)
        
        addSubviewLayout(wrappedView)
        
        wrappedView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        wrappedView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        wrappedView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        wrappedView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        
        wrappedView.addSubviewLayout(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: wrappedView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: wrappedView.topAnchor, constant: 20.0).isActive = true
        
        wrappedView.addSubviewLayout(cancelButton)
        
        cancelButton.leadingAnchor.constraint(equalTo: wrappedView.leadingAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: wrappedView.widthAnchor, multiplier: 0.5).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: wrappedView.bottomAnchor).isActive = true
        
        wrappedView.addSubviewLayout(requestButton)
        
        requestButton.trailingAnchor.constraint(equalTo: wrappedView.trailingAnchor).isActive = true
        requestButton.widthAnchor.constraint(equalTo: wrappedView.widthAnchor, multiplier: 0.5).isActive = true
        requestButton.bottomAnchor.constraint(equalTo: wrappedView.bottomAnchor).isActive = true
        
        wrappedView.addSubviewLayout(courseCode)
        
        courseCode.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20.0).isActive = true
        courseCode.leadingAnchor.constraint(equalTo: wrappedView.leadingAnchor, constant: 10.0).isActive = true
        courseCode.trailingAnchor.constraint(equalTo: wrappedView.trailingAnchor, constant: -10.0).isActive = true
        
        wrappedView.addSubviewLayout(courseName)
        
        courseName.topAnchor.constraint(equalTo: courseCode.bottomAnchor, constant: 10.0).isActive = true
        courseName.leadingAnchor.constraint(equalTo: wrappedView.leadingAnchor, constant: 10.0).isActive = true
        courseName.trailingAnchor.constraint(equalTo: wrappedView.trailingAnchor, constant: -10.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

