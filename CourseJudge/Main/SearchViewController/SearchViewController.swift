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

struct University {
    let name: String // UOttawa, Carleton, Queens, Waterloo etc..
    let logo: UIImage
    let location: String //
}

class SearchViewController: UIViewController {
    weak var delegate: SearchViewControllerDelegate?
    private var searchView: SearchView!
    
    private var universities: [University] = [ .init(name: "UOttawa", logo: Images.logo, location: "75 Laurier Ave E, Ottawa, ON K1N 6N5"),
                                               .init(name: "Carleton", logo: Images.logo, location: "1125 Colonel By Dr, Ottawa, ON K1S 5B6"),
                                               .init(name: "Algonquin College", logo: Images.logo, location: "1385 Woodroffe Ave, Nepean, ON K2G 1V8")]
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView = SearchView()
        view = searchView
        
        searchView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        searchView.searchField.becomeFirstResponder()
        
        searchView.searchResults.separatorStyle = .none
        searchView.searchResults.rowHeight = UniversityCell.rowHeight
        searchView.searchResults.delegate = self
        searchView.searchResults.dataSource = self
        searchView.searchResults.register(UniversityCell.self, forCellReuseIdentifier: UniversityCell.identifier)
    }
    
    @objc func cancelButtonTapped() {
        delegate?.searchViewControllerCancel()
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UniversityCell.identifier, for: indexPath) as! UniversityCell
        
        let uni = universities[indexPath.row]
        cell.universityNameLabel.text = uni.name
        cell.locationLabel.text = uni.location
        
        return cell
    }
    
}
