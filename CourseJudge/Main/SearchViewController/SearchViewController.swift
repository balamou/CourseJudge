//
//  SearchViewController.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-10.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    private var searchView: SearchView!
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView = SearchView()
        view = searchView
    }
    
    
}
