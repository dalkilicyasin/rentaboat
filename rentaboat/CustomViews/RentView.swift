//
//  RentView.swift
//  rentaboat
//
//  Created by yasin on 14.03.2024.
//

import SwiftUI

public typealias Action = (() -> ())?
struct RentView: View {
    let image: Image
    let title: String
    let action: Action
    init(image: Image,
         title: String,
         action: Action = nil) {
        self.image = image
        self.title = title
        self.action = action
    }
    var body: some View {
        VStack {
            Text(self.title)
                .font(.largeTitle)
            self.image
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(20)
           
        }.onTapGesture {
            if let action {
                action()
            }
        }
    }
}

#Preview {
    RentView(image: Image("rent"), title: "Customer")
}
