//
//  AreaNearby.swift
//  EskomSePushloadshedding
//
//  Created by Nomcebo Duma on 2023/04/12.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let status = try? JSONDecoder().decode(Status.self, from: jsonData)

import Foundation

// MARK: - Status
struct Nearby: Codable {
    let areas: [Area]?
}

// MARK: - Area
struct Area: Codable {
    let count: Int?
    let id, name: String?
    let region: Region?
}

enum Region: String, Codable {
    case eskomDirectCityOfJohannesburgGauteng = "Eskom Direct, City of Johannesburg, Gauteng"
    case jhbCityPower = "JHB City Power"
}
