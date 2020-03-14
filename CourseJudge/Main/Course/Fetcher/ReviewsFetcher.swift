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

protocol ReviewsFetcher {
    func fetchReviews() -> [Review]
}

class ReviewsModule: ReviewsFetcher {
    private let reviews: [Review] = [.init(rating: .four, yearTaken: 2017, professorName: "Jochen Lang", difficuly: .medium, comment: "Very good class"),
                                     .init(rating: .one, yearTaken: 2019, professorName: "Thomas Tran", difficuly: .hard, comment: "Not a good class")]
    
    func fetchReviews() -> [Review] {
        return reviews
    }
}
