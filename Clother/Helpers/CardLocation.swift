//
//  CardBackground.swift
//  Clother
//
//  Created by RyanMFDR on 22/04/26.
//

import SwiftUI
import AVKit

struct CardLocation: View {
    var weather : DailyWeather
    
    var body: some View {
        ZStack {
            cardBackground(condition: weather.WeatherCondition)
    
            LinearGradient(
                colors: [
                    Color.black.opacity(0.25),
                    Color.black.opacity(0.45)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            
            //Card
            HStack {
                VStack(alignment: .leading, spacing: 18) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(weather.location)
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("17:00")
                            .font(.subheadline)
                            .opacity(0.9)
                            .padding(.bottom,10)
                    }
                    Text(weather.WeatherCondition.rawValue)
                        .font(.headline)
                        .fontWeight(.medium)
                }
                Spacer()
                
                VStack(alignment: .trailing, spacing: 18) {
                    Text(weather.temp)
                        .font(.system(size: 58, weight: .bold))
                }
            }
            .foregroundColor(.white)
            .padding()
        }
        .frame(height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(.white.opacity(0.15), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 8)
        .padding(.horizontal)
    }
}

struct cardBackground: View {
    var condition : WeatherCondition
    var body: some View {
        VideoPlayer(player: makePlayer())
            .scaledToFill()
            .disabled(true)
    }
    func makePlayer() -> AVPlayer {
        guard let url = Bundle.main.url(forResource: condition.rawValue, withExtension: "mp4") else {
            return AVPlayer()
        }
        let player = AVPlayer(url: url)
        
        player.isMuted = true
        player.play()
        player.actionAtItemEnd = .none
        
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { _ in
            player.seek(to: .zero)
            player.play()
        }
        
        return player
    }
}

#Preview {
    CardLocation(
        weather: DailyWeather(
                    temp: "24",
                    feelsLike: "22",
                    high: "26",
                    low: "20",
                    humidity: "92%",
                    location: "Bogor",
                    WeatherCondition: .stormy,
                    )
    )
}
