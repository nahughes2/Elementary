//
//  NetworkManager.swift
//  Elementary!
//
//  Created by Nathan Hughes on 3/5/22.
//

import Foundation
class NetworkManager {
    
    let headers = [
        "x-rapidapi-host": "periodictable.p.rapidapi.com",
        "x-rapidapi-key": "c9059a0483mshd098fbc08457c71p124058jsnf9b6e1d55443"
    ]
    
    var data = Data()
    
    func fetchData() async throws -> [Element]? {
        guard let url = URL(string: "https://periodictable.p.rapidapi.com/") else {
            // error
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
    
        do {
            let (data,_) = try await URLSession.shared.data(for: request) 
            print(data)
            let result = try JSONDecoder().decode([Element].self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
       
    func decodeJson(data: Data) -> ElementList? {
        do {
            let elementList = try JSONDecoder().decode(ElementList.self, from: data)
            return elementList
        } catch {
            //TODO: - handle error
            print(error)
            return nil
        }
    }
    
}
    
