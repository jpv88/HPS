//
//  HomeRouter.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

class HomeRouter: HomePresenterToRouterProtocol{
    
    class func createModule() -> UIViewController{
        let view = HomeViewController()
        let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        let interactor: HomePresenterToInteractorProtocol = HomeInteractor()
        let router: HomePresenterToRouterProtocol = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func navigateToDetail(model: ItunesSearchServiceModel, position: Int, origin: UIViewController) {
        origin.navigationController?.pushViewController(DetailRouter.createModule(model: model, position: position), animated: true)
    }
}
