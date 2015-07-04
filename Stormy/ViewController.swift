//
//  ViewController.swift
//  Stormy
//
//  Created by Kristofer Doman on 2015-06-16.
//  Copyright (c) 2015 Kristofer Doman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dailyWeather: DailyWeather? {
        didSet {
            configureView()
        }
    }
    
    @IBOutlet weak var iconImageView: UIImageView?
    @IBOutlet weak var summaryLabel: UILabel?
    @IBOutlet weak var sunriseTimeLabel: UILabel?
    @IBOutlet weak var sunsetTimeLabel: UILabel?
    @IBOutlet weak var lowLabel: UILabel?
    @IBOutlet weak var highLabel: UILabel?
    @IBOutlet weak var precipitationLabel: UILabel?
    @IBOutlet weak var humidityLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    func configureView() {
        if let weather = dailyWeather {
            // Update UI with information from the data model.
            iconImageView?.image = weather.largeIcon
            summaryLabel?.text = weather.summary
            sunriseTimeLabel?.text = weather.sunriseTime
            sunsetTimeLabel?.text = weather.sunsetTime
            
            if let lowTemp = weather.minTemperature, let highTemp = weather.maxTemperature, let rain = weather.precipitationChance, let humidity = weather.humidity {
                lowLabel?.text = "\(lowTemp)º"
                highLabel?.text = "\(highTemp)º"
                precipitationLabel?.text = "\(rain)%"
                humidityLabel?.text = "\(humidity)%"
            }
            
            self.title = weather.day
        }
        
        // Configure navigation bar back button.
        if let buttonFont = UIFont(name: "HelveticaNeue-Thin", size: 20.0) {
            let barButtonsAttributesDictionary: [NSObject: AnyObject]? = [
                NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSFontAttributeName: buttonFont
            ]
            
            UIBarButtonItem.appearance().setTitleTextAttributes(barButtonsAttributesDictionary, forState: UIControlState.Normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

