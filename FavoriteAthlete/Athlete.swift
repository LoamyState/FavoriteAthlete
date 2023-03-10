//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Jane Madsen on 3/3/23.
//

import Foundation

struct Athlete {
    var name: String
    var age: Int
    var league: String
    var team: String
    var description: String {
        return "\(age) year old. Team: \(team). League: \(league)."
    }
}
