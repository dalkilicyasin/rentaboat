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
    let subtitle: String
    let explanation: String
    let price: String
    
    init(image: String, title: String, subtitle: String, explanation: String, price: String) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.explanation = explanation
        self.price = price
    }
    
    var body: some View {
        VStack{
            Image("\(image)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(
                 .rect(cornerRadii: RectangleCornerRadii(topLeading: 16, topTrailing: 16)))
            Text("\(title)")
            Text("\(subtitle)")
            Text("\(explanation)")
            Text("\(price)")
        }.frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.clear)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(UIColor.lightGray), lineWidth: 2)
                    
            }
            .padding(20)
            

            Spacer()
    }
}

#Preview {
    TourListPreview(image: "fethiye", title: "Boat Tour", subtitle: "Boat Tour", explanation: "Tur", price: "200 TL")
}
