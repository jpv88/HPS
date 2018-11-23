//
//  HomeProtocols.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

protocol HomePresenterToViewProtocol: class{}

protocol HomeInteractorToPresenterProtocol: class{}

protocol HomePresenterToInteractorProtocol: class{
    var presenter: HomeInteractorToPresenterProtocol? {get set}    
}

protocol HomeViewToPresenterProtocol: class{
    var view: HomePresenterToViewProtocol? {get set}
    var interactor: HomePresenterToInteractorProtocol? {get set}
    var router: HomePresenterToRouterProtocol? {get set}
    func updateView()
}

protocol HomePresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
}
