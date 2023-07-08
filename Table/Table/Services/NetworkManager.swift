//
//  NetworkManager.swift
//  Table
//
//  Created by Алёна Максимова on 06.07.2023.
//

import Moya
import Foundation

protocol NetworkManagerProtocol {
    func fetchCharacters(completion: @escaping (Result<CharacterResponseModel, Error>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    private var provider =  MoyaProvider<APITarget>()
    
    func fetchCharacters(completion: @escaping (Result<CharacterResponseModel, Error>) -> Void) {
        request(target: .getCharacters, completion: completion)
    }
}

private extension NetworkManager {
    func request<T:Decodable>(target: APITarget, completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
                
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
