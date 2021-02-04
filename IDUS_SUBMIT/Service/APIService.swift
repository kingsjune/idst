//
//  APIService.swift
//  IDUS_SUBMIT
//
//  Created by BHJ on 2021/02/04.
//

import Foundation

let requestURL = "http://itunes.apple.com/lookup?id=872469884"

class APIService {
    static let shared = APIService()
    
    func requestAPI(onComplete: @escaping (Result < ResponseModel , Error>) -> Void )  {
        guard let url = URL(string: requestURL)else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err{
                print(err)
                onComplete(.failure(err))
                return
            }
            do{
                let response = try JSONDecoder().decode(ResponseModel.self, from: data!)
                onComplete(.success(response))
            }
            catch let error{
                print(error)
            }
        }.resume()
    }
}
