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
    private let reviews: [Review] = [.init(rating: .four, yearTaken: 2017, professorName: "Jochen Lang", difficuly: .medium, comment: "I would take take any other Math course with him any time"),
                                     .init(rating: .one, yearTaken: 2019, professorName: "Thomas Tran", difficuly: .hard, comment: "One of the best profs I've had! This professor wants all his students to succeed without a doubt. The midterms are very easy because he gives us some past midterms to practice with and he structures his midterms the same way every year, so you know exactly what to expect going into midterms. As long as you work, you'll be more than fine."),
                                     .init(rating: .five, yearTaken: 2016, professorName: "John Houseman", difficuly: .easy, comment: "This is the only prof that I have had that gives detailed examples of the course content. He is literally the textbook(a simplified one) Don't skip classes. Homework can be a lot but it's perfect practice for midterm and finals(guaranteed). Would have gotten an A+ but I am fund of tiny mistakes and laziness. I highly recommend him. Perfect professor, you can't get less than an A+ in anything he teaches unless you're just unwilling to do anything."),
                                     .init(rating: .four, yearTaken: 2018, professorName: "Jochen Lang", difficuly: .medium, comment: "I would take take any other Math course with him any time")]
    
    func fetchReviews() -> [Review] {
        return reviews
    }
}
