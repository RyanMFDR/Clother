//
//  DateCard.swift
//  Clother
//
//  Created by Luisa Haning Tyas on 24/04/26.
//
import SwiftUI

struct DateCard: View {
    let date: Date
    let isSelected: Bool
    var body: some View {
        VStack{
            //day
            Text(date.formatted(.dateTime.weekday(.abbreviated)))
                .foregroundStyle(Color.secondary)
            //date
            Text(date.formatted(.dateTime.day()))
                .frame(width: 50, height: 50)
                .background(isSelected ? Color.blue : Color.white.opacity(0.3))
                
                        .foregroundStyle(isSelected ? .white : .secondary)
                        .cornerRadius(50)
                        .shadow(radius: isSelected ? 5 : 0)
        }
        
    }
}

struct HorizontalDatePicker: View {
    @Binding var pickedDate: Date
    let dates : [Date]
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 3){
                ForEach(dates, id:\.self){date in
                    DateCard(date: date, isSelected: Calendar.current.isDate(date, inSameDayAs: pickedDate))
                        .onTapGesture {
                            pickedDate = date
                        }
                    Spacer(minLength: 5)
                }
            }
        }
    }
}

//#Preview {
//    HorizontalDatePicker(selectedDate: )
//}
