//
//  weatherWidget.swift
//  Weather
//
//  Created by Tianyi
//

import SwiftUI

struct weatherWidget: View {
    var forecast: Forecast
    var location: String
    @Environment(\.dismiss) var dismiss
    @Binding var forecastCity: ForecastCity
    var body: some View {
        Button {
            forecastCity = ForecastCity(name: location)
            dismiss()
        } label: {
            ZStack(alignment: .bottom) {
                Trapezoid().fill(Color.weatherWidgetBackground).frame(width: 342, height: 174)
                // MARK: content
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 8) {
                        // MARK: temperature
                        Text("\(forecast.temperature)°").font(.system(size: 64))
                        VStack(alignment: .leading, spacing: 2) {
                            // MARK: temperature range
                            Text("H:\(forecast.high)°  L:\(forecast.low)°").font(.footnote).foregroundColor(.secondary)
                            // MARK: location
                            Text(location).font(.body).lineLimit(1)
                        }
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 0) {
                        Image("\(forecast.icon)").resizable().frame(width: 160, height: 150).padding(.trailing, 4)
                        Text(forecast.weather.rawValue).font(.footnote).padding(.trailing, 24)
                    }
                }.foregroundColor(.white).padding(.bottom, 20).padding(.leading, 20)
            }.frame(width: 342, height: 184, alignment: .bottom)
        }
    }
}

struct weatherWidget_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
