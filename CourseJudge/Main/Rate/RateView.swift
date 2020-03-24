//
//  RateView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-24.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class RateView: UIView {
    
    var backButton: UIButton = {
           let button = UIButton()
           button.setImage(Images.back, for: .normal)
           
           return button
       }()
    
    let topWrapper: UIView = {
        let view = UIView()
        view.backgroundColor = .random()
        
        return view
    }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.text = "You are rating..."
        label.font = UIFont.systemFont(ofSize: 15.0)
        
        return label
    }()
    
    let courseCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "Course code"
        label.font = UIFont.systemFont(ofSize: 20.0)
        
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "Rating"
        
        return label
    }()
    
    let ratingView: UIView = {
        let ratingView = UIView()
        ratingView.backgroundColor = .random()
        
        return ratingView
    }()
    
    let difficultyLabel: UILabel = {
        let label = UILabel()
        label.text = "Difficulty"
        
        return label
    }()
    
    let difficulty: UIView = {
        let difficultyView = UIView()
        difficultyView.backgroundColor = .random()
        
        return difficultyView
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
        
        addSubviewLayout(topWrapper)
        topWrapper.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topWrapper.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topWrapper.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topWrapper.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
        // TOP
        topWrapper.addSubviewLayout(topLabel)
        topLabel.topAnchor.constraint(equalTo: topWrapper.topAnchor, constant: 40.0).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: topWrapper.centerXAnchor).isActive = true
        
        topWrapper.addSubviewLayout(courseCodeLabel)
        courseCodeLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 10.0).isActive = true
        courseCodeLabel.centerXAnchor.constraint(equalTo: topWrapper.centerXAnchor).isActive = true
        
        // BACK BUTTON
        addSubviewLayout(backButton)
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0).isActive = true
        backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
              
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
