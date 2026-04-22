//
//  CardBackground.swift
//  Clother
//
//  Created by RyanMFDR on 22/04/26.
//

import SwiftUI
import AVKit

struct CardBackground: View {
    
    var City: String
    var Time: String
    var Temp: String
    var Weather: String
    var Coordinate: String
    
    var body: some View {
        ZStack {
            CardRainVideo()
            
            // Dark overlay for text visibility
            LinearGradient(
                colors: [
                    Color.black.opacity(0.25),
                    Color.black.opacity(0.45)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            
            // Content
            HStack {
                
                VStack(alignment: .leading, spacing: 18) {
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(City)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text(Time)
                            .font(.subheadline)
                            .opacity(0.9)
                    }
                    
                    Text(Weather)
                        .font(.headline)
                        .fontWeight(.medium)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 18) {
                    
                    Text(Temp)
                        .font(.system(size: 40, weight: .bold))
                    
                    Text(Coordinate)
                        .font(.caption)
                        .opacity(0.9)
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

struct CardRainVideo: View {
    
    var body: some View {
        VideoPlayer(player: makePlayer())
            .scaledToFill()
            .disabled(true)
    }
    
    func makePlayer() -> AVPlayer {
        let url = Bundle.main.url(forResource: "rain", withExtension: "mp4")!
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
    CardBackground(
        City: "Kabupaten Badung",
        Time: "15:00",
        Temp: "30°",
        Weather: "Moderate Rain",
        Coordinate: "H:29° L:24°"
    )
}
