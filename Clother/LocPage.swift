//
//  LocPage.swift
//  Clother
//
//  Created by RyanMFDR on 20/04/26.
//

import SwiftUI


struct LocPage: View {
    @State var searchText = ""
    
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
            if searchText.isEmpty {
                return locations.sorted()
            } else {
                return locations.filter {
                    $0.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    
    var body : some View {
        ZStack {
            VStack(spacing: 30) {
                    HStack(spacing: 10) {
                        //backButton
                        Button {
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                        }
                        .padding(.leading,30)
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
                
                //listLocation
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(filteredLocations, id: \.self) { location in
                            HStack {
                                Text(location)
                                    .fontWeight(.semibold)
                                
                                if location == "Kabupaten Badung" {
                                    Text("(Your Location)")
                                        .opacity(0.3)
                                        .font(.system(size: 14))
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
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
    LocPage()
}

