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
            return ReviewCell.rowHeight
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
            cell.overallRatingsLabel.text = "Rated \(course.rating.rawValue) out of 5"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReviewCell.identifier, for: indexPath) as! ReviewCell
            
            let review = reviews[indexPath.row]
            cell.ratingLabel.text = "\(review.rating.rawValue) out of 5"
            cell.yearLabel.text = "Taken in: \(review.yearTaken)"
            cell.professorLabel.text = "Professor: \(review.professorName)"
            cell.difficulyLabel.text = "Difficulty: \(review.difficuly.rawValue)"
            
            return cell
        }
    }
    
}