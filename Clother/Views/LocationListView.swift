//
//  LocationListView.swift
//  Clother
//

import SwiftUI

struct LocationListView: View {
    
    //funcs for delete and re-order
    func deleteLocation(at offsets: IndexSet) {
        savedLocations.remove(atOffsets: offsets)
    }
    
    func moveLocation(from source:IndexSet, to destination : Int){
        withAnimation {
            savedLocations.move(fromOffsets: source, toOffset: destination)
        }
    }
    
    @State private var showLocPage = false
//    @State private var selectedLocation :String = ""
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
//                ScrollView(showsIndicators: false) {
//                    VStack(spacing: 16) {
//                        
//                        ForEach(savedLocations) { item in
//                            NavigationLink { ///To Each Main Page
//                                ContentView(weather: item)
//                                    .navigationBarBackButtonHidden(true)
//                                
//                                
//                            } label: { ///The Card
//                                CardLocation(weather: item)
//                            }
//                        }
//                    }
//                    
//                    .padding(.top, 10)
//                    .padding(.bottom, 90)
//                    
//                }
                
                //weather card list
                List{
                    ForEach(savedLocations) { item in
                        NavigationLink { ///To Each Main Page
                        ContentView(weather: item)
                        
                        
                        } label: { ///The Card
                        CardLocation(weather: item)
                        }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                            .navigationLinkIndicatorVisibility(.hidden)
                    }
                    .onDelete(perform: deleteLocation)
                    .onMove(perform: moveLocation)
                }
                .listStyle(.plain)
                .toolbar{
                    EditButton()
                }
                
                
                //searchBar
                Button {
                    showLocPage = true
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        Text("Search and add a city")
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
//            .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button("Edit") {
//                    }
//                }
//            }
            .navigationDestination(isPresented: $showLocPage) {
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
