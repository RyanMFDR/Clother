//
//  LocationListView.swift
//  Clother
//

import SwiftUI

struct LocationData: Identifiable {
    let id = UUID()
    let city: String
    let time: String
    let temp: String
    let weather: String
    let coordinate: String
    let condition: weatherCondition
}

struct LocationListView: View {
    
    @State private var searchText = ""
    
    let locations: [LocationData] = [
        .init(city: "Kabupaten Badung", time: "15:00", temp: "30°", weather: "Moderate Rain", coordinate: "H:29° L:24°", condition: .rainy),
        .init(city: "Jakarta", time: "14:00", temp: "33°", weather: "Sunny", coordinate: "H:34° L:27°", condition: .sunny),
        .init(city: "Bandung", time: "14:00", temp: "24°", weather: "Cloudy", coordinate: "H:25° L:18°", condition: .cloudy),
        .init(city: "Bogor", time: "14:00", temp: "25°", weather: "Storm", coordinate: "H:26° L:20°", condition: .storm),
    ]
    
    var filteredLocations: [LocationData] {
        if searchText.isEmpty {
            return locations
        } else {
            return locations.filter {
                $0.city.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment:.bottom) {
                
                Color.black.opacity(0.05)
                    .ignoresSafeArea()
                
                //cardLocation
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(filteredLocations) { item in
                            
                            NavigationLink {
                                ContentView()
                            } label: {
                                CardLocation(
                                    City: item.city,
                                    Time: item.time,
                                    Temp: item.temp,
                                    Weather: item.weather,
                                    Coordinate: item.coordinate,
                                    condition: item.condition
                                )
                            }
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 90)
                }
                
                //searchBar
                NavigationLink {
                    LocPage()
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
            }
        }
    }
}

#Preview {
    LocationListView()
}
