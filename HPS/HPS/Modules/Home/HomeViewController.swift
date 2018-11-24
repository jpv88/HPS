//
//  HomeViewController.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: HomeViewToPresenterProtocol?
    
    private var data: ItunesSearchServiceModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.loadView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.updateView()
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        if let input = searchBar.text {
            presenter?.search(input: input)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel button")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = data, let count = data.resultCount {
            return count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItunesTableViewCell.getIdentifier(), for: indexPath) as? ItunesTableViewCell else { return UITableViewCell() }
        guard let model = data, let results = model.results else {return UITableViewCell()}
        let object = results[indexPath.row]
        let song = object.trackCensoredName ?? ""
        let artist = object.artistName ?? ""
        let duration = object.trackTimeMillis ?? 0
        let genre = object.primaryGenreName ?? ""
        let price = object.trackPrice ?? 0.0
        cell.displayData(song: song, artist: artist, duration: "\(duration)", genre: genre, price: "\(price)")
        return cell
    }
    
    
}

extension HomeViewController: HomePresenterToViewProtocol {
    func refreshView(model: ItunesSearchServiceModel) {
        self.data = model
        self.tableView.reloadData()
    }
}
