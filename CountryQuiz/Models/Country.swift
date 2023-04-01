//
//  Flag.swift
//  CountryQuiz
//
//  Created by Bektemur Mamashayev on 01/04/23.
//

import Foundation

struct Country: Decodable {
    let name: String
    let alpha2Code: String
    let alpha3Code: String
    let countryCode: String
    let iso3166_2: String
    let region: String
    let subregion: String
    let intermediateRegion: String?
    let regionCode: String
    let subregionCode: String
    let intermediateRegionCode: String?

    enum CodingKeys: String, CodingKey {
        case name
        case alpha2Code = "alpha-2"
        case alpha3Code = "alpha-3"
        case countryCode = "country-code"
        case iso3166_2 = "iso_3166-2"
        case region
        case subregion = "sub-region"
        case intermediateRegion = "intermediate-region"
        case regionCode = "region-code"
        case subregionCode = "sub-region-code"
        case intermediateRegionCode = "intermediate-region-code"
    }
}
