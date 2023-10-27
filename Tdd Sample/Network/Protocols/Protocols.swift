//
//  Protocols.swift
//  Tdd Sample
//
//  Created by Emincan Antalyalı on 27.10.2023.
//

import Foundation

protocol ArticlesFetchable: AnyObject {
    func fetchArticles(completion: @escaping((Result<[Article],ErrosTypes>)->()))
}
protocol ArticleDetailFetchable: AnyObject {
    func fetchArticle()
}
protocol NewArticleSendable: AnyObject {
    func sendAricle()
}
