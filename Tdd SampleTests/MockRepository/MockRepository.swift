//
//  MockRepository.swift
//  Tdd SampleTests
//
//  Created by Emincan Antalyalı on 27.10.2023.
//

import Foundation
@testable import Tdd_Sample
final class MockRepository {}

extension MockRepository: ArticlesFetchable {
    func fetchArticles(completion: @escaping((Result<[Article],ErrosTypes>)->())) {
        let arr = Array(repeating: Article(author: "Me", content: "Nothing"), count: 15)
        completion(.success(arr))
    }


}
extension MockRepository: ArticleDetailFetchable {
    func fetchArticle() {
        print("")
    }


}
extension MockRepository: NewArticleSendable {
    func sendAricle() {
        print("")
    }


}
