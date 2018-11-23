//
//  DetailProtocols.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

protocol DetailPresenterToViewProtocol: class{}

protocol DetailInteractorToPresenterProtocol: class{}

protocol DetailPresenterToInteractorProtocol: class{
    var presenter: DetailInteractorToPresenterProtocol? {get set}
}

protocol DetailViewToPresenterProtocol: class{
    var view: DetailPresenterToViewProtocol? {get set}
    var interactor: DetailPresenterToInteractorProtocol? {get set}
    var router: DetailPresenterToRouterProtocol? {get set}
    func loadView()
}

protocol DetailPresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
}
