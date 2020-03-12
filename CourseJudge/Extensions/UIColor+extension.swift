//
//  UIColor+extensions.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-11.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        let h = CGFloat.random(in: 0...360)/360
        let s = CGFloat.random(in: 42...98)/360
        let l = CGFloat.random(in: 40...90)/360
        
        return UIColor(hue: h, saturation: s, brightness: l, alpha: 1)
    }
    
    static func random(seed: String) -> UIColor {
        var total: Int = 0
        for u in seed.unicodeScalars {
            total += Int(UInt32(u))
        }
        
        srand48(total * 200)
        
        return UIColor(hue: CGFloat(drand48()), saturation: 0.8, brightness: 1, alpha: 1)
    }
}
