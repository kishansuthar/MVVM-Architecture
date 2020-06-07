//
//  ApiManager.swift
//  MVVM
//
//  Created by Kishan Suthar on 07/06/20.
//  Copyright © 2020 Kishan Suthar. All rights reserved.
//

import Foundation
import Alamofire

enum  MoviewDataResponse {
    case success(result: [PopularMovieResult])
    case failure
}

class APIManager: NSObject {
    

       static func makeAPIRequest(method: HTTPMethod = .post, isFormDataRequest: Bool, isContainXAPIToken: Bool, isContainContentType: Bool, path: String, params: Parameters, bsaeUrl baseUrl: String = baseUrl, completion: @escaping (MoviewDataResponse) -> Void) {
            
            let baseURL = path
            var customHeader:[String:String] = [:]
            
            if isContainContentType {
                customHeader["Content-Type"] = "application/x-www-form-urlencoded"
            }
            
            var encoding: ParameterEncoding = JSONEncoding.default
            if isFormDataRequest {
                encoding = URLEncoding.default
            }
            
            Alamofire.request(baseURL, method: method, parameters: params, encoding: encoding, headers: customHeader).responseJSON { (response:DataResponse<Any>) in
            
                switch(response.result) {
                case .success(let result):
                    parseResult(result: result as! [String : Any], completion: completion)
                    break
                case .failure(_):
                    completion(.failure)
                    break
                }
            }
        }
        
    
    private static func parseResult(result: [String:Any],completion: @escaping (MoviewDataResponse) -> Void) {
        
        let response = PopularMovieModel(fromDictionary: result)
        guard let data = response.results else {
            completion(.failure)
            return
        }
        
        completion(.success(result: data))
    }

}
