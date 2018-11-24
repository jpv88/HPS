//
//  HomePresenter.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

class HomePresenter: HomeViewToPresenterProtocol {
    
    var view: HomePresenterToViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?

    func loadView() {
        view?.searchBar.delegate = view as? UISearchBarDelegate
        view?.tableView.delegate = view as? UITableViewDelegate
        view?.tableView.dataSource = view as? UITableViewDataSource
        view?.tableView.bounces = false
        view?.tableView.register(UINib(nibName: ItunesTableViewCell.getIdentifier(), bundle: nil), forCellReuseIdentifier: ItunesTableViewCell.getIdentifier())
        view?.tableView.tableFooterView = UIView()
    }
    
    func updateView() {
        guard let view = view as? UIViewController else {return}
        view.title = "Home"
    }
    
    func search(input: String) {
        interactor?.fetchArtist(input: input)
    }
    
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    func fetchSuccess(model: ItunesSearchServiceModel) {
        view?.refreshView(model: model)
    }
    
    func fetchFail(error: Error) {
        ErrorHandler.showError(error: error)
    }
}
