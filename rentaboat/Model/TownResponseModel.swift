//
//  TownResponseModel.swift
//  rentaboat
//
//  Created by yasin on 29.03.2024.
//

import Foundation

struct TownResponseModel: Codable {
    let Turkey: Cities?
}

struct CitiesTown: Codable {
    let city: String?
    let towns: [String]?
}
