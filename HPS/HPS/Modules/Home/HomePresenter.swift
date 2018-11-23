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
    }
    
    func updateView() {
        guard let view = view as? UIViewController else {return}
        view.title = "Home"
    }
    
    func search(input: String) {
        
    }
    
}

extension HomePresenter: HomeInteractorToPresenterProtocol {}
