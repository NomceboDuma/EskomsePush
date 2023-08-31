//
//  networkmanager.swift
//  EskomSePushloadshedding
//
//  Created by Nomcebo Duma on 2023/04/05.
//

import Foundation

class networkmanager {
    
    static let shared = networkmanager()
    let baseURLString  = " https://developer.sepush.co.za/business/2.0"
    let apiToken = "EBC70125-7F75438C-AC1F3001-7E8E7337"
    let timeout = 30.0
    
    
    
    func getStatus (completion: @escaping(Status?, Error?) -> ()) {
        let urlString = baseURLString + "/status"
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Local", code: -1 ))
            return
            
        }
        
        var request = URLRequest(url: url, timeoutInterval: timeout)
        
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["token" : apiToken]
        
        let task  = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                
                guard let data = data,
                      error == nil else {
                    completion(nil, error)
                    return
                }
                do {
                    let status  = try JSONDecoder().decode(Status.self, from: data)
                    completion(status, nil)
                } catch {
                    print(error.localizedDescription)
                    print(error)
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
    
    
    
    func getStages (id: String, test: String, completion: @escaping (Stages?, Error?) -> ()) {
        let urlString = baseURLString + "/area?id=\(id)eskde-10-fourwaysext10cityofjohannesburggauteng&test=\(test)"
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Local", code: -1 ))
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: timeout)
        
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["token" : apiToken]
        
        let task  = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                
                guard let data = data,
                      error == nil else {
                    completion(nil, error)
                    return
                }
                do {
                    let stages  = try JSONDecoder().decode(Stages.self, from: data)
                    completion(stages, nil)
                } catch {
                    print(error.localizedDescription)
                    print(error)
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
    
    
    func getNearby (completion: @escaping (Nearby?, Error?) -> ()) {
        let urlString = baseURLString + "/areas_nearby?lat=-26.0269658&lon=28.0137339"
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Local", code: -1 ))
            return
        }
        
        var request = URLRequest(url: url, timeoutInterval: timeout)
        
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["token" : apiToken]
        
        let task  = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                
                guard let data = data,
                      error == nil else {
                    completion(nil, error)
                    return
                }
                do {
                    let nearby  = try JSONDecoder().decode(Nearby.self, from: data)
                    completion( nearby, nil)
                } catch {
                    print(error.localizedDescription)
                    print(error)
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
    
    func mockAreas(completion: @escaping(Search?, Error?) -> ()) {
        let result =  Bundle.main.decode(Search.self, from: "mockSearch.jason")
        completion(result,nil)
    }
    
    func getAreas(searchText: String, completion: @escaping(Search?, Error?) -> ()) {
        let urlString = baseURLString + "/areas_search?text=\(searchText)"
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Local", code: -1 ))
            return
        }
    
        
        var request = URLRequest(url: url, timeoutInterval: timeout)
        
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["token" : apiToken]
        
        let task  = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                
                guard let data = data,
                      error == nil else {
                    completion(nil, error)
                    return
                }
                do {
                   
                    let areaSearch  = try JSONDecoder().decode(Search.self, from: data)
                    completion(areaSearch, nil)
                } catch {
                    print(error.localizedDescription)
                    print(error)
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
        
}

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
