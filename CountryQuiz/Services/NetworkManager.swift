//
//  NetworkManager.swift
//  CountryQuiz
//
//  Created by Bektemur Mamashayev on 01/04/23.
//

import Foundation

enum Regions: String, CaseIterable {
    case Asia
    case Americas
    case Europe
    case Africa
    case Worldwide
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getData(for region: Regions) -> [Country] {
        var sortedCountries: [Country] = []
        if let path = Bundle.main.path(forResource: "all", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                print(data.count)
                let countries = try JSONDecoder().decode([Country].self, from: data)
                print(countries)
                switch region {
                case .Asia:
                    countries.forEach { country in
                        if country.region == Regions.Asia.rawValue {
                            sortedCountries.append(country)
                        }
                    }
                case .Americas:
                    countries.forEach { country in
                        if country.region == Regions.Americas.rawValue {
                            sortedCountries.append(country)
                        }
                    }
                case .Europe:
                    countries.forEach { country in
                        if country.region == Regions.Europe.rawValue {
                            sortedCountries.append(country)
                        }
                    }
                case .Africa:
                    countries.forEach { country in
                        if country.region == Regions.Africa.rawValue {
                            sortedCountries.append(country)
                        }
                    }
                case .Worldwide:
                    sortedCountries = countries
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
        return sortedCountries
    }
}
