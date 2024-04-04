//
//  TourListPreview.swift
//  rentaboat
//
//  Created by yasin on 31.03.2024.
//

import SwiftUI

struct TourListPreview: View {
    let image: String
    let title: String
    let town: String
    let city: String
    let subtitle: String
    let explanation: String
    let price: String
    let departurePlace: String
    let departureTime: String
    let arrivalTime: String
    let destinations: [String]
    
    init(image: String, title: String, town: String, city: String,  subtitle: String, explanation: String, price: String, departurePlace: String, departureTime: String, arrivalTime: String, destinations: [String]) {
        self.image = image
        self.title = title
        self.town = town
        self.city = city
        self.subtitle = subtitle
        self.explanation = explanation
        self.price = price
        self.departurePlace = departurePlace
        self.departureTime = departureTime
        self.arrivalTime = arrivalTime
        self.destinations = destinations
    }
    
    var body: some View {
        VStack{
            Image("\(image)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(
                 .rect(cornerRadii: RectangleCornerRadii(topLeading: 16, topTrailing: 16)))
            Text("\(title)")
                .font(
                    .system(size: 26)
                    .weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
                
            HStack{
                Text("\(town), \(city)")
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
                .padding(.top, 5)
            Divider()
                .padding(10)
            
                Text("Departure Place: \(departurePlace)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                        .padding(.top, 5)
            
            HStack {
                Text("Departure : \(departureTime)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                        .padding(.top, 5)
                Spacer()
                Text("Arrival: \(arrivalTime)")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 8)
                        .padding(.top, 5)
            }
            HStack {
                Text("· ")
                    .font(
                        .system(size: 26)
                        .weight(.bold))
                        .padding(.leading, 8)
                        .padding(.top, 5)
                Text("\(explanation)")
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .padding(10)
            
            VStack {
                Text("Destinations : ")
                    .font(
                        .system(size: 16)
                        .weight(.bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                        .padding(.top, 5)
                VStack {
                    let countHalf = abs(self.destinations.count/2)
                    
                    ForEach(0..<countHalf, id: \.self){ index in
                        HStack{
                            Text("· \(destinations[index])")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                                .padding(.top, 5)
                            
                            Text("· \(destinations[index + countHalf])")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                                .padding(.top, 5)
                        }
                    }
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
            Spacer(minLength: 20)
            Text("Total Price: \(price)")
                .foregroundStyle(.white)
                .padding(20)
                .frame(minWidth: 320)
                .font(.custom("Helvetica", size: 20)
                    .bold())
                .background(Color(UIColor(red: 0.23, green: 0.75, blue: 0.62, alpha: 1)))
                .cornerRadius(10)
                
            Spacer(minLength: 10)
        }.frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.clear)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(UIColor.lightGray), lineWidth: 1)
                    
            }
            .padding(20)
            Spacer()
    }
}

#Preview {
    TourListPreview(image: "fethiye", title: "Boat Tour", town: "Kaş", city: "Antalya", subtitle: "Boat Tour", explanation: "Tur Açıklaması", price: "200 TL", departurePlace: "Kaş", departureTime: "07:00",arrivalTime: "17:00", destinations: [ "Kekova Adası", "Hidayet Koyu", "Patara Plaji","Kalkan","LimanAğzı","Çoban Koyu","Kaputaj Plajı"])
}
