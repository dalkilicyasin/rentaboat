//
//  TourListVieModel.swift
//  rentaboat
//
//  Created by yasin on 2.04.2024.
//

import Foundation

final class TourListVieModel: ObservableObject {
    @Published  var tourlist : [TourListModel] = []
   
    func callTourlist() {
        NetworkManager.shared.callLocationList(type: TourListResponseModel.self, chosenLocation: "turlist") { [weak self] response in
            switch response {
            case .success(let result):
                self?.tourlist = result.tourList ?? []
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}
