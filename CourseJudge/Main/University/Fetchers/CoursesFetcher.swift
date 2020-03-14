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
    func trendingCourses() -> [Course]
}

enum Stars: Int {
    case one, two, three, four, five
}

enum Difficulty: String {
    case easy, medium, hard
}

struct Course {
    enum CourseCode: CustomStringConvertible {
        case courseCode(subject: String, number: String)
        
        func matches(prefix: String) -> Bool {
            switch self {
            case let .courseCode(subject, number):
                let lowerPrefix = prefix.lowercased()
                let spaced = "\(subject) \(number)".lowercased()
                let notSpaced = "\(subject)\(number)".lowercased()
                
                return spaced.hasPrefix(lowerPrefix) || notSpaced.hasPrefix(lowerPrefix)
            }
        }
        
        var description: String {
            switch self {
            case let .courseCode(subject, number):
                return "\(subject) \(number)".uppercased()
            }
        }
    }
    
    let courseName: String // User interface analysis, Computer Graphics, etc.
    let courseCode: CourseCode // CSI 3140
    let numberOfRatings: Int // 1053 ratings
    let rating: Stars // stars out of five
    let difficulty: Difficulty
}

class CoursesSearchModule: CoursesFetcher {
    private let courses = [Course(courseName: "User interface analysis", courseCode: .courseCode(subject: "CSI", number: "3130"), numberOfRatings: 10, rating: .five, difficulty: .medium),
                           Course(courseName: "Computer Graphics", courseCode: .courseCode(subject: "CSI", number: "3140"), numberOfRatings: 23, rating: .two, difficulty: .hard),
                           Course(courseName: "Data structures", courseCode: .courseCode(subject: "CSI", number: "3150"), numberOfRatings: 54, rating: .one, difficulty: .hard),
                           Course(courseName: "Organismal biology", courseCode: .courseCode(subject: "ANP", number: "1340"), numberOfRatings: 1203, rating: .one, difficulty: .hard),
                           Course(courseName: "Cellular biology", courseCode: .courseCode(subject: "BIO", number: "1234"), numberOfRatings: 4302, rating: .one, difficulty: .hard)]
    
    func searchCourse(by prefix: String) -> [Course] {
        return courses.filter { $0.courseName.lowercased().hasPrefix(prefix.lowercased()) || $0.courseCode.matches(prefix: prefix) }
    }
    
    func trendingCourses() -> [Course] {
        return Array(courses[0..<3]) // top 3
    }
    
}
