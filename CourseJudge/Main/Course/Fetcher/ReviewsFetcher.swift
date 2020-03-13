//
//  ReviewsFetcher.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-13.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

struct Review {
    let rating: Stars // one star, two stars etc
    let yearTaken: Int // 2017
    let professorName: String // John Doe
    let difficuly: Difficulty // easy, hard, etc..
    let comment: String // Any coments left
}

