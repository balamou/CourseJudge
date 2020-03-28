//
//  MoreActionsView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-24.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class MoreActionsView: UIView {
    
    var wrapperView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10.0
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return view
    }()
    
    let reportButton: UIButton = {
        let button = UIButton()
        button.setTitle("Report review", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentEdgeInsets  = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)

        return button
    }()
    
    var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.layer.cornerRadius = 24
        button.backgroundColor = UIColor.systemGray.withAlphaComponent(0.4)
        
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 18.0)
        button.contentEdgeInsets  = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = #colorLiteral(red: 0.03093336336, green: 0.04700698704, blue: 0.05623088032, alpha: 1).withAlphaComponent(0.5)
        
        addSubviewLayout(wrapperView)
        wrapperView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        wrapperView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        wrapperView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        wrapperView.addSubviewLayout(cancelButton)
        cancelButton.bottomAnchor.constraint(equalTo: wrapperView.safeAreaLayoutGuide.bottomAnchor, constant: -20.0).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 40.0).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -40.0).isActive = true
        
        wrapperView.addSubviewLayout(reportButton)
        reportButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -10.0).isActive = true
        reportButton.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 20.0).isActive = true
        reportButton.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -20.0).isActive = true
        
        wrapperView.topAnchor.constraint(equalTo: reportButton.topAnchor, constant: -20.0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

