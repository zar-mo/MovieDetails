//
//  APIRequest.swift
//  MovieDetails
//
//  Created by Abouzar Moradian on 9/20/24.
//

import Foundation

protocol APIRequest {
    
    associatedtype Response: Codable
    
    static var acceptableStatusCode: Set<Int> {get}
    var method: String {get}
    var path: String {get}
    var body: Data? {get}
}

extension APIRequest {
    
    var method: String {return "GET" }
    var body: Data? { return nil }
    static var acceptableStatusCode: Set<Int> {return Set([200])}
    
}

enum APIRequestError: Error, LocalizedError{
    
    case pathEncodingFailed(String), urlBuildFailed
    
    var errorDescription: String? {
        switch self {
        case .pathEncodingFailed(let path):
            return "Failed to add percent escapes to path \(path)"
        case .urlBuildFailed:
            return "Failed to build url"
        }
    }
}

extension APIRequest {
    
    func with(baseUrl url: URL) throws -> URLRequest {
        
        guard let escapedPath =
                path.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)
        else{
            throw APIRequestError.pathEncodingFailed(path)
            }
        
        var components = URLComponents()
        components.scheme = url.scheme
        components.host = url.host
        components.port = url.port
        components.percentEncodedPath = String(format: "/%@", escapedPath)
        components.path = url.path.appending(components.path)
        
        guard let requestUrl = components.url else { throw APIRequestError.urlBuildFailed }
        
        var request = URLRequest(url: requestUrl)

        request.httpMethod = method
        request.httpBody = body
        

        return request


        
        
        
    }
}

struct GetMoviesRequest: APIRequest {
    
    typealias Response = [Movie]
    
    var path: String { return "/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json" }
   
}

struct GetUsersRequest: APIRequest {
    
    typealias Response = [User]
    var path: String { Constants.userAPIPath.rawValue}
}

struct GetAlbumsRequest: APIRequest {
    
    typealias Response = [Album]
    var path: String { Constants.albumAPIPath.rawValue}
}
