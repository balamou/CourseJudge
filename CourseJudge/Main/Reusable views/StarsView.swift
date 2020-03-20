//
//  StarsView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-13.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class StarsView: UIView {
    
    private var stars: [UIImageView] = []
    
    private let activeStarColor: UIColor = #colorLiteral(red: 0.9803921569, green: 0.6941176471, blue: 0.2509803922, alpha: 1)
    var inactiveStarColor: UIColor = #colorLiteral(red: 0.8941176471, green: 0.9098039216, blue: 0.9137254902, alpha: 1) {
        didSet {
            activateStars(rating: rating.rawValue)
        }
    }
    
    var rating: Stars = .one {
        didSet {
            activateStars(rating: rating.rawValue)
        }
    }
    
    init() {
        super.init(frame: .zero)
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5.0
        
        addSubviewLayout(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        Array<Int>(repeating: 0, count: 5).forEach { _ in
            let imageView = UIImageView(image: Images.star)
            imageView.tintColor = inactiveStarColor
            imageView.contentMode = .scaleAspectFit
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
            
            stars.append(imageView)
            
            stackView.addArrangedSubview(imageView)
        }
    }
    
    private func activateStars(rating: Int) {
        stars.enumerated().forEach { (offset, element) in
            element.tintColor = offset < rating ? activeStarColor : inactiveStarColor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

