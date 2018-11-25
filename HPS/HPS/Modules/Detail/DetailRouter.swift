//
//  DetailRouter.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

class DetailRouter: DetailPresenterToRouterProtocol{
    
    class func createModule(model: ItunesSearchServiceModel, position: Int) -> UIViewController{
        let view = DetailViewController()
        let presenter: DetailViewToPresenterProtocol & DetailInteractorToPresenterProtocol = DetailPresenter()
        let interactor: DetailPresenterToInteractorProtocol = DetailInteractor()
        let router: DetailPresenterToRouterProtocol = DetailRouter()
        
        view.presenter = presenter        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.data = model
        presenter.position = position
        interactor.presenter = presenter
        
        return view
    }
}
