//
//  LocationListView.swift
//  Clother
//

import SwiftUI

struct LocationListView: View {
    @State private var showLocPage = false
    @State private var savedLocations: [DailyWeather] = [
        generateRandomWeather(for: "Jakarta"),
        generateRandomWeather(for: "Jogja"),
        generateRandomWeather(for: "Bali")
    ]
    var body: some View {
        NavigationStack {
            ZStack(alignment:.bottom) {
                Color.black.opacity(0.05)
                    .ignoresSafeArea()
                
                //cardLocation
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(savedLocations) { item in
                            NavigationLink { ///To Each Main Page
                                ContentView(weather: item)
                                    .navigationBarBackButtonHidden(true)
                            } label: { ///The Card
                                CardLocation(weather: item)
                            }
                        }
                    }
                    
                    .padding(.top, 10)
                    .padding(.bottom, 90)
                    
                }
                
                //searchBar
                Button {
                    showLocPage = true
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        Text("Search for a city or airport")
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Image(systemName: "mic.fill")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .padding(.horizontal)
                    .padding(.bottom, 12)
                }
            }
            .navigationTitle("Location")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit") {
                    }
                }
            }.navigationDestination(isPresented: $showLocPage) {
                LocPage( ///Navigate to LocPage
                    savedLocations : $savedLocations,
                    showLocPage: $showLocPage
                )
            }
        }
    }
}

#Preview {
    LocationListView()
}
