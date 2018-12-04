//
//  main.swift
//  Q14
//
//  Created by Ma Xueyuan on 2018/12/04.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

let countries = [
    "Brazil", "Croatia", "Mexico",
    "Cameroon", "Spain", "Netherlands",
    "Chile", "Australia", "Colombia",
    "Greece", "Cote d'lvoire", "Japan",
    "Uruguay", "Costa Rica", "England",
    "Italy", "Switzerland", "Ecuador",
    "France", "Honduras", "Argentina",
    "Bosnia and Herzegovina", "Iran", "Nigeria",
    "Germany", "Portugal", "Ghana",
    "USA", "Belgium", "Algeria",
    "Russia", "Korea Republic"
]

var longestChain = [String]()

func nextCountry(countryId: Int, countries: [String], chain: [String]) {
    //get the lastLetter of current country
    let country = countries[countryId]
    let lastLetter = String(country.last!).uppercased()
    
    //remove the country from country list and add to the chain
    var newCountries = countries
    var newChain = chain
    newCountries.remove(at: countryId)
    newChain.append(country)
    
    if newChain.count > longestChain.count {
        longestChain = newChain
    }
    
    for i in stride(from: 0, to: newCountries.count, by: 1) {
        if newCountries[i].starts(with: lastLetter) {
            nextCountry(countryId: i, countries: newCountries, chain: newChain)
        }
    }
}

for i in stride(from: 0, to: countries.count, by: 1) {
    nextCountry(countryId: i, countries: countries, chain: [String]())
}

print(longestChain)
