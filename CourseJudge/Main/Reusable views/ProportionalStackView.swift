//
//  ProportionalStackView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-10.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class ProportionalStackView: UIView {
    private var views: [UIView] = []
    private var proportions: [Float] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addArrangedSubview(_ view: UIView, proportion: Float) {
        addSubviewLayout(view)
        
        if let topView = views.last {
            view.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        } else {
            view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        }
        
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        view.heightAnchor.constraint(equalTo: heightAnchor, multiplier: CGFloat(proportion)).isActive = true
        
        views.append(view)
        proportions.append(proportion)
    }
}

