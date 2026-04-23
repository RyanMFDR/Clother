//
//  Temp.swift
//  Clother
//
//  Created by Luisa Haning Tyas on 21/04/26.
//
import SwiftUI


//MARK: - Main Model
struct DailyWeather : Identifiable {
    let id = UUID()
    var temp: String
    var feelsLike: String
    var high: String
    var low: String
    var humidity: String
    var location: String
//    var WeatherColor: WeatherColor
    var WeatherCondition: WeatherCondition
    //var date
}

//MARK: - Weather Color
//enum WeatherColor {
//    case sunny, rainy, cloudy, stormy
//    
//    var color: Color {
//        switch self {
//        case .sunny:
//            return .yellow
//        case .rainy:
//            return .blue
//        case .cloudy:
//            return .gray
//        case .stormy:
//            return .red
//        }
//    }
//}

//MARK: - Weather Condition + Color
enum WeatherCondition: String, CaseIterable {
    case sunny = "Sunny"
    case cloudy = "Cloudy"
    case rainy = "Rainy"
    case stormy = "Stormy"
    
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

//MARK: - Random Weather Generator
func generateRandomWeather(for city:String) -> DailyWeather {
//    let selectedWeather = [
//        ("Sunny", WeatherColor.sunny),
//        ("Rainy", WeatherColor.rainy),
//        ("Cloudy", WeatherColor.cloudy),
//        ("Stormy",WeatherColor.stormy)
//    ].randomElement()!
    
    let selectedWeather = WeatherCondition.allCases.randomElement()!
    
    let temp: Int
    
//    switch selectedWeather.1 {
//    case .sunny:
//        temp = Int.random(in: 30...36)
//    case .rainy:
//        temp = Int.random(in: 23...29)
//    case .cloudy:
//        temp = Int.random(in: 26...32)
//    case .stormy:
//        temp = Int.random(in: 22...27)
//    }
    
    switch selectedWeather {
        case .sunny:
            temp = Int.random(in: 30...36)
        case .rainy:
            temp = Int.random(in: 23...29)
        case .cloudy:
            temp = Int.random(in: 26...32)
        case .stormy:
            temp = Int.random(in: 22...27)
        }
    
    return DailyWeather(
        temp: "\(temp)°",
        feelsLike: "\(temp)°",
        high: "\(temp)°",
        low: "\(temp)°",
        humidity: "80%",
        location: city,
//        WeatherColor: selectedWeather.1,
        WeatherCondition: selectedWeather
        )
}
