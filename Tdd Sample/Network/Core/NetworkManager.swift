//
//  NetworkManager.swift
//  Tdd Sample
//
//  Created by Emincan Antalyalı on 27.10.2023.
//

import Foundation

protocol NewNetworkManagerInterface {
    func request<T: Codable>(_ endpoint: Endpoint,completion: @escaping((Result<T,ErrosTypes>)->()))
}

class NewNetworkManager: NewNetworkManagerInterface {

    static let shared = NewNetworkManager()
    private init() {}

    func request<T: Codable>(_ endpoint: Endpoint, completion: @escaping (Result<T, ErrosTypes>) -> Void) {

        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in

            if error != nil {
                completion(.failure(.generalError))
                return
            }

            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 , response.statusCode <= 299 else {
                completion(.failure(.responseError))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            self.handleResponse(data: data) { response in
                completion(response)
            }
        }
        task.resume()
    }

    //MARK:  Handle func

    fileprivate func handleResponse<T: Codable>(data: Data, compeltion: @escaping( (Result<T,ErrosTypes>)-> () ) ) {

        do {
            let succesData =  try JSONDecoder().decode(T.self, from: data)
            compeltion(.success(succesData))
        } catch  {
            print(error)
            compeltion(.failure(.parsingError))
        }

    }
}
