//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by  Евгений on 12/12/2018.
//  Copyright © 2018 LosAnatoly Inc. All rights reserved.
//

import Foundation

class WeatherDataModel {
    
    var temperature : Int = 0
    var condition: Int = 0
    var city : String = ""
    
}

struct WeatherStruct: Codable {
    var name: String
    var main: InsideItems
}

struct InsideItems: Codable {
    var temp: Float
}
