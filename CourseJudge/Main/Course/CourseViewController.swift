//
//  CourseViewController.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-13.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

protocol CourseViewControllerDelegate: class {
    func courseViewControllerBack()
    func courseViewController(_ courseViewController: CourseViewController, rate course: Course)
}

class CourseViewController: UIViewController {
    weak var delegate: CourseViewControllerDelegate?
    private var courseView: CourseView!
    
    private let course: Course
    private var reviews: [Review] = []
    private let fetcher: ReviewsFetcher = ReviewsModule()
    
    init(course: Course) {
        self.course = course
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courseView = CourseView()
        view = courseView
        
        courseView.backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        
        courseView.courseTableView.delegate = self
        courseView.courseTableView.dataSource = self
        courseView.courseTableView.register(CourseHeaderCell.self, forCellReuseIdentifier: CourseHeaderCell.identifier)
        courseView.courseTableView.register(ReviewCell.self, forCellReuseIdentifier: ReviewCell.identifier)
        
        reviews = fetcher.fetchReviews()
        
        courseView.rateButton.addTarget(self, action: #selector(rateCourseButtonTapped), for: .touchUpInside)
    }
    
    @objc func rateCourseButtonTapped() {
        delegate?.courseViewController(self, rate: course)
    }
    
    @objc func backTapped() {
        delegate?.courseViewControllerBack()
    }
    
}


extension CourseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return CourseHeaderCell.rowHeight
        case 1:
            let review = reviews[indexPath.row]
            return ReviewCell.getEstimatedRowHeight(review: review.comment, totalScreenWidth: view.frame.width)
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return reviews.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CourseHeaderCell.identifier, for: indexPath) as! CourseHeaderCell
            
            cell.courseNameLabel.text = course.courseName
            cell.courseCodeLabel.text = course.courseCode.description
            cell.overallRatingsStars.rating = course.rating
            cell.overallRatingsLabel.text = "\(course.rating.rawValue) out of 5"
            cell.numberOfRatingsLabel.text = "\(reviews.count) reviews"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReviewCell.identifier, for: indexPath) as! ReviewCell
            
            let review = reviews[indexPath.row]
            cell.ratingStars.rating = review.rating
            cell.yearLabel.text = "taken in \(review.yearTaken)"
            cell.professorLabel.text = "Professor: \(review.professorName)"
            cell.difficulyLabel.text = "Difficulty: \(review.difficuly.rawValue)"
            cell.commentsLabel.text = "\(review.comment)"
            
            return cell
        }
    }
    
}
