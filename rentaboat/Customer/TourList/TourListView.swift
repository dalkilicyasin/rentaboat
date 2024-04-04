//
//  TurlistPageView.swift
//  rentaboat
//
//  Created by yasin on 31.03.2024.
//

import SwiftUI

struct TourListView: View {
    @ObservedObject var viewModel: TourListVieModel
    init(viewModel: TourListVieModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(self.viewModel.tourlist, id: \.self){
                    TourListPreview(image: "\($0.image ?? "")", title: "\($0.boatName ?? "")", town: "\($0.town ?? "")", city: "\($0.city ?? "")", subtitle: "", explanation: "\($0.include ?? "")", price: "\($0.price ?? "")", departurePlace: "\($0.departurePlace ?? "")", departureTime: "\($0.departureTime ?? "")", arrivalTime: "\($0.arrivalTime ?? "")", destinations: $0.destinations ?? [])
                }
            }
        }.onAppear{
            self.viewModel.callTourlist()
        }
    }
}

#Preview {
    TourListView(viewModel: TourListVieModel())
}
