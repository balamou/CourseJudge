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
    
    
    enum FillMode {
        case fill(margins: UIEdgeInsets)
        case center(height: CGFloat, left: CGFloat, right: CGFloat)
        case centerXY
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addArrangedSubview(_ view: UIView, proportion: Float, contentMode: FillMode = .fill(margins: .zero)) {
        let wrappedView = wrap(view: view, contentMode: contentMode)
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
    
    private func wrap(view: UIView, contentMode: FillMode) -> UIView {
        switch contentMode {
        case let .fill(margins):
            return wrapFill(view: view, margins: margins)
        case let .center(height, left, right):
            return wrapCenter(view: view, height: height, left: left, right: right)
        case .centerXY:
            return wrapCenterXY(view: view)
        }
    }
    
    private func wrapFill(view: UIView, margins: UIEdgeInsets) -> UIView {
        let wrapperView = UIView()
        wrapperView.addSubviewLayout(view)
        
        view.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: margins.top).isActive = true
        view.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -margins.bottom).isActive = true
        view.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: margins.left).isActive = true
        view.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -margins.right).isActive = true
        
        
        return wrapperView
    }
    
    private func wrapCenter(view: UIView, height: CGFloat, left: CGFloat, right: CGFloat) -> UIView {
        let wrapperView = UIView()
        wrapperView.addSubviewLayout(view)
        
        view.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor).isActive = true
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        view.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: left).isActive = true
        view.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -right).isActive = true
        
        
        return wrapperView
    }
    
    private func wrapCenterXY(view: UIView) -> UIView {
        let wrapperView = UIView()
        wrapperView.addSubviewLayout(view)
        
        view.centerXAnchor.constraint(equalTo: wrapperView.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor).isActive = true
        
        
        return wrapperView
    }
    
    func colorViews() {
        let count = proportions.count
        
        views.enumerated().forEach { (offset, element) in
            element.backgroundColor = UIColor.systemBlue.withAlphaComponent(CGFloat(Float(offset + 1) * (1.0/Float(count))))
            
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

