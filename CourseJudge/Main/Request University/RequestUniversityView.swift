//
//  RequestUniversityView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-27.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class RequestUniversityView: UIView {
    
    let wrappedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20.0
        view.backgroundColor = .white
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "University Request"
        
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
    
    let universityName: MessageTextField = {
        let textField = MessageTextField()
        textField.header = "University name"
        
        return textField
    }()
    
    /// MARK: Success view
    
    let successView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20.0
        view.backgroundColor = .white
        view.isHidden = true
        
        return view
    }()
    
    let successImage: UIImageView = {
        let imageView = UIImageView(image: Images.success)
        imageView.tintColor = UIColor(hue: 0.6124527523246674, saturation: 0.8, brightness: 1, alpha: 0.7)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let successLabel: UILabel = {
        let label = UILabel()
        label.text = "Course Request Successful"
        
        return label
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        setupToHideKeyboardOnTapOnView()
        
        addSubviewLayout(wrappedView)
        
        wrappedView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        wrappedView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        wrappedView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        
        wrappedView.addSubviewLayout(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: wrappedView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: wrappedView.topAnchor, constant: 20.0).isActive = true
        
        wrappedView.addSubviewLayout(universityName)
        
        universityName.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0).isActive = true
        universityName.leadingAnchor.constraint(equalTo: wrappedView.leadingAnchor, constant: 10.0).isActive = true
        universityName.trailingAnchor.constraint(equalTo: wrappedView.trailingAnchor, constant: -10.0).isActive = true
        
        wrappedView.addSubviewLayout(cancelButton)
        
        cancelButton.leadingAnchor.constraint(equalTo: wrappedView.leadingAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: wrappedView.widthAnchor, multiplier: 0.5).isActive = true
        cancelButton.topAnchor.constraint(equalTo: universityName.bottomAnchor, constant: 20.0).isActive = true
        
        wrappedView.addSubviewLayout(requestButton)
        
        requestButton.trailingAnchor.constraint(equalTo: wrappedView.trailingAnchor).isActive = true
        requestButton.widthAnchor.constraint(equalTo: wrappedView.widthAnchor, multiplier: 0.5).isActive = true
        requestButton.topAnchor.constraint(equalTo: universityName.bottomAnchor, constant: 20.0).isActive = true
        
        wrappedView.bottomAnchor.constraint(equalTo: requestButton.bottomAnchor).isActive = true
        
        /// MARK: Success view
        addSubviewLayout(successView)
        
        successView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        successView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        successView.heightAnchor.constraint(equalTo: wrappedView.heightAnchor).isActive = true
        successView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        
        successView.addSubviewLayout(successLabel)
        
        successLabel.centerXAnchor.constraint(equalTo: successView.centerXAnchor).isActive = true
        successLabel.centerYAnchor.constraint(equalTo: successView.centerYAnchor, constant: 10.0).isActive = true
        
        successView.addSubviewLayout(successImage)
        
        successImage.bottomAnchor.constraint(equalTo: successLabel.topAnchor, constant: -10.0).isActive = true
        successImage.centerXAnchor.constraint(equalTo: successView.centerXAnchor).isActive = true
    }
    
    func showSuccess(completion: @escaping () -> Void) {
        successView.isHidden = false
        successView.alpha = 0.0
        
        UIView.animate(withDuration: 0.3, animations: {
            self.successView.alpha = 1.0
        }, completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
                completion()
            })
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
