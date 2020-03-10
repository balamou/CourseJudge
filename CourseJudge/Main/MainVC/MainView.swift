//
//  MainView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-09.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class MainView: UIView {

    var logoImage: UIImageView = {
        let imageView = UIImageView(image: Images.logo)
        imageView.tintColor = .red
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    var appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Course Judge"
        label.font = UIFont(name: "Helvetica", size: 30.0)
        label.textAlignment = .center
        
        return label
    }()
    
    var sloganLabel: UILabel = {
        let label = UILabel()
        label.text = "Created by Students, for the Students"
        label.font = UIFont(name: "Helvetica", size: 16.0)
        label.textAlignment = .center
        
        return label
    }()
    
    var searchField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.black.withAlphaComponent(0.15)
        textField.layer.cornerRadius = 2
        
        return textField
    }()
    
    var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.7)
        
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 18.0)
        button.contentEdgeInsets  = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        return button
    }()
    
    var verticalStack: ProportionalStackView = {
        let stack = ProportionalStackView()
//        stack.axis = .vertical
//        stack.distribution = .fillEqually
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        verticalStack.addArrangedSubview(logoImage, proportion: 0.3)
        verticalStack.addArrangedSubview(appNameLabel, proportion: 0.1)
        verticalStack.addArrangedSubview(sloganLabel, proportion: 0.1)
        verticalStack.addArrangedSubview(searchField, proportion: 0.1)
        verticalStack.addArrangedSubview(searchButton, proportion: 0.1)
        
        addSubviewLayout(verticalStack)
        verticalStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        verticalStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

}
