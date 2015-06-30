//
//  ForecastService.swift
//  Stormy
//
//  Created by Kristofer Doman on 2015-06-17.
//  Copyright (c) 2015 Kristofer Doman. All rights reserved.
//

import Foundation

struct ForecastService {
    
    let APIKey: String
    let baseURL: NSURL?
    
    init(APIKey: String) {
        self.APIKey = APIKey
        self.baseURL = NSURL(string: "https://api.forecast.io/forecast/\(APIKey)/")
    }
    
    func getForecast(lat: Double, long: Double, completion: (CurrentWeather? -> Void)) {
        
        if let url = NSURL(string: "\(lat),\(long)", relativeToURL: baseURL) {
            let networkOperation = NetworkOperation(url: url)
            
            networkOperation.downloadJSONFromURL { (let JSONDictionary) in
                let currentWeather = self.currentWeatherFromJSON(JSONDictionary)
                completion(currentWeather)
            }
        } else {
            println("Could not construct a valid URL.")
        }
    }
    
    func currentWeatherFromJSON(jsonDictionary: [String: AnyObject]?) -> CurrentWeather? {
        
        if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: AnyObject] {
            return CurrentWeather(weatherDictionary: currentWeatherDictionary)
        } else {
            println("JSON dictionary returned nil for the 'currently' key.")
            return nil
        }
    }
}