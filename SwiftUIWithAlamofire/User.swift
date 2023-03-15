//
//  User.swift
//  SwiftUIWithAlamofire
//
//  Created by Fatih Durmaz on 16.03.2023.
//

import Foundation

struct User: Codable, Identifiable {
    let id : Int
    let name : String
    let email: String
}
