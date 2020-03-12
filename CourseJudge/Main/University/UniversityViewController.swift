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
}

struct Course {
    enum Stars: Int {
        case one, two, three, four, five
    }
    
    enum Difficulty {
        case easy, medium, hard
    }
    
    let courseName: String // User interface analysis, Computer Graphics, etc.
    let courseCode: String // CSI 3140
    let numberOfRatings: Int // 1053 ratings
    let rating: Stars // stars out of five
    let difficulty: Difficulty
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
    }
    
    @objc func back() {
        delegate?.universityViewControllerBack()
    }
}

extension UniversityViewController: UITableViewDelegate {
    
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
            universityHeaderCell.delegate = self
            
            return universityHeaderCell
        } else if indexPath.section == 1 {
            let coursesCell =  tableView.dequeueReusableCell(withIdentifier: UniversityCourseCell.identifier, for: indexPath) as! UniversityCourseCell
            
            let course = courses[indexPath.row]
            coursesCell.courseNameLabel.text = course.courseCode
            coursesCell.courseCodeLabel.text = course.courseName
            coursesCell.numberOfRatingsLabel.text = "\(course.numberOfRatings) ratings"
                      
            return coursesCell
        } else {
            let noresults = tableView.dequeueReusableCell(withIdentifier: NoResultsCell.identifier, for: indexPath) as! NoResultsCell
            
            return noresults
        }
    }
}

extension UniversityViewController: UniversityHeaderCellDelegate {
    
    func textFieldTyping(textField: UITextField, trendingLabel: UILabel) {
        guard let coursePrefix = textField.text else { return }
        trendingLabel.isHidden = !coursePrefix.isEmpty
        
        let results = fetcher.searchCourse(by: coursePrefix)
        courses = results
        
        noResults = results.isEmpty
        
        universityView.universityTableView.reloadSections(IndexSet(integersIn: 1...2), with: .fade)
    }
    
}

