//
//  ItunesTableViewCell.swift
//  HPS
//
//  Created by Jared Perez Vega on 24/11/2018.
//  Copyright © 2018 Jared Perez Vega. All rights reserved.
//

import UIKit

class ItunesTableViewCell: UITableViewCell {

    @IBOutlet weak var priceTitleLabel: UILabel!
    @IBOutlet weak var genreTitleLabel: UILabel!
    @IBOutlet weak var durationTitleLabel: UILabel!
    @IBOutlet weak var artistTitleLabel: UILabel!
    @IBOutlet weak var songTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    func displayData(model: Result) {
        let song = model.trackCensoredName ?? ""
        let artist = model.artistName ?? ""
        var duration = "0"
        if let miliseconds = model.trackTimeMillis, miliseconds != 0 {
            duration = TimeInterval(miliseconds).stringTime
        }
        let genre = model.primaryGenreName ?? ""
        let price = model.trackPrice ?? 0.0
        
        self.songTitleLabel.text = song
        self.artistTitleLabel.text = artist
        self.durationTitleLabel.text = duration
        self.genreTitleLabel.text = genre
        self.priceTitleLabel.text = "\(price)"        
    }
    
}
