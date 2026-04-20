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
                }
                ZStack{
                    Image(systemName: "figure.arms.open")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                        .foregroundStyle(Color.white)
                    VStack{
                        Spacer()
                        HStack{
                            Image(systemName: "chevron.left")
                            Spacer()
                            Image(systemName: "tshirt.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .foregroundStyle(Color.blue)
                                
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding(10)
                        HStack{
                            Image(systemName: "chevron.left")
                            Spacer()
                            Image(systemName: "square.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundStyle(Color.blue)
                                
                            Spacer()
                            Image(systemName: "chevron.right")
                        }.padding(10)
                    }
                    
                }
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}
