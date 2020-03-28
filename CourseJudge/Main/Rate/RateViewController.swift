//
//  RateViewController.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-24.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

protocol RateViewControllerDelegate: class {
    func rateViewControllerDoneRating()
    func rateViewControllerBack()
}

class RateViewController: UIViewController {
    weak var delegate: RateViewControllerDelegate?
    private var rateView: RateView!
    
    private let course: Course

    private var selectedRating: Stars? = nil
    private var selectedDifficulty: Difficulty = .easy
    
    init(course: Course) {
        self.course = course
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        rateView = RateView()
        view = rateView
        
        rateView.courseCodeLabel.text = course.courseCode.description
        
        rateView.backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        rateView.ratingView.selectedRatingAction = { [weak self] rating in
            guard let self = self else { return }
            self.selectedRating = rating
        }
        
        rateView.difficultyView.selectedDifficultyAction = { [weak self] difficulty in
            guard let self = self else { return }
            self.selectedDifficulty = difficulty
            print(self.selectedDifficulty)
        }
        
        view.setupToHideKeyboardOnTapOnView()
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(autoFillFields))
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)
        
        rateView.rateButton.addTarget(self, action: #selector(submitReview), for: .touchUpInside)
    }
    
    func doneRating() {
        UIView.animate(withDuration: 0.30, delay: 1.0, animations: {
            self.rateView.submittedView.alpha = 0.0
        }, completion: { _ in
            self.delegate?.rateViewControllerBack()
        })
    }
    
    @objc func submitReview() {
        rateView.submittedView.isHidden = false
        rateView.submittedView.alpha = 0.0
        
        UIView.animate(withDuration: 0.20, animations: {
            self.rateView.submittedView.alpha = 1.0
        }, completion: { _ in
            self.doneRating()
        })
    }
    
    @objc func backTapped() {
        delegate?.rateViewControllerBack()
    }
    
    @objc func autoFillFields() {
        rateView.yearTakenTextField.text = "2020"
        rateView.professorTextField.text = "Miguel Garzon"
        rateView.commentsTextField.text = "Amazing class! I would recomment it 10/10."
    }
}
