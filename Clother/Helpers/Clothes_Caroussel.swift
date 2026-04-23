//
//  Clothes_Caroussel.swift
//  Clother
//
//  Created by Luisa Haning Tyas on 21/04/26.
//

import SwiftUI



struct Clothes_Caroussel: View {
//    let title : String
//    let clothes: [String]
    var clothes : [String]
    @State var selected = 0
//    var clothes: Clothes
    let sunny_top = ["tee", "men_tee", "polo_shirt"]
    
    var body: some View {
//        HStack{
//            Image(systemName: "chevron.left")
//            Spacer()
//            Image("tee")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 300, height: 150)
//                .foregroundStyle(Color.blue)
//                
//            Spacer()
//            Image(systemName: "chevron.right")
//        }.padding(.horizontal,10)
//        ScrollView(.horizontal, showsIndicators: false){
//            HStack{
//                Spacer()
//                Image("tee")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 300, height: 150)
//                                .foregroundStyle(Color.blue)
//                
//                Image("tee")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 300, height: 150)
//                                .foregroundStyle(Color.blue)
//            }
//            
//        }
        ZStack{
            TabView(selection: $selected){
                ForEach(0..<clothes.count, id: \.self){index in
                    Image("\(clothes[index])")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 150)
                        .tag(index)
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            HStack{
                Button(action: {
                    withAnimation{
                        selected = max (0, selected - 1)
                    }
                }){
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .disabled(selected == 0)
                
                Spacer()
                
                Button(action: {
                    withAnimation{
                        selected = min (clothes.count - 1, selected + 1)
                    }
                }){
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                .disabled(selected == clothes.count - 1)
                    }.padding(.horizontal,20)
        }
    }
}

#Preview {
    Clothes_Caroussel(clothes:  ["tee","men_tee", "polo_shirt"])
}
