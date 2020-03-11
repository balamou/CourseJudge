//
//  SearchViewController.swift
//  CourseJudge
//
//  Created by Michel Balamou on 2020-03-10.
//  Copyright © 2020 Michel Balamou. All rights reserved.
//

import UIKit

protocol SearchViewControllerDelegate: class {
    func searchViewControllerCancel()
}

class SearchViewController: UIViewController {
    weak var delegate: SearchViewControllerDelegate?
    private var searchView: SearchView!
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView = SearchView()
        view = searchView
        
        searchView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        searchView.searchField.becomeFirstResponder()
    }
    
    @objc func cancelButtonTapped() {
        delegate?.searchViewControllerCancel()
    }
}
