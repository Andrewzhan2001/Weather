//
//  dataModel.swift
//  Weather
//
//  Created by Tianyi
//

import Foundation
import SwiftUI

enum ForecastPeriod {
    case hourly
    case weekly
}

enum Weather: String {
    case cloudy = "Cloudy"
    case rainy = "Rainy"
    case sunny = "Sunny"
}

struct Forecast: Identifiable {
    var id = UUID()
    var date: String
    var weather: Weather
    var probability: Int
    var temperature: Int
    var high: Int
    var low: Int
    var icon: String {
        switch weather {
        case .cloudy:
            return "Cloud"
        case .rainy:
            return "Rain"
        case .sunny:
            return "Sun"
        }
    }
}

struct ForecastCity: Identifiable{
    var id = UUID()
    var name: String
    var cityIcon: Image {
        return Image(name)
    }
}

