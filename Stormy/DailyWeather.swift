//
//  DailyWeather.swift
//  Stormy
//
//  Created by Kristofer Doman on 2015-07-03.
//  Copyright (c) 2015 Kristofer Doman. All rights reserved.
//

import Foundation
import UIKit

struct DailyWeather {
    
    let maxTemperature: Int?
    let minTemperature: Int?
    let humidity: Int?
    let precipitationChance: Int?
    let summary: String?
    var icon: UIImage? = UIImage(named: "default.png")
    var largeIcon: UIImage? = UIImage(named: "default_large.png")
    var sunriseTime: String?
    var sunsetTime: String?
    var day: String?
    
    let dateFormatter = NSDateFormatter()
    
    init(dailyWeatherDictionary: [String: AnyObject]) {
        // The question mark is used after the as? incase the dictionary doesn't contain the temperatureMax key.
        // If it does, then it's cast to an int.
        maxTemperature = ((dailyWeatherDictionary["temperatureMax"] as? Int)! - 32) * 5 / 9
        minTemperature = ((dailyWeatherDictionary["temperatureMin"] as? Int)! - 32) * 5 / 9
        
        if let humidityFloat = dailyWeatherDictionary["humidity"] as? Double {
            humidity = Int(humidityFloat * 100)
        } else {
            humidity = nil
        }
        
        if let precipitationChanceFloat = dailyWeatherDictionary["precipProbability"] as? Double {
            precipitationChance = Int(precipitationChanceFloat * 100)
        } else {
            precipitationChance = nil
        }
        
        summary = dailyWeatherDictionary["summary"] as? String
        
        if let iconString = dailyWeatherDictionary["icon"] as? String, let iconEnum = Icon(rawValue: iconString) {
            (icon, largeIcon) = iconEnum.toImage()
        }
        
        if let  sunriseDate = dailyWeatherDictionary["sunriseTime"] as? Double {
            sunriseTime = timeStringFromUnixTime(sunriseDate)
        } 
        
        if let sunsetDate = dailyWeatherDictionary["sunsetTime"] as? Double {
            sunsetTime = timeStringFromUnixTime(sunsetDate)
        }
        
        if let time = dailyWeatherDictionary["time"] as? Double {
            day = dayStringFromTime(time)
        }
    }
    
    func timeStringFromUnixTime(unixTime: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixTime)
        
        // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = "hh:mm a"
        
        return dateFormatter.stringFromDate(date)
    }
    
    func dayStringFromTime(time: Double) -> String {
        let date = NSDate(timeIntervalSince1970: time)
        
        // Gets the country or location of your current device.
        dateFormatter.locale = NSLocale(localeIdentifier: NSLocale.currentLocale().localeIdentifier)
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.stringFromDate(date)
    }
}