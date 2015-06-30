//: Playground - noun: a place where people can play

import Cocoa

private let forecastAPIKey = "6da53b24a6690dbd8aad480ee9ab808b"
let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)