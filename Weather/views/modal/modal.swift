//
//  modal.swift
//  Weather
//
//  Created by Tianyi
//

import Foundation
import SwiftUI

struct dataSets {
    static func hour(place: String) -> [Forecast] {
        switch place{
        case "Shanghai" :
            return [
                // one hour before
                Forecast(date: "10", weather: .cloudy, probability: 0, temperature: 10, high: 24, low: 18),
                Forecast(date: "11", weather: .cloudy, probability: 0, temperature: 10, high: 24, low: 18),
                Forecast(date: "12", weather: .cloudy, probability: 0, temperature: 10, high: 24, low: 18),
                Forecast(date: "13", weather: .cloudy, probability: 0, temperature: 11, high: 24, low: 18),
                Forecast(date: "14", weather: .cloudy, probability: 0, temperature: 11, high: 24, low: 18),
                Forecast(date: "15", weather: .cloudy, probability: 0, temperature: 11, high: 24, low: 18)
            ]
        case "Dubai" :
            return [
                // one hour before
                Forecast(date: "06", weather: .sunny, probability: 0, temperature: 18, high: 24, low: 18),
                Forecast(date: "07", weather: .sunny, probability: 0, temperature: 19, high: 24, low: 18),
                Forecast(date: "08", weather: .sunny, probability: 0, temperature: 20, high: 24, low: 18),
                Forecast(date: "09", weather: .sunny, probability: 0, temperature: 22, high: 24, low: 18),
                Forecast(date: "10", weather: .sunny, probability: 0, temperature: 24, high: 24, low: 18),
                Forecast(date: "11", weather: .sunny, probability: 0, temperature: 16, high: 24, low: 18)
            ]
        case "Paris" :
            return [
                // one hour before
                Forecast(date: "03", weather: .cloudy, probability: 0, temperature: -2, high: 24, low: 18),
                Forecast(date: "04", weather: .cloudy, probability: 0, temperature: -2, high: 24, low: 18),
                Forecast(date: "05", weather: .cloudy, probability: 0, temperature: -2, high: 24, low: 18),
                Forecast(date: "06", weather: .cloudy, probability: 0, temperature: -2, high: 24, low: 18),
                Forecast(date: "07", weather: .cloudy, probability: 0, temperature: -2, high: 24, low: 18),
                Forecast(date: "08", weather: .cloudy, probability: 0, temperature: -2, high: 24, low: 18)
            ]
        case "Barcelona" :
            return [
                // one hour before
                Forecast(date: "03", weather: .cloudy, probability: 0, temperature: 8, high: 24, low: 18),
                Forecast(date: "04", weather: .cloudy, probability: 0, temperature: 8, high: 24, low: 18),
                Forecast(date: "05", weather: .rainy, probability: 30, temperature: 8, high: 24, low: 18),
                Forecast(date: "06", weather: .cloudy, probability: 0, temperature: 7, high: 24, low: 18),
                Forecast(date: "07", weather: .cloudy, probability: 0, temperature: 7, high: 24, low: 18),
                Forecast(date: "08", weather: .cloudy, probability: 0, temperature: 7, high: 24, low: 18)
            ]
        default: // new york
            return [
                // one hour before
                Forecast(date: "21", weather: .cloudy, probability: 0, temperature: 4, high: 24, low: 18),
                Forecast(date: "22", weather: .cloudy, probability: 0, temperature: 4, high: 24, low: 18),
                Forecast(date: "23", weather: .cloudy, probability: 0, temperature: 4, high: 24, low: 18),
                Forecast(date: "00", weather: .rainy, probability: 20, temperature: 4, high: 24, low: 18),
                Forecast(date: "01", weather: .cloudy, probability: 0, temperature: 4, high: 24, low: 18),
                Forecast(date: "02", weather: .cloudy, probability: 0, temperature: 4, high: 24, low: 18)
            ]
        }
    }
    static func week(place: String) -> [Forecast] {
        switch place{
        case "Barcelona" :
            return [
                Forecast(date: "Tue", weather: .sunny, probability: 0, temperature: 9, high: 11, low: 8),
                Forecast(date: "Wed", weather: .rainy, probability: 50, temperature: 8, high: 11, low: 7),
                Forecast(date: "Thu", weather: .cloudy, probability: 0, temperature: 8, high: 10, low: 4),
                Forecast(date: "Fri", weather: .cloudy, probability: 0, temperature: 8, high: 12, low: 3),
                Forecast(date: "Sat", weather: .cloudy, probability: 0, temperature: 7, high: 13, low: 2),
                Forecast(date: "Sun", weather: .cloudy, probability: 0, temperature: 7, high: 14, low: 3)
            ]
        case "Paris" :
            return [
                Forecast(date: "Tue", weather: .sunny, probability: 0, temperature: 9, high: 6, low: 0),
                Forecast(date: "Wed", weather: .sunny, probability: 0, temperature: -2, high: 6, low: -2),
                Forecast(date: "Thu", weather: .cloudy, probability: 0, temperature: 8, high: 6, low: -3),
                Forecast(date: "Fri", weather: .cloudy, probability: 0, temperature: 8, high: 9, low: 2),
                Forecast(date: "Sat", weather: .cloudy, probability: 0, temperature: 7, high: 10, low: 2),
                Forecast(date: "Sun", weather: .cloudy, probability: 0, temperature: 7, high: 10, low: 4)
            ]
        case "Dubai" :
            return [
                Forecast(date: "Tue", weather: .sunny, probability: 0, temperature: 9, high: 32, low: 18),
                Forecast(date: "Wed", weather: .sunny, probability: 0, temperature: 19, high: 28, low: 19),
                Forecast(date: "Thu", weather: .sunny, probability: 0, temperature: 8, high: 25, low: 18),
                Forecast(date: "Fri", weather: .sunny, probability: 0, temperature: 8, high: 23, low: 17),
                Forecast(date: "Sat", weather: .sunny, probability: 0, temperature: 7, high: 26, low: 14),
                Forecast(date: "Sun", weather: .sunny, probability: 0, temperature: 7, high: 28, low: 13)
            ]
        case "Shanghai" :
            return [
                Forecast(date: "Tue", weather: .cloudy, probability: 0, temperature: 9, high: 13, low: 8),
                Forecast(date: "Wed", weather: .cloudy, probability: 0, temperature: 10, high: 11, low: 5),
                Forecast(date: "Thu", weather: .rainy, probability: 90, temperature: 8, high: 10, low: 7),
                Forecast(date: "Fri", weather: .cloudy, probability: 0, temperature: 8, high: 12, low: 6),
                Forecast(date: "Sat", weather: .rainy, probability: 40, temperature: 7, high: 11, low: 6),
                Forecast(date: "Sun", weather: .rainy, probability: 80, temperature: 7, high: 15, low: 8)
            ]
        default: // new york
            return [
                Forecast(date: "Mon", weather: .cloudy, probability: 0, temperature: 7, high: 10, low: 4),
                Forecast(date: "Tue", weather: .cloudy, probability: 0, temperature: 4, high: 5, low: -2),
                Forecast(date: "Wed", weather: .sunny, probability: 0, temperature: 8, high: 10, low: 2),
                Forecast(date: "Thu", weather: .cloudy, probability: 0, temperature: 8, high: 11, low: 1),
                Forecast(date: "Fri", weather: .cloudy, probability: 0, temperature: 8, high: 13, low: 6),
                Forecast(date: "Sat", weather: .cloudy, probability: 0, temperature: 7, high: 8, low: 1)
            ]
        }
    }
    static func detail(place: String) -> some View {
        return Image(place)
    }
}
