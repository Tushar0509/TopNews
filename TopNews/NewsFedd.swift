//
//  NewsFedd.swift
//  TopNews
//
//  Created by Tushar Elangovan on 12/18/20.
//

import Foundation

struct NewFeed: Codable {
    var status: String = "" //if you know its never gonna be nil
    var totalResults: Int = 0
    var articles:[Article] //Not sure if it comes back as nil
}
struct Article: Codable {
    var author: String?
    var title: String?
    var decription: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
