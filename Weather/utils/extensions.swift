//
//  extensions.swift
//  Weather
//
//  Created by Tianyi
//

import SwiftUI

extension Color {
    static let background = LinearGradient(gradient: Gradient(colors: [Color("Background 1"), Color("Background 2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static let bottomSheetBackground = LinearGradient(gradient: Gradient(colors: [Color("Background 1").opacity(0.26), Color("Background 2").opacity(0.26)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static let navBarBackground = LinearGradient(gradient: Gradient(colors: [Color("Background 1").opacity(0.1), Color("Background 2").opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static let tabBarBackground = LinearGradient(gradient: Gradient(colors: [Color("Tab Bar Background 1").opacity(1), Color("Tab Bar Background 2").opacity(1)]), startPoint: .top, endPoint: .bottom)
    static let weatherWidgetBackground = LinearGradient(gradient: Gradient(colors: [Color("Weather Widget Background 1"), Color("Weather Widget Background 2")]), startPoint: .leading, endPoint: .trailing)
    static let bottomSheetBorderMiddle = LinearGradient(gradient: Gradient(stops: [.init(color: .white, location: 0), .init(color: .clear, location: 0.2)]), startPoint: .top, endPoint: .bottom)
    static let bottomSheetBorderTop = LinearGradient(gradient: Gradient(colors: [.white.opacity(0), .white.opacity(0.5), .white.opacity(0)]), startPoint: .leading, endPoint: .trailing)
    static let underline = LinearGradient(gradient: Gradient(colors: [.white.opacity(0), .white, .white.opacity(0)]), startPoint: .leading, endPoint: .trailing)
    // those are the color from the assets
    static let tabBarBorder = Color("Tab Bar Border").opacity(0.5)
    static let forecastCardBackground = Color("Forecast Card Background")
    static let probabilityText = Color("Probability Text")
}

extension View {
    func backgroundBlur(radius: CGFloat = 3, opaque: Bool = false) -> some View {
        return self.background(blurLayer(radius: radius, opaque: opaque))
    }
}

extension View {
    func innerShadow<S: Shape, SS: ShapeStyle> (shape: S, color: SS, lineWidth: CGFloat = 1, offsetX: CGFloat = 0, offsetY: CGFloat = 0, blur: CGFloat = 4, blendMode: BlendMode = .normal, opacity: Double = 1) -> some View {
        return self.overlay{
            shape.stroke(color,lineWidth: lineWidth).blendMode(blendMode).offset(x: offsetX, y: offsetY).blur(radius: blur).mask(shape).opacity(opacity)
        }
    }
}

extension ForecastCity {
    var bg :Image {
        Image(dataSets.week(place: self.name)[1].weather.rawValue)
    }
    var now : Forecast{
        dataSets.week(place: self.name)[1]
    }
    var hourly :[Forecast] {
        return dataSets.hour(place: self.name )
    }
    var weekly :[Forecast] {
        return dataSets.week(place: self.name )
    }
    var details : some View {
        return dataSets.detail(place: "\(self.name)1" )
    }
}

extension Forecast {
    static let cities : [ForecastCity] = [ForecastCity(name: "Barcelona"), ForecastCity(name:"Shanghai"), ForecastCity(name:"New York"), ForecastCity(name:"Paris"), ForecastCity(name:"Dubai")]
}
