//
//  HomeProtocols.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

protocol HomePresenterToViewProtocol: class{
    var tableView: UITableView! {get set}
    var searchBar: UISearchBar! {get set}
}

protocol HomeInteractorToPresenterProtocol: class{
    func fetchSuccess(model: ItunesSearchServiceModel)
    func fetchFail(error: Error)
}

protocol HomePresenterToInteractorProtocol: class{
    var presenter: HomeInteractorToPresenterProtocol? {get set}
    func fetchArtist(input: String)
}

protocol HomeViewToPresenterProtocol: class{
    var view: HomePresenterToViewProtocol? {get set}
    var interactor: HomePresenterToInteractorProtocol? {get set}
    var router: HomePresenterToRouterProtocol? {get set}
    func loadView()
    func updateView()
    func search(input: String)
}

protocol HomePresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
}
