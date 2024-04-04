//
//  TourListResponseModel.swift
//  rentaboat
//
//  Created by yasin on 3.04.2024.
//

import Foundation

struct TourListResponseModel: Codable {
    let tourList: [TourListModel]?
}

struct TourListModel: Codable, Hashable{
    let boatName: String?
    let city: String?
    let town: String?
    let departurePlace: String?
    let departureTime: String?
    let arrivalTime: String?
    let image: String?
    let include: String?
    let price: String?
    let destinations: [String]?
}
