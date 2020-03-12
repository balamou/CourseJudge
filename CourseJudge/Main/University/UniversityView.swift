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
        button.setTitle("Back", for: .normal)
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviewLayout(backButton)
        
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
