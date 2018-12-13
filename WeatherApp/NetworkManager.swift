//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by  Евгений on 12/12/2018.
//  Copyright © 2018 LosAnatoly Inc. All rights reserved.
//

import Foundation

class NetworkManager {
    
    enum Result<Value> {
        case success(Value)
        case failure(Error)
    }
    
    let appId = "ca9db572fae974e04fc67268c81830a9"
    
    func getWeatherData(parametrs: [String], completion: ((Result<WeatherStruct>) -> Void)?) -> () {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/weather"
        let queryItemLan = URLQueryItem(name: "lat", value: parametrs.first)
        let queryItemLon = URLQueryItem(name: "lon", value: parametrs.last)
        let queryItemUnits = URLQueryItem(name: "units", value: "metric")
        let queryItemToken = URLQueryItem(name: "appid", value: appId)
        urlComponents.queryItems = [queryItemLan, queryItemLon, queryItemUnits, queryItemToken]
        guard let url = urlComponents.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else { print("ERROR: - \(String(describing: responseError))"); return}
            guard let jsonData = responseData else { return }
            print(jsonData)
            let decoder = JSONDecoder()
            do {
                 let decodedData = try decoder.decode(WeatherStruct.self, from: jsonData)
                completion?(.success(decodedData))
            } catch {
                completion?(.failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}

