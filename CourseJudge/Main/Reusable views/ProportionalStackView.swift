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
    
    
    func addArrangedSubview(_ view: UIView, proportion: Float, _ margins: UIEdgeInsets? = nil) {
        let wrappedView = wrap(view: view, margins: margins)
        addSubviewLayout(wrappedView)
        
        if let topView = views.last {
            wrappedView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        } else {
            wrappedView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        }
        
        wrappedView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        wrappedView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        wrappedView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: CGFloat(proportion)).isActive = true
        
        views.append(wrappedView)
        proportions.append(proportion)
    }
    
    private func wrap(view: UIView, margins: UIEdgeInsets? = nil) -> UIView {
        let wrapperView = UIView()
        wrapperView.addSubviewLayout(view)
        
        if let margins = margins {
            view.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: margins.top).isActive = true
            view.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -margins.bottom).isActive = true
            view.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: margins.left).isActive = true
            view.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -margins.right).isActive = true
        } else {
            view.topAnchor.constraint(equalTo: wrapperView.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor).isActive = true
        }
        
        return wrapperView
    }
    
    func colorViews() {
        let count = proportions.count
        
        views.enumerated().forEach { (offset, element) in
            let abc = element.subviews.first!
            abc.backgroundColor = UIColor.systemBlue.withAlphaComponent(CGFloat(Float(offset + 1) * (1.0/Float(count))))
            
            print(CGFloat((offset + 1) * (1/count)))
        }
    }
    
    func addArrangedSubviewOLD(_ view: UIView, proportion: Float) {
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

