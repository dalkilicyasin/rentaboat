//
//  CityResponseModel.swift
//  rentaboat
//
//  Created by yasin on 26.03.2024.
//

import Foundation

struct CityResponseModel: Codable {
    let Turkey: Cities?
}

struct Cities: Codable {
    let cities: [String]?
    let cityTowns: [CitiesTown]?
}
