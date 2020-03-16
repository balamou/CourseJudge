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
                                     .init(rating: .one, yearTaken: 2019, professorName: "Thomas Tran", difficuly: .hard, comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In elementum sem sit amet mollis efficitur. Praesent blandit nisi a odio pharetra iaculis. Donec augue justo, ullamcorper ac purus et, porttitor tempor ligula. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam eleifend, nunc vitae ullamcorper bibendum, enim justo aliquam justo, id molestie risus massa sed diam. Donec ac mollis nulla, non tristique tellus. Morbi tellus sem, rhoncus sed nunc vel, interdum viverra lectus. Vivamus eu tristique mi, a vestibulum odio. Mauris dolor metus, vestibulum vitae sollicitudin sed, finibus nec elit. Integer mattis facilisis mauris, eu semper nibh dignissim mollis")]
    
    func fetchReviews() -> [Review] {
        return reviews
    }
}
