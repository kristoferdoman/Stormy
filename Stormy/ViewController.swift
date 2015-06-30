//
//  ViewController.swift
//  Stormy
//
//  Created by Kristofer Doman on 2015-06-16.
//  Copyright (c) 2015 Kristofer Doman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?
    
    private let forecastAPIKey = "6da53b24a6690dbd8aad480ee9ab808b"
    let coordinate: (lat: Double, long: Double) = (37.8267,-122.423)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(coordinate.lat, long: coordinate.long) { (let currently) in
            if let currentWeather = currently {
                dispatch_async(dispatch_get_main_queue()) {
                    if let temperature = currentWeather.temperature {
                        self.currentTemperatureLabel?.text = "\(temperature)º"
                    }
                    
                    if let humidity = currentWeather.humidity {
                        self.currentHumidityLabel?.text = "\(humidity)%"
                    }
                    
                    if let precipitation = currentWeather.precipProbability {
                        self.currentPrecipitationLabel?.text = "\(precipitation)%"
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

