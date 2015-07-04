//
//  DailyWeatherTableViewCell.swift
//  Stormy
//
//  Created by Kristofer Doman on 2015-07-03.
//  Copyright (c) 2015 Kristofer Doman. All rights reserved.
//

import UIKit

class DailyWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var temperatureLabel: UILabel?
    @IBOutlet weak var iconImageView: UIImageView?
    @IBOutlet weak var dayLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
