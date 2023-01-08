//
//  NewsRequest.swift
//  37.7_Module.Serialized&Deserialized.Final Project
//
//  Created by Тимур Гарипов on 08.01.23.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class NewsRequest {

    static func getNewsData<T: Mappable>(type: T.Type, success: @escaping(_ imagesArray: [String], _ titlesArray: [String], _ descriptionsArray: [String]) -> Void) where T: URLtoString {
        //  Делаем запрос через Alamofire. Ответ будет состоять из конструкции типа ArticlesModel или ошибки
        AF.request(type.urlAPI()).responseObject { (response: DataResponse<ArticlesModel, AFError>) in
            //  Перебираем варианты
            switch response.result {
            //  В случае успеха создаем два массива (для картинок и заголовков) и добавляем в них значения из ответа
            case .success(let articles):
                var articlesImages: [String] = []
                var articlesTitles: [String] = []
                var articlesDescriptions: [String] = []
                
                for article in articles.articles! {
                    articlesImages.append(article.urlToImage ?? "")
                    articlesTitles.append(article.title ?? "")
                    articlesDescriptions.append(article.descript ?? "")
                }
                DispatchQueue.main.async {
                    //  Выдаем результаты для дальнейшего использования
                    success(articlesImages, articlesTitles, articlesDescriptions)
                }
            //  В случае ошибки просто выводим ее в консоль
            case .failure(let error):
                print(error)
            }
        }
    }
}
