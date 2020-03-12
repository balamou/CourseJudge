//
//  UniversityFetcher.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-11.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import Foundation

protocol UniversityFetcher {
     func searchUniversity(by prefix: String) -> [University]
}


class UniversitiesSearchModule: UniversityFetcher {
    
    private var universities: [University] = [ .init(name: "UOttawa", logo: Images.logo, location: "75 Laurier Ave E, Ottawa, ON K1N 6N5"),
                                               .init(name: "Carleton", logo: Images.logo, location: "1125 Colonel By Dr, Ottawa, ON K1S 5B6"),
                                               .init(name: "Algonquin College", logo: Images.logo, location: "1385 Woodroffe Ave, Nepean, ON K2G 1V8")]
    
    func searchUniversity(by prefix: String) -> [University] {
        return universities.filter { $0.name.hasPrefix(prefix) }
    }
    
}
