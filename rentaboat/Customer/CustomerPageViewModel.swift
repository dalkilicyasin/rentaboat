//
//  CustomerPageViewModel.swift
//  rentaboat
//
//  Created by yasin on 27.03.2024.
//

import Foundation

class CustomerPageViewModel: ObservableObject {
    @Published var cityList: [String] = []
    @Published var townList: [String] = []
    @Published var selectedCity = "Select City"
    @Published var selectedTown = "Select Town"
    
    func getCityList() {
        NetworkManager.shared.callLocationList(type: CityResponseModel.self, chosenLocation: "cities") { [weak self] response in
            
            switch response {
            case .success(let cityModel):
                self?.cityList = cityModel.Turkey?.cities ?? []
            case .failure(let eror):
                print("\(eror.localizedDescription)")
            }
        }
    }
    
    func getTownList(_ selectedCity: String){
        NetworkManager.shared.callLocationList(type: CityResponseModel.self, chosenLocation: "towns") { [weak self] response in
            
            switch response {
            case .success(let cityModel):
                if let filteredCity = cityModel.Turkey?.cityTowns?.filter({$0.city == selectedCity}) {
                    self?.townList = filteredCity[0].towns ?? []
                }
            case .failure(let eror):
                print("\(eror.localizedDescription)")
            }
        }
    }
}
