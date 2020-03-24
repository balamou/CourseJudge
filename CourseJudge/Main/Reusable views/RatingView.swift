//
//  RatingView.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-24.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class RatingView: UIView {
    
    let ratingLevels = 5
    let starHeight: CGFloat = 40
    var currentRating: Stars = .one {
        didSet {
            colorActiveStars(rating: currentRating)
        }
    }
    
    var activeStarColor: UIColor = #colorLiteral(red: 0.9803921569, green: 0.6941176471, blue: 0.2509803922, alpha: 1)
    var inactiveStarColor: UIColor = #colorLiteral(red: 0.8941176471, green: 0.9098039216, blue: 0.9137254902, alpha: 1)
    var spacing: CGFloat = 20.0
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = spacing
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    private var starImageViews: [UIImageView] = []
    
    init() {
        super.init(frame: .zero)
        
        for rating in 1...ratingLevels {
            let placeHolderView = UIView()
            let starImage = UIImageView(image: Images.star)
            starImage.tintColor = inactiveStarColor
            starImage.contentMode = .scaleAspectFit
            let ratingLabel = UILabel()
            ratingLabel.text = "\(rating)"
            ratingLabel.isHidden = true
            
            placeHolderView.addSubviewLayout(starImage)
            starImage.topAnchor.constraint(equalTo: placeHolderView.topAnchor).isActive = true
            starImage.centerXAnchor.constraint(equalTo: placeHolderView.centerXAnchor).isActive = true
            starImage.heightAnchor.constraint(equalToConstant: starHeight).isActive = true
            starImage.widthAnchor.constraint(equalToConstant: starHeight).isActive = true
            
            placeHolderView.widthAnchor.constraint(equalTo: starImage.widthAnchor).isActive = true // hack
            
            placeHolderView.addSubviewLayout(ratingLabel)
            ratingLabel.topAnchor.constraint(equalTo: starImage.bottomAnchor).isActive = true
            ratingLabel.centerXAnchor.constraint(equalTo: placeHolderView.centerXAnchor).isActive = true

            stackView.addArrangedSubview(placeHolderView)
            stackView.bottomAnchor.constraint(equalTo: ratingLabel.bottomAnchor).isActive = true // hack
           
            // TAP GESTURE
            starImageViews.append(starImage)
            let tap = UITapGestureRecognizer(target: self, action: #selector(starSelected(gestureRecognizer:)))
            
            placeHolderView.addGestureRecognizer(tap)
            placeHolderView.tag = rating
            placeHolderView.isUserInteractionEnabled = true
        }
        
        addSubviewLayout(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true // optional: delete if this causes problems
        trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true // optional: delete if this causes problems
        heightAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true // KEEP
        
        colorActiveStars(rating: currentRating)
    }
    
    @objc func starSelected(gestureRecognizer: UIGestureRecognizer) {
        if let selectedRating = gestureRecognizer.view?.tag, let rating = Stars(rawValue: selectedRating) {
            colorActiveStars(rating: rating)
        }
    }
    
    private func colorActiveStars(rating: Stars) {
        for i in 1...ratingLevels {
            starImageViews[i - 1].tintColor = i <= rating.rawValue ? activeStarColor : inactiveStarColor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
