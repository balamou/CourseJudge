//
//  CoursesFetcher.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-12.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import Foundation

protocol CoursesFetcher {
     func searchCourse(by prefix: String) -> [Course]
}


class CoursesSearchModule: CoursesFetcher {
    
    private let courses: [Course] = [.init(courseName: "User interface analysis", courseCode: "CSI 3130", numberOfRatings: 10, rating: .five, difficulty: .medium),
                                        .init(courseName: "Computer Graphics", courseCode: "CSI 3140", numberOfRatings: 23, rating: .two, difficulty: .hard),
                                        .init(courseName: "Data structures", courseCode: "CSI 3150", numberOfRatings: 54, rating: .one, difficulty: .hard)]
    
    func searchCourse(by prefix: String) -> [Course] {
        return courses.filter { $0.courseName.lowercased().hasPrefix(prefix.lowercased()) || $0.courseCode.lowercased().hasPrefix(prefix.lowercased()) }
    }
    
    func trendingCourses() -> [Course] {
        return courses
    }
    
}
