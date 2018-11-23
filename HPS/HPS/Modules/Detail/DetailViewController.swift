//
//  DetailViewController.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.loadView()
    }
    
}

extension DetailViewController: DetailPresenterToViewProtocol {}
