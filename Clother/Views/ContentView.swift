//
//  ContentView.swift
//  Clother
//
//  Created by RyanMFDR on 17/04/26.
//

import SwiftUI

struct ContentView: View {
    let sunny_top = ["tee", "men_tee", "polo_shirt"]
    let sunny_bottom = ["short_pants", "long_skirt","short_skirt"]
    var weather: DailyWeather
    var body: some View {
        
        ZStack{
            //background
            LinearGradient(colors: [weather.WeatherCondition.color, Color.white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(edges: .all)
            
            //start scroll view
            ScrollView(.vertical, showsIndicators: false){
                Spacer()
                HStack{
                    Image(systemName: "location.fill")
                    Text(weather.location)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
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
                        Clothes_Caroussel(clothes: sunny_top)
                            .frame(width: .infinity, height: 150)
                            .clipped(antialiased: false)
                        
                        Clothes_Caroussel(clothes: sunny_bottom)
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
                    }.padding(.top,50)
                    
                }
                
                Text("Hello, World!")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Hello, World!")
                    .font(.subheadline)
                
                //feels like card
                HStack{
                    Spacer()
                    VStack{
                        Text("Feels Like")
                        Text(weather.feelsLike)
                            .font(.system(size: 50, weight: .bold))
                        Text("This will be the time picker")
                        
                    }
                    Spacer()
                }
                .padding()
                .background(Color.white.opacity(0.6))
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
                .background(Color.white.opacity(0.1))
                .cornerRadius(20)
                .padding()
            }
        }
    }
}

#Preview {
}
