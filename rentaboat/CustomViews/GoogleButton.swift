//
//  GoogleButton.swift
//  rentaboat
//
//  Created by yasin on 5.04.2024.
//

import SwiftUI

struct GoogleButton: View {
    let action: Action
    var body: some View {
        
        Button(action: {
            if let action {
                action()
            }
        }, label: {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .shadow(color: .gray, radius: 4, x: 0, y: 2)
                                
                Image("google")
                    .resizable()
                    .scaledToFit()
                    .padding(8)
                    .mask(
                        Circle()
                    )
            }.frame(width: 50, height: 50)
        })
    }
}

#Preview {
    GoogleButton(action: nil)
}
