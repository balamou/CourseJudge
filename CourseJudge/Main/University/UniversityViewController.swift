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
    private let courses: [Course] = [.init(courseName: "User interface analysis", courseCode: "CSI 3130", numberOfRatings: 10, rating: .five, difficulty: .medium),
                                     .init(courseName: "Computer Graphics", courseCode: "CSI 3140", numberOfRatings: 23, rating: .two, difficulty: .hard),
                                     .init(courseName: "Data structures", courseCode: "CSI 3150", numberOfRatings: 54, rating: .one, difficulty: .hard)]
    
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
        } else {
            return UniversityCourseCell.rowHeight
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return courses.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let universityHeaderCell = tableView.dequeueReusableCell(withIdentifier: UniversityHeaderCell.identifier, for: indexPath) as! UniversityHeaderCell
            
            universityHeaderCell.universityNameLabel.text = university.name
            universityHeaderCell.universityLocationLabel.text = university.location
            universityHeaderCell.universityLogoImageView.image = university.logo
            
            return universityHeaderCell
        } else {
            let coursesCell =  tableView.dequeueReusableCell(withIdentifier: UniversityCourseCell.identifier, for: indexPath) as! UniversityCourseCell
            
            let course = courses[indexPath.row]
            coursesCell.courseNameLabel.text = course.courseName
                      
            return coursesCell
        }
    }
    
}

