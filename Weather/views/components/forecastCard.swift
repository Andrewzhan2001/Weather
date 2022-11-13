//
//  forecastCard.swift
//  Weather
//
//  Created by Tianyi
//

import SwiftUI

struct forecastCard: View {
    var forecast: Forecast
    var forecastPeriod: ForecastPeriod
    @Binding var forecastCity : ForecastCity
    var isActive: Bool {
        forecast.date == forecastCity.now.date || forecast.date == forecastCity.hourly[1].date
    }
    var body: some View {
        ZStack{
            // MARK: the card
            RoundedRectangle(cornerRadius: 30).fill(Color.forecastCardBackground.opacity(isActive ? 1 : 0.2)).frame(width: 60, height: 146).shadow(color: .black.opacity(0.4), radius: 10, x: 5, y: 4).overlay{
                // MARK: border of card
                RoundedRectangle(cornerRadius: 30).strokeBorder(.white.opacity(isActive ? 0.5 : 0.2)).blendMode(.overlay).innerShadow(shape: RoundedRectangle(cornerRadius: 30), color: .white.opacity(0.25), lineWidth: 1, offsetX: 1, offsetY: 1, blur: 0, blendMode: .overlay)
            }
            // MARK: content of card
            VStack(spacing:10) {
                Text(forecast.date).font(.subheadline.weight(.semibold))
                VStack(spacing: -4) {
                    // MARK: Forecast icon
                    Image("\(forecast.icon)").resizable().frame(width: 60, height: 50)
                    // MARK: Forecast probability
                    Text(forecast.probability, format: .percent).font(.footnote.weight(.semibold)).foregroundColor(Color.probabilityText).opacity(forecast.probability > 0 ? 1 : 0).offset(y: 8)
                }
                // MARK: Temperature
                Text("\(forecast.temperature)°").font(.title3)
            }.padding(.horizontal, 8).padding(.vertical, 16).frame(width: 60, height: 146)
        }
    }
}

struct forecastCard_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
