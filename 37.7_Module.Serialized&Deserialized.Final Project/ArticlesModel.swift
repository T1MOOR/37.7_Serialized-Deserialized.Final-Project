//
//  ArticlesModel.swift
//  37.7_Module.Serialized&Deserialized.Final Project
//
//  Created by Тимур Гарипов on 08.01.23.
//

import Foundation
import ObjectMapper

protocol URLtoString {
    static func urlAPI() -> String
}

class ArticlesModel: Mappable, URLtoString {
    
    static func urlAPI() -> String {
        return "https://newsapi.org/v2/top-headlines?country=ru&apiKey=3b2f5e24fb76428093e4133cc7c345f1"
    }
    
    var status: String?
    var totalResults: Int?
    var articles: [Article]?

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: ObjectMapper.Map) {
        status <- map["status"]
        totalResults <- map["totalResults"]
        articles <- map["articles"]
    }
}

class Article: Mappable {
    
    var source: Source?
    var author: String?
    var title: String?
    var descript: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    required convenience init?(map: ObjectMapper.Map) {
        self.init()
    }
    
    func mapping(map: ObjectMapper.Map) {
        source <- map["source"]
        author <- map["author"]
        title <- map["title"]
        descript <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
        content <- map["content"]
    }
}

class Source: Mappable {
    
    var id: String?
    var name: String?
    
    required convenience init?(map: ObjectMapper.Map) {
        self.init()
    }
    
    func mapping(map: ObjectMapper.Map) {
        id <- map["id"]
        name <- map["name"]
    }
}
