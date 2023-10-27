//
//  Repository.swift
//  Tdd Sample
//
//  Created by Emincan Antalyalı on 27.10.2023.
//

import Foundation

final class Repository {
    
}

extension Repository: ArticlesFetchable {
    func fetchArticles(completion: @escaping ((Result<[Article], ErrosTypes>) -> ())) {
        completion(.failure(.generalError))
    }


}
