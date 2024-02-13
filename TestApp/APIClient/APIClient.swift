//
//  APIClient.swift
//  TestApp
//
//  Created by G Achyuth Kumar on 13/02/24.
//

import Foundation

typealias SuccessResponse = ((JSONDictionary) -> Void)
typealias Failure = ((CustomError?) -> Void)
typealias VoidCompletion = (() -> ())
typealias StringCompletion = ((String) -> ())

enum CustomError: Error {
    case parsingError(String)
    case apiError(String)
}


class APIClient {
    
    static let shared: APIClient = APIClient()
    
    let timeoutInterval: Double = 60
    var baseURL: URL? {
        URL(string: "https://www.jsonkeeper.com/b/6JS0")
    }
    
    private init() { }
}

extension APIClient {
    
    func callWebserviceForFecthingData(successCallBack: @escaping SuccessResponse,
                                       failureCallBack: @escaping Failure) {
        guard let baseURL else { return }
        var request = URLRequest(url: baseURL,
                                 timeoutInterval: timeoutInterval)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                let err = CustomError.apiError(error?.localizedDescription ?? AppMsg.unknownError)
                failureCallBack(err)
                return
            }
            guard let json = self.convertDataToDictionary(jsonData: data) else {
                let err = CustomError.parsingError(AppMsg.parsingFailed)
                failureCallBack(err)
                return }
            successCallBack(json)
        }
        task.resume()
    }
}


extension APIClient {
    
    private func convertDataToDictionary(jsonData: Data) -> JSONDictionary? {
        do {
            if let jsonObject = try JSONSerialization.jsonObject(with: jsonData,
                                                                 options: []) as? JSONDictionary {
                print(jsonObject)
                return jsonObject
            }
        } catch {
            print("Error converting data to JSON: \(error)")
        }
        return nil
    }
}
