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
    func searchViewControllerRequestUniversity()
    func searchViewController(_ searchViewController: SearchViewController, didSelect university: University)
}

class SearchViewController: UIViewController {
    weak var delegate: SearchViewControllerDelegate?
    private var searchView: SearchView!
    
    private var universities: [University] = UniversitiesSearchModule().topSearchedUniversities()
    private var fetcher: UniversityFetcher = UniversitiesSearchModule()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView = SearchView()
        view = searchView
        
        searchView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        searchView.searchField.becomeFirstResponder()
        searchView.searchField.addTarget(self, action: #selector(textFieldTyping), for: .editingChanged)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(requestUniversity))
        searchView.bottomLabel.addGestureRecognizer(tap)
        searchView.bottomLabel.isUserInteractionEnabled = true
        
        searchView.searchResults.separatorStyle = .none
        searchView.searchResults.rowHeight = UniversityCell.rowHeight
        searchView.searchResults.delegate = self
        searchView.searchResults.dataSource = self
        
        searchView.searchResults.register(UniversityCell.self, forCellReuseIdentifier: UniversityCell.identifier)
        searchView.searchResults.setupToHideKeyboardOnTapOnView()
    }
    
    @objc func cancelButtonTapped() {
        delegate?.searchViewControllerCancel()
    }
    
    @objc func textFieldTyping(textField: UITextField) {
        guard let uniPrefix = textField.text else { return }
        
        let results = fetcher.searchUniversity(by: uniPrefix)
        
        guard !results.isEmpty else {
            searchView.noResultsView.isHidden = false
            return
        }
        
        searchView.noResultsView.isHidden = true
        
        universities = results
        searchView.searchResults.reloadData()
    }
    
    @objc func requestUniversity() {
        delegate?.searchViewControllerRequestUniversity()
    }
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUniversity = universities[indexPath.row]
        
        delegate?.searchViewController(self, didSelect: selectedUniversity)
    }
    
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UniversityCell.identifier, for: indexPath) as! UniversityCell
        
        let uni = universities[indexPath.row]
        cell.universityNameLabel.text = uni.name
        cell.locationLabel.text = uni.fullAddress
        cell.universityLogoImageView.image = uni.logo
        cell.universityLogoImageView.tintColor = uni.color
        
        return cell
    }
    
}
