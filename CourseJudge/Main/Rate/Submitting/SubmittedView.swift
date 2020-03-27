//
//  SubmittedView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-27.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class SubmittedView: UIView {
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Succesfully posted review"
        
        return label
    }()
    
    let successImageView: UIImageView = {
        let imageView = UIImageView(image: Images.success)
        imageView.tintColor = UIColor(hue: 0.6124527523246674, saturation: 0.8, brightness: 1, alpha: 0.7)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let wrapperView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15.0
        view.backgroundColor = .white
        
        return view
    }()
    
    var doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.7)
        
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 18.0)
        button.contentEdgeInsets  = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        addSubviewLayout(wrapperView)
        wrapperView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        wrapperView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        wrapperView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
//        wrapperView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        wrapperView.addSubviewLayout(doneButton)
        doneButton.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 20.0).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -20.0).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -20.0).isActive = true
        
        wrapperView.addSubviewLayout(infoLabel)
        infoLabel.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: doneButton.topAnchor, constant: -20.0).isActive = true
        
        wrapperView.addSubviewLayout(successImageView)
        successImageView.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor).isActive = true
        successImageView.bottomAnchor.constraint(equalTo: infoLabel.topAnchor, constant: -10.0).isActive = true
        
        wrapperView.topAnchor.constraint(equalTo: successImageView.topAnchor, constant: -20.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
