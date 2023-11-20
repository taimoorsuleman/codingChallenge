//
//  NetworkManager.swift
//  CodingExercise
//
//  Created by Taimoor Suleman on 11/11/2023.
//

import Foundation

struct NetworkManager {
    
    var session: URLSession
    
    init( session: URLSession = .shared) {
        self.session = session
    }

    
    func createRequest(for url: String) -> URLRequest? {
        guard let url = URL(string: url) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func executeRequest<T: Codable>(request: URLRequest, completion: ((T?, Error?) -> Void)?) {
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion?(nil,NetworkError.unableToComplete )
                return
            }
            if let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
               
                    completion?(decodedResponse, nil)
                
            } else {
                completion?(nil, NetworkError.invalidData)
            }
        }
        dataTask.resume()
    }
    
    
    // ASYNC  AWAIT  CALL
    func executeRequest<T:Codable>(request:URLRequest) async throws -> T{
        
        let session = URLSession(configuration: .default)

        //Wait for the response, and data is not optional here
        let (data,urlResponse) = try await session.data(for: request)
        
        guard (urlResponse as? HTTPURLResponse)?.statusCode == 200 else{
            throw NetworkError.invalidResponse
        }
        debugPrint("🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻")
        debugPrint("🚀🚀🚀🚀\n Request : \(request) \n🚀🚀🚀🚀")
        debugPrint("🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻🧑‍💻\n\n")


        return try JSONDecoder().decode(T.self, from: data)
    }
}
