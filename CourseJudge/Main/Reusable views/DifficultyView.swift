//
//  DifficultyView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-24.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class DifficultyView: UIView {
    
    let difficultyLevels: [(String, UIImage)] = [ ("easy", Images.Difficulty.easy),
                                                ("moderate", Images.Difficulty.moderate),
                                                ("difficult", Images.Difficulty.difficult)]
    
    var imageViews: [UIView] = []
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
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
            
            view.addSubviewLayout(label)
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            view.widthAnchor.constraint(equalTo: label.widthAnchor).isActive = true // hack to make the view full
            
            imageViews.append(view)
            stackView.addArrangedSubview(view)
        }
        
        addSubviewLayout(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

