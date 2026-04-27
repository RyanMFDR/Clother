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

///Weather Animation    
struct WeatherAnimationLayer: Identifiable {
    let id = UUID()
    let fileName: String
    let animationSpeed: CGFloat
    let xOffset: CGFloat
    let yOffset: CGFloat
    let scale: CGFloat
    let opacity: CGFloat
    let blur: CGFloat
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

//MARK: - Weather Color (Canceled)
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
            return Color(red: 0.43, green: 0.51, blue: 0.70)
        case .cloudy:
            return Color(.lightGray)
        case .stormy:
            return Color(red: 0.08, green: 0.12, blue: 0.22)
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
    var animationLayers: [WeatherAnimationLayer] {
        switch self {
        case .rainy:
            return [
                WeatherAnimationLayer(
                    fileName: "Rain.json",
                    animationSpeed: 1,
                    xOffset: 0,
                    yOffset: -80,
                    scale: 1.5,
                    opacity: 1,
                    blur: 0
                ),
                WeatherAnimationLayer(
                    fileName: "clouds loop.json",
                    animationSpeed: 0.5,
                    xOffset: 0,
                    yOffset: -190,
                    scale: 2.0,
                    opacity: 1,
                    blur: 2
                )
            ]
        case .cloudy:
            return [
                WeatherAnimationLayer(
                    fileName: "cloud.json",
                    animationSpeed: 1,
                    xOffset: 0,
                    yOffset: -80,
                    scale: 1.5,
                    opacity: 0.5,
                    blur: 0
                ),
                WeatherAnimationLayer(
                    fileName: "cloud.json",
                    animationSpeed: 1,
                    xOffset: 0,
                    yOffset: 0,
                    scale: -1,
                    opacity: 0.5,
                    blur: 0
                ),
                WeatherAnimationLayer(
                    fileName: "cloud.json",
                    animationSpeed: 1,
                    xOffset: 0,
                    yOffset: 200,
                    scale: -1,
                    opacity: 0.5,
                    blur: 0
                ),
                WeatherAnimationLayer(
                    fileName: "clouds loop.json",
                    animationSpeed: 0.5,
                    xOffset: 0,
                    yOffset: -190,
                    scale: 2.0,
                    opacity: 1,
                    blur: 2
                )
            ]
        case .sunny:
            return [
                WeatherAnimationLayer(
                    fileName: "Clear Day.json",
                    animationSpeed: 0.5,
                    xOffset: -32,
                    yOffset: -80,
                    scale: 5.0,
                    opacity:1,
                    blur:0
                ),
                WeatherAnimationLayer(
                    fileName: "Hot Effect.json",
                    animationSpeed: 0.5,
                    xOffset: -20,
                    yOffset: 10,
                    scale: 1,
                    opacity:0.2,
                    blur:0
                ),
                WeatherAnimationLayer(
                    fileName: "Hot Effect.json",
                    animationSpeed: 0.25,
                    xOffset: 200,
                    yOffset: 10,
                    scale: 1,
                    opacity:0.2,
                    blur:0
                )
            ]
        case .stormy:
            return [
                WeatherAnimationLayer(
                    fileName: "Rain.json",
                    animationSpeed: 2.0,
                    xOffset: 0,
                    yOffset: -190,
                    scale: 1.0,
                    opacity: 1,
                    blur: 1
                ),
                WeatherAnimationLayer(
                    fileName: "Rain.json",
                    animationSpeed: 2.0,
                    xOffset: 0,
                    yOffset: -190,
                    scale: 0.5,
                    opacity: 1,
                    blur: 2
                ),
                WeatherAnimationLayer(
                    fileName: "clouds loop.json",
                    animationSpeed: 0.5,
                    xOffset: 0,
                    yOffset: -250,
                    scale: 1.5,
                    opacity: 0.2,
                    blur: 4
                ),
                WeatherAnimationLayer(
                    fileName: "lightning.json",
                    animationSpeed: 0.75,
                    xOffset: 0,
                    yOffset: -200,
                    scale: 1.0,
                    opacity: 0.1,
                    blur: 5
                )
            ]
        }
    }
    
    //MARK: - Animation Config
//    LottieView(animation: .named("Clear Day.json"))
//        .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
//        .animationSpeed(0.5)
//        .offset(x:-32)
//        .offset(y:-80)
//        .scaleEffect(5.0)
//    
//    LottieView(animation: .named("Hot Effect.json"))
//        .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
//        .animationSpeed(0.5)
//        .opacity(0.2)
//        .offset(x:-20)
//        .offset(y:10)
//    
//    LottieView(animation: .named("Hot Effect.json"))
//        .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
//        .animationSpeed(0.20)
//        .opacity(0.5)
//        .offset(x:200)
//        .offset(y:10)

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
        temp: "\(temp)",
        feelsLike: "\(temp + 1)",
        high: "\(temp)",
        low: "\(temp)",
        humidity: "80",
        location: city,
//        WeatherColor: selectedWeather.1,
        WeatherCondition: selectedWeather,
        )
}
