//
//  ContentView.swift
//  Clother
//
//  Created by RyanMFDR on 17/04/26.
//

import SwiftUI
import Lottie

struct ContentView: View {
    @State private var selectedDate = Date()
    
//    let selectedLocation : String
    let maxDate = Date().addingTimeInterval(864_000)
    let sunny_bottom = ["short_pants", "long_skirt","short_skirt"]
    @State var weather: DailyWeather
    
    var nextTenDays: [Date] {
        (0..<10).compactMap { day in
            Calendar.current.date(byAdding: .day, value: day, to: .now)
        }
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack{
                //background

                
                LinearGradient(colors: [weather.WeatherCondition.color, Color..systemBackground], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(edges: .all)
    
                ForEach(weather.WeatherCondition.animationLayers) { layer in
                    LottieView(animation: .named(layer.fileName))
                        .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                        .animationSpeed(layer.animationSpeed)
                        .offset(x: layer.xOffset, y: layer.yOffset)
                        .scaleEffect(x: layer.scale, y: abs(layer.scale))
                        .opacity(layer.opacity)
                        .blur(radius: layer.blur)
                }
                
                //start scroll view
                ScrollView(.vertical, showsIndicators: false){
                    Spacer()
                    HStack{
                        Image(systemName: "location.fill")
                        NavigationLink{
                            LocationListView()
                                .navigationBarBackButtonHidden(true)
                        } label:{
                            Text(weather.location)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                        }
                        
                        
                    }
                    //outfit picker
                    ZStack{
                        //                    Image(systemName: "figure.arms.open")
                        //                        .resizable()
                        //                        .scaledToFit()
                        //                        .frame(width: 400, height: 400)
                        //                        .foregroundStyle(Color.white)
                        VStack{
                            
                            //shirt scroller
                            //                        HStack{
                            //                            Image(systemName: "chevron.left")
                            //                            Spacer()
                            //                            Image("tee")
                            //                                .resizable()
                            //                                .scaledToFit()
                            //                                .frame(width: 300, height: 150)
                            //                                .foregroundStyle(Color.blue)
                            //                                
                            //                            Spacer()
                            //                            Image(systemName: "chevron.right")
                            //                        }.padding(.horizontal,10)
                            Clothes_Caroussel(clothes: weather.WeatherCondition.topClothes)
                                .frame(width: .infinity, height: 150)
                                .clipped(antialiased: false)
                            
                            Clothes_Caroussel(clothes: weather.WeatherCondition.bottomClothes)
                                .frame(width: .infinity, height: 150)
                                .clipped(antialiased: false)
                            
                            //pants scroller
                            //                        HStack{
                            //                            Image(systemName: "chevron.left")
                            //                            Spacer()
                            //                            Image("long_skirt")
                            //                                .resizable()
                            //                                .scaledToFill()
                            //                                .frame(width: 150, height: 150)
                            //                                .foregroundStyle(Color.blue)
                            //                                
                            //                            Spacer()
                            //                            Image(systemName: "chevron.right")
                            //                        }.padding(.horizontal,10)
                        }.padding(.top,0)
                        
                    }
                    
                    Text("The weather is " + weather.WeatherCondition.rawValue)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(weather.WeatherCondition.clothingDescription)
                        .font(.subheadline)
                    
                    //feels like card
                    HStack{
                        Spacer()
                        VStack{
                            Text("Feels Like")
                            Text(weather.feelsLike + "C")
                                .font(.system(size: 50, weight: .bold))
                            //                        Text(weather.WeatherCondition.rawValue)
                            //                            .font(.title)
                            //
                            //                        DatePicker(
                            //                            "Select Date",
                            //                            selection: $selectedDate,
                            //                            in: Date()...maxDate,
                            //                            displayedComponents: [.date])
                            //                            .datePickerStyle(.graphical)
                            HorizontalDatePicker(
                                pickedDate: $selectedDate, dates: nextTenDays)
                                .onChange(of: selectedDate){oldValue, newValue in weather =
                                    generateRandomWeather(for: weather.location)
                                }
                            
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemBackground).opacity(0.3))
                    .cornerRadius(20)
                    .padding()
                    
                    //temp detail card
                    VStack{
                        HStack{
                            Text("Temperature")
                            Spacer()
                            Text(weather.temp)
                        }
                        Divider()
                        
                        HStack{
                            Text("Feels Like")
                            Spacer()
                            Text(weather.feelsLike)
                        }
                        Divider()
                        
                        HStack{
                            Text("High")
                            Spacer()
                            Text(weather.high)
                        }
                        Divider()
                        
                        HStack{
                            Text("Low")
                            Spacer()
                            Text(weather.low)
                        }
                        Divider()
                        
                        HStack{
                            Text("Humidity")
                            Spacer()
                            Text(weather.humidity)
                        }
                        
                        
                    }
                    .padding()
                    .background(Color(.systemBackground).opacity(0.1))
                    .cornerRadius(20)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView(weather:DailyWeather(temp: "30", feelsLike: "30", high: "30", low: "30", humidity: "30", location: "Bogor", WeatherCondition: .stormy))
}
