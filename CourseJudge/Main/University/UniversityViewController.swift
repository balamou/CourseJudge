//
//  UniversityViewController.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-12.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

protocol UniversityViewControllerDelegate: class {
    func universityViewControllerBack()
    func universityViewControllerRequestCourse()
    func universityViewController(_ universityVC: UniversityViewController, selected course: Course)
    func universityViewController(_ universityVC: UniversityViewController, rate course: Course)
}

class UniversityViewController: UIViewController {
    weak var delegate: UniversityViewControllerDelegate?
    private var universityView: UniversityView!
    
    private let university: University
    private let fetcher: CoursesFetcher = CoursesSearchModule()
    private var courses: [Course] = CoursesSearchModule().trendingCourses()
    
    private var noResults: Bool = false
    
    init(university: University) {
        self.university = university
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        universityView = UniversityView()
        view = universityView
        
        universityView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        universityView.universityTableView.delegate = self
        universityView.universityTableView.dataSource = self
        
        universityView.universityTableView.register(UniversityHeaderCell.self, forCellReuseIdentifier: UniversityHeaderCell.identifier)
        universityView.universityTableView.register(UniversityCourseCell.self, forCellReuseIdentifier: UniversityCourseCell.identifier)
        universityView.universityTableView.register(NoResultsCell.self, forCellReuseIdentifier: NoResultsCell.identifier)
        
        universityView.universityTableView.setupToHideKeyboardOnTapOnView()
        universityView.universityTableView.keyboardDismissMode = .onDrag
    }
    
    @objc func back() {
        delegate?.universityViewControllerBack()
    }
}

extension UniversityViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 1 else { return }
        
        let course = courses[indexPath.row]
        
        delegate?.universityViewController(self, selected: course)
    }
    
}

extension UniversityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UniversityHeaderCell.rowHeight
        } else if indexPath.section == 1 {
            return UniversityCourseCell.rowHeight
        } else {
            return NoResultsCell.rowHeight
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return courses.count
        } else {
            return noResults ? 1 : 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let universityHeaderCell = tableView.dequeueReusableCell(withIdentifier: UniversityHeaderCell.identifier, for: indexPath) as! UniversityHeaderCell
            
            universityHeaderCell.universityNameLabel.text = university.name
            universityHeaderCell.universityLocationLabel.text = university.location
            universityHeaderCell.universityLogoImageView.image = university.logo
            universityHeaderCell.universityLogoImageView.tintColor = university.color
            universityHeaderCell.delegate = self
            
            return universityHeaderCell
        } else if indexPath.section == 1 {
            let coursesCell =  tableView.dequeueReusableCell(withIdentifier: UniversityCourseCell.identifier, for: indexPath) as! UniversityCourseCell
            
            let course = courses[indexPath.row]
            
            coursesCell.row = indexPath.row
            coursesCell.delegate = self
            
            coursesCell.courseNameLabel.text = course.courseCode.description
            coursesCell.courseCodeLabel.text = course.courseName
            coursesCell.numberOfRatingsLabel.text = "\(course.numberOfRatings) reviews"
            coursesCell.starsView.rating = course.rating
                      
            return coursesCell
        } else {
            let noresults = tableView.dequeueReusableCell(withIdentifier: NoResultsCell.identifier, for: indexPath) as! NoResultsCell
            
            noresults.delegate = self
            
            return noresults
        }
    }
}

extension UniversityViewController: UniversityHeaderCellDelegate {
    
    func textFieldTyping(textField: UITextField, trendingLabel: UILabel) {
        guard let coursePrefix = textField.text else { return }
        
        let results = coursePrefix.isEmpty ? fetcher.trendingCourses() : fetcher.searchCourse(by: coursePrefix)
        courses = results
        trendingLabel.text = subtext(search: coursePrefix, resultsCount: courses.count)
        
        noResults = results.isEmpty
        
        universityView.universityTableView.reloadSections(IndexSet(integersIn: 1...2), with: .fade)
    }
 
    private func subtext(search: String, resultsCount: Int) -> String {
        if search.isEmpty {
            return "Trending courses"
        }
        
        if courses.count == 0 {
            return " "
        }
        
        if courses.count == 1 {
            return "1 result"
        }
        
        return  "\(resultsCount) results"
    }
}

extension UniversityViewController: NoResultsCellDelegate {
    
    func requestCourseTapped() {
        delegate?.universityViewControllerRequestCourse()
    }
    
}

extension UniversityViewController: UniversityCourseCellDelegate {
    
    func tappedRateButton(row: Int) {
        delegate?.universityViewController(self, rate: courses[row])
    }
    
}
