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
    
    func filterBy(sender: UIButton) {
        if let filter = FilterModel(rawValue: sender.tag) {
            showSpinner()
            interactor?.filter(by: filter)
        }
    }
    
    private func showSpinner() {
        if let vc = view as? UIViewController {
            vc.showLoader()
        }
    }
    
    private func hideSpinner() {
        if let vc = view as? UIViewController {
            vc.hideLoader()
        }
    }
    
    func navigateToDetail(model: ItunesSearchServiceModel, position: Int) {
        if let vc = view as? UIViewController {
            router?.navigateToDetail(model: model, position: position, origin: vc)
        }
    }
    
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    func fetchSuccess(model: ItunesSearchServiceModel) {
        if let count = model.resultCount, count != 0 {
            view?.refreshView(model: model)
        } else {
            ErrorHandler.showAlert(title: "No results", msg: "Try another input")
        }
    }
    
    func fetchFail(error: Error) {
        ErrorHandler.showError(error: error)
    }
    
    func filteredSuccess(model: ItunesSearchServiceModel) {
        hideSpinner()
        view?.refreshView(model: model)
    }
    
    func filteredFail() {
        hideSpinner()
    }
}
