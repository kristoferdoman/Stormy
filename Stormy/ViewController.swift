//
//  ViewController.swift
//  Stormy
//
//  Created by Kristofer Doman on 2015-06-16.
//  Copyright (c) 2015 Kristofer Doman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel?
    @IBOutlet weak var humidityLabel: UILabel?
    @IBOutlet weak var precipitationLabel: UILabel?
    @IBOutlet weak var weatherImage: UIImageView?
    @IBOutlet weak var summaryLabel: UILabel?
    @IBOutlet weak var locationLabel: UILabel?
    
    private let forecastAPIKey = "6da53b24a6690dbd8aad480ee9ab808b"
    let coordinate: (lat: Double, long: Double) = (37.8267,-122.423)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveWeatherForecast()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func retrieveWeatherForecast() {
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(coordinate.lat, long: coordinate.long) { (let currently) in
            if let currentWeather = currently {
                dispatch_async(dispatch_get_main_queue()) {
                    if let temperature = currentWeather.temperature {
                        self.temperatureLabel?.text = "\(temperature)º"
                    }
                    
                    if let humidity = currentWeather.humidity {
                        self.humidityLabel?.text = "\(humidity)%"
                    }
                    
                    if let precipitation = currentWeather.precipProbability {
                        self.precipitationLabel?.text = "\(precipitation)%"
                    }
                    
                    if let icon = currentWeather.icon {
                        self.weatherImage?.image = icon
                    }
                    
                    if let summary = currentWeather.summary {
                        self.summaryLabel?.text = summary
                    }
                }
            }
        }
    }
    
    @IBAction func refreshWeather() {
        retrieveWeatherForecast()
    }
}

