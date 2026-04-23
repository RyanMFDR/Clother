//
//  LocPage.swift
//  Clother
//
//  Created by RyanMFDR on 20/04/26.
//

import SwiftUI


struct LocPage: View {
    @State private var searchText = ""
    @Binding var savedLocations: [DailyWeather]
    @Binding var showLocPage : Bool
    let currentLocations = "Jogja"
    
    let locations = [
            "Kabupaten Badung",
            "Jakarta",
          "Surabaya",
          "Bandung",
          "Medan",
          "Semarang",
          "Makassar",
          "Palembang",
          "Denpasar",
          "Yogyakarta",
          "Balikpapan",
          "Samarinda",
          "Pontianak",
          "Banjarmasin",
          "Manado",
          "Kupang",
          "Mataram",
          "Padang",
          "Pekanbaru",
          "Batam",
          "Banda Aceh",
          "Jambi",
          "Bengkulu",
          "Palu",
          "Kendari",
          "Ambon",
          "Jayapura",
          "Sorong",
          "Ternate",
          "Gorontalo",
          "Tarakan",
          "Malang",
          "Bogor",
          "Depok",
          "Bekasi",
          "Tangerang",
          "Cirebon",
          "Tasikmalaya",
          "Purwokerto",
          "Solo",
          "Magelang",
          "Kediri",
          "Blitar",
          "Pasuruan",
          "Probolinggo",
          "Jember",
          "Banyuwangi",
          "Mojokerto",
          "Cilegon",
          "Serang",
          "Sukabumi",
          "Banjarbaru",
          "Palangka Raya",
          "Bitung",
          "Tomohon",
          "Biak",
          "Merauke",
          "Labuan Bajo",
          "Batu",
          "Pangkalpinang"
        ];
    
    var filteredLocations: [String] {
        locations
            .filter {$0 != currentLocations }
            .filter {searchText.isEmpty || $0.localizedCaseInsensitiveContains(searchText) }
            .sorted()
        }
    
    var body : some View {
        ZStack {
            VStack(spacing: 30) {
                    HStack(spacing: 10) {
                        Spacer()
                        Text("Location")
                            .font(.title)
                            .fontWeight(.medium)
                            .padding(.leading,-50)
                        Spacer()
                    }
                
                //searchBar
                HStack(alignment:.center){
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $searchText)
                    Image(systemName: "microphone")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(40)
                .frame(width: 346, height: 24,alignment: .center)
//MARK: -
                //listLocation
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text(currentLocations)
                                .fontWeight(.semibold)
                            Text("Your Current Location")
                                .opacity(0.2).font(.system(size: 12))
                        }
                        
                        ForEach(filteredLocations, id: \.self) { location in
                            Button {
                                savedLocations.append(generateRandomWeather(for: location))
                                showLocPage = false
                            } label:{
                                HStack {
                                    Text(location)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Color.white)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                    .padding()
                }
                Spacer()
            }
        }.background(.secondary.opacity(0.2))
    }
}

#Preview {
}

