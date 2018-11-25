//
//  DetailViewController.swift
//  HPS
//
//  Created by Jared Perez Vega on 23/11/2018.
//  Copyright (c) 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var songTitleLabel: UILabel!
    
    var presenter: DetailViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.loadView()
    }
    
    @IBAction func playerLeftButton(_ sender: UIButton) {
        presenter?.leftAction()
    }
    
    @IBAction func playerPlayButton(_ sender: UIButton) {
        presenter?.playAction()
    }
    
    @IBAction func playerStopButton(_ sender: UIButton) {
        presenter?.stopAction()
    }
    
    @IBAction func playerRightButton(_ sender: UIButton) {
        presenter?.rightAction()
    }
    
}

extension DetailViewController: DetailPresenterToViewProtocol {}
