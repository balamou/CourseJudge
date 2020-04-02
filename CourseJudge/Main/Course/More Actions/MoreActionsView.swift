//
//  MoreActionsView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-24.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class MoreActionsView: UIView {
    var bottomWrapperConstraint: NSLayoutConstraint!
    
    var overallTintView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.03093336336, green: 0.04700698704, blue: 0.05623088032, alpha: 1).withAlphaComponent(0.5)
        
        return view
    }()
    
    var wrapperView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10.0
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return view
    }()
    
    let reportButton: UIButton = {
        let button = UIButton()
        button.setTitle("🚩    Report review", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentEdgeInsets  = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 0)
        button.titleLabel?.font = .systemFont(ofSize: 16.0)
        button.contentHorizontalAlignment = .left
        
        return button
    }()
    
    var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 24
        button.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.9215686275, blue: 0.937254902, alpha: 1)
        
        button.contentEdgeInsets  = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        
        return button
    }()
    
    var topWedge: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9058823529, green: 0.9215686275, blue: 0.937254902, alpha: 1)
        view.layer.cornerRadius = 2.5
        
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .none
        
        addSubviewLayout(overallTintView)
        overallTintView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        overallTintView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        overallTintView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        overallTintView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubviewLayout(wrapperView)
        bottomWrapperConstraint = wrapperView.bottomAnchor.constraint(equalTo: bottomAnchor)
        bottomWrapperConstraint.isActive = true
        wrapperView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        wrapperView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        wrapperView.addSubviewLayout(cancelButton)
        cancelButton.bottomAnchor.constraint(equalTo: wrapperView.safeAreaLayoutGuide.bottomAnchor, constant: -10.0).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 10.0).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -10.0).isActive = true
        
        wrapperView.addSubviewLayout(reportButton)
        reportButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -10.0).isActive = true
        reportButton.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 10.0).isActive = true
        reportButton.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -10.0).isActive = true
        
        wrapperView.topAnchor.constraint(equalTo: reportButton.topAnchor, constant: -20.0).isActive = true
        
        wrapperView.addSubviewLayout(topWedge)
        topWedge.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 10.0).isActive = true
        topWedge.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor).isActive = true
        topWedge.widthAnchor.constraint(equalToConstant: 35.0).isActive = true
        topWedge.heightAnchor.constraint(equalToConstant: 5.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

