//
//  WebService.swift
//  USAPopulation
//
//  Created by Carlos Gonçalves on 21/11/2024.
//

import Foundation

class WebService {
    
    enum NetworkError: Error {
        case badUrl
        case noData
        case decodingError
    }
    
    enum SearchType {
        case nation
        case state
    }
    
    static let shared = WebService()
    
    private init() { }
    
    func getPopulationByState() async throws -> [ByStateModel] {
        guard let urlRequest = try urlSearchBy(.state) else {
            throw NetworkError.badUrl
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: urlRequest) { data, _, error in
                guard let data = data, error == nil else {
                    print("[WebService] Unable to get data")
                    continuation.resume(throwing: NetworkError.noData)
                    return
                }
                
                do {
                    let response = try JSONDecoder().decode(SearchByStateResponse.self, from: data)
                    print("[WebService] Decoding sucess - \(response.data)")
                    continuation.resume(returning: response.data)
                    
                } catch {
                    continuation.resume(throwing: NetworkError.decodingError)
                    print("[WebService] Unable to decode SearchByStateResponse -\(error.localizedDescription)")
                }
                
            }.resume()
        }
    }
    
    func getPopulationByNation() async throws -> [ByNationModel]{
        guard let urlRequest = try urlSearchBy(.nation) else {
            throw NetworkError.badUrl
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: urlRequest) { data, _, error in
                guard let data = data, error == nil else {
                    print("[WebService] Unable to get data")
                    continuation.resume(throwing: NetworkError.noData)
                    return
                }
                
                do {
                    let response = try JSONDecoder().decode(SearchByNationResponse.self, from: data)
                    print("[WebService] Decoding sucess - \(response.data)")
                    continuation.resume(returning: response.data)
                    
                } catch {
                    continuation.resume(throwing: NetworkError.decodingError)
                    print("[WebService] Unable to decode SearchByNationResponse -\(error.localizedDescription)")
                }
                
            }.resume()
        }
    }
    
    //for testing purposes
    func getPopulationByContinent() async throws -> [ByNationModel]{
        throw NetworkError.badUrl
    }
}


extension WebService {
    
    private func urlSearchBy(_ type: SearchType) throws -> URLRequest? {
    
        var urlString = ""
        switch type {
        case .nation:
            urlString = APIConstants.byNationURLString
        case .state:
            urlString = APIConstants.byStateURLSting
        }
        
        guard let url = URL(string: urlString) else {
            print("[WebService] Unable to retrieve URL")
            throw NetworkError.badUrl
        }
        
        return URLRequest(url: url)
        
    }
}
