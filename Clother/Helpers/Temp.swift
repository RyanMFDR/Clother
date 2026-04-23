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
//    var Clothes: [String]
    //var date
}

//enum Clothes: String, CaseIterable {
//    case sunny = "Sunny"
//    case cloudy = "Cloudy"
//    case rainy = "Rainy"
//    case stormy = "Stormy"
//    
//    var clothes: [String] {
//        switch self {
//        case .sunny:
//            return ["tee", "men_tee", "polo_shirt", "tank_top"]
//        case .rainy:
//            return ["hoodie", "emo_shirt"]
//        case .cloudy:
//            return ["boxy_shirt", "jacket_scarf", "plaid_shirt"]
//        case .stormy:
//            return ["cardigan", "turtleneck"]
//        
//        }
//    }
//}
//
//var sunny_top = ["tee", "men_tee", "polo_shirt", "tank_top"]

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
    var topClothes: [String] {
        switch self {
        case .sunny:
            return ["tee", "men_tee", "polo_shirt", "tank_top"]
        case .rainy:
            return ["hoodie", "emo_shirt","jacket_scarf"]
        case .cloudy:
            return ["boxy_shirt", "jacket_scarf", "plaid_shirt"]
        case .stormy:
            return ["cardigan", "turtleneck", "hoodie"]
        
        }
    }
    var bottomClothes: [String] {
        switch self {
        case .sunny:
            return ["short_pants", "long_skirt","short_skirt","chinos"]
        case .rainy:
            return ["sweatpants","flare_pants", "track_pants"]
        case .cloudy:
            return ["jeans", "sweatpants", "track_pants","chinos"]
        case .stormy:
            return ["sweatpants", "track_pants"]
        
        }
    }
    var clothingDescription: String {
        switch self {
        case .sunny:
            return "Wear light and breathable clothing."
        case .rainy:
            return "Wear warm and perhaps some waterproof outerwear."
        case .cloudy:
            return "Wear layered clothing to keep warm."
        case .stormy:
            return "Wear thick clothing and sturdy boots."
        
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
        WeatherCondition: selectedWeather,
        )
}
