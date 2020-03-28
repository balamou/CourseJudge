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
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        addSubviewLayout(wrapperView)
        wrapperView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        wrapperView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        wrapperView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true

        wrapperView.addSubviewLayout(successImageView)
        successImageView.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor).isActive = true
        successImageView.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 20.0).isActive = true
        
        wrapperView.addSubviewLayout(infoLabel)
        infoLabel.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: successImageView.bottomAnchor, constant: 10.0).isActive = true
        
        wrapperView.bottomAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
