//
//  AreaSearch.swift
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
struct Search: Codable {
    let areas: [Areas]?
}

// MARK: - Area
struct Areas: Codable {
    let id, name: String?
    let region: Region?
}

enum Regional: String, Codable {
    case eskomDirectCityOfJohannesburgGauteng = "Eskom Direct, City of Johannesburg, Gauteng"
}
  


