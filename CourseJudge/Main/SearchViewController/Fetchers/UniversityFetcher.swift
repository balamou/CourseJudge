//
//  UniversityFetcher.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-11.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

protocol UniversityFetcher {
     func searchUniversity(by prefix: String) -> [University]
}

struct University {
    
    struct Address {
        let city: String
        var street: String? = nil
        var postalCode: String? = nil
        
        static let uottawa = Address(city: "Ottawa, ON", street: "Ottawa, ON", postalCode: "ON K1N 6N5")
        static let carleton = Address(city: "Ottawa, ON", street: "1125 Colonel By Dr", postalCode: "K1S 5B6")
        static let algonquin = Address(city: "Nepean, ON", street: "1385 Woodroffe Ave", postalCode: "K2G 1V8")
        static let waterloo = Address(city: "Waterloo, ON", street: "200 University Ave W", postalCode: "N2L 3G1")
        static let queens = Address(city: "Kingston, ON", street: "99 University Ave", postalCode: "K7L 3N6")
        static let mcmaster = Address(city: "Hamilton, ON", street: "1280 Main St W", postalCode: "L8S 4L8")
    }
    
    let name: String // UOttawa, Carleton, Queens, Waterloo etc..
    let logo: UIImage
    let address: Address
    var color: UIColor = .random()
    
    var location: String {
        return address.city
    }
    
    var fullAddress: String {
        return "\(address.street ?? ""), \(address.city)"
    }
}

class UniversitiesSearchModule: UniversityFetcher {
    private let universities: [University] = [ .init(name: "uOttawa", logo: Images.Logo.uottawa, address: .uottawa, color: Colors.Universities.uottawa),
                                               .init(name: "Carleton", logo: Images.logo, address: .carleton),
                                               .init(name: "Algonquin College", logo: Images.logo, address: .algonquin),
                                               .init(name: "Waterloo", logo: Images.logo, address: .waterloo),
                                               .init(name: "Queen's University", logo: Images.logo, address: .queens),
                                               .init(name: "McMaster University", logo: Images.logo, address: .mcmaster)]
    
    func searchUniversity(by prefix: String) -> [University] {
        return universities.filter { $0.name.lowercased().hasPrefix(prefix.lowercased()) }
    }
    
    func topSearchedUniversities() -> [University] {
        return universities
    }
    
}
