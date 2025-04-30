//
//  HTTPError.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 4/30/25.
//

enum HTTPError: Error {
    case unknownError
    case invalidResponse
    case noResponse
    
    func description() -> String {
        switch self {
            case .unknownError:
                return "Something went wrong. Please try again later, or manually enter your zip code."
        case .invalidResponse, .noResponse:
            return "Your location couldn't be received. Please try again later, or manually enter your zip code."
        }
    }
}
