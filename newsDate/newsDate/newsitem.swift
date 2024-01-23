//
//  newsitem.swift
//  newsDate
//
//  Created by okokok on 22.01.2024.
//

import Foundation

struct NewsItem: Codable {
    var name: String
    var location: String
    var news: String
    var date: Date // Add a property for the date
    var imageName = ""

    init(name: String, location: String, news: String) {
        self.name = name
        self.location = location
        self.news = news
        self.date = Date() // Initialize the date when creating a new instance
    }
}
