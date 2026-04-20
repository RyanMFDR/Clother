//
//  ContentView.swift
//  Clother
//
//  Created by RyanMFDR on 17/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            //background
            LinearGradient(colors: [.orange, .yellow, .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(edges: .all)
            
            //start scroll view
            ScrollView(.vertical, showsIndicators: false){
                Spacer()
                HStack{
                    Image(systemName: "location.fill")
                    Text("Kabupaten Badung")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                }
                //outfit picker
                ZStack{
                    Image(systemName: "figure.arms.open")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                        .foregroundStyle(Color.white)
                    VStack{
                        
                        //shirt scroller
                        HStack{
                            Image(systemName: "chevron.left")
                            Spacer()
                            Image(systemName: "tshirt.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 158)
                                .foregroundStyle(Color.blue)
                                
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        
                        //pants scroller
                        HStack{
                            Image(systemName: "chevron.left")
                            Spacer()
                            Image(systemName: "square.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .foregroundStyle(Color.blue)
                                
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding(0)
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
                        Text("20°C")
                        Text("This will be the time picker")
                        
                    }
                    Spacer()
                }
                .padding()
                .background(Color.white.opacity(0.5))
                .cornerRadius(20)
                .padding()
                
                //temp detail card
                VStack{
                    HStack{
                        Text("Temperature")
                        Spacer()
                        Text("20°C")
                        
                    }
                    Divider()
                    
                }
                .padding()
                .background(Color.white.opacity(0.5))
                .cornerRadius(20)
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
