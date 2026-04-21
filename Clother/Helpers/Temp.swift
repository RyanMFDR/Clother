//
//  Temp.swift
//  Clother
//
//  Created by Luisa Haning Tyas on 21/04/26.
//
import SwiftUI

struct DailyWeather {
    var temp: String
    var weather: String
//    var date: Date
    var feelsLike: String
    var high: String
    var low: String
    var humidity: String
    var location: String
    var weatherColor: weatherColor
}

enum weatherColor {
    case sunny, rainy, cloudy, stormy
    
    var color: Color {
        switch self {
        case .sunny:
            return .yellow
        case .rainy:
            return .blue
        case .cloudy:
            return .gray
        case .stormy:
            return .red
        }
    }
}
