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
        let image = UIImageView(image: Images.logo)
        image.backgroundColor = .brown
        
        return image
    }()
    
    var appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Course Judge"
        
        return label
    }()
    
    var sloganLabel: UILabel = {
        let label = UILabel()
        label.text = "Created by Students, for the Students"
        
        return label
    }()
    
    var searchField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        textField.layer.cornerRadius = 2
        
        return textField
    }()
    
    var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        
        return button
    }()
    
    var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        verticalStack.addArrangedSubview(logoImage)
        verticalStack.addArrangedSubview(appNameLabel)
        verticalStack.addArrangedSubview(sloganLabel)
        verticalStack.addArrangedSubview(searchField)
        verticalStack.addArrangedSubview(searchButton)
        
        addSubviewLayout(verticalStack)
        verticalStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

}
