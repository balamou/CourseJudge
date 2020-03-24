//
//  DifficultyView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-24.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class DifficultyView: UIView {
    
    let inactiveColor = UIColor.gray.withAlphaComponent(0.8)
    let activeColor = UIColor.systemBlue
    var selectedLevel = -1
    
    let difficultyLevels: [(String, UIImage)] = [ ("easy", Images.Difficulty.easy),
                                                  ("moderate", Images.Difficulty.moderate),
                                                  ("difficult", Images.Difficulty.difficult)]
    
    var levelViews: [(UIImageView, UILabel)] = []
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.spacing = self.spacing
        
        return stackView
    }()
    
    var spacing: CGFloat = 50.0 {
        didSet {
            stackView.spacing = self.spacing
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        var count = 0
        difficultyLevels.forEach { (level, image) in
            // STYLE
            let view = UIView()
            let imageView = UIImageView(image: image)
            let label = UILabel()
            label.text = level
            label.font = UIFont.systemFont(ofSize: 14.0)
            
                // POSITION
            view.addSubviewLayout(imageView)
            imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            imageView.tintColor = inactiveColor
            
            view.addSubviewLayout(label)
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            label.textColor = inactiveColor
            
            view.widthAnchor.constraint(equalTo: label.widthAnchor).isActive = true // hack to make the view full
            
            levelViews.append((imageView, label))
            stackView.addArrangedSubview(view)
            stackView.bottomAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
            
            // TAP
            let tap = UITapGestureRecognizer(target: self, action: #selector(tappedOnDificulty(gestureRecognizer:)))
            view.addGestureRecognizer(tap)
            view.isUserInteractionEnabled = true
            view.tag = count
            count += 1
        }
        
        addSubviewLayout(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        heightAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true
        leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
    }
    
    @objc func tappedOnDificulty(gestureRecognizer: UIGestureRecognizer) {
        if let tag = gestureRecognizer.view?.tag {
            colorLevel(level: tag)
        }
    }
    
    func colorLevel(level: Int) {
        for i in 0..<levelViews.count {
            levelViews[i].0.tintColor = level == i ? activeColor : inactiveColor
            levelViews[i].1.textColor = level == i ? activeColor : inactiveColor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

