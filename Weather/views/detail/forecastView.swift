//
//  forecastView.swift
//  Weather
//
//  Created by Tianyi
//

import SwiftUI

struct forecastView: View {
    var proratedTranslation : CGFloat = 1
    @State private var selection = 0
    @Binding var forecastCity: ForecastCity
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // MARK: control button
                segmentedControl(selection: $selection)
                // MARK: Forcast card
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        if selection == 0 {
                            ForEach(forecastCity.hourly) { forecast in
                                forecastCard(forecast: forecast, forecastPeriod: .hourly, forecastCity: $forecastCity)
                            }.transition(.offset(x: -430))
                        } else {
                            ForEach(forecastCity.weekly) { forecast in
                                forecastCard(forecast: forecast, forecastPeriod: .weekly, forecastCity: $forecastCity)
                            }.transition(.offset(x: 430))
                        }
                    }.padding(.vertical, 20)
                }.padding(.horizontal, 20)
                forecastCity.details.opacity(proratedTranslation)
            }
        }.backgroundBlur(radius: 15, opaque: true)
            .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        // innerShadow act like a border
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, lineWidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1 - proratedTranslation)
        .overlay{
            Divider()
                .blendMode(.overlay).background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay {
            // MARK: top drag indicator
            RoundedRectangle(cornerRadius: 10).fill(.black.opacity(0.3)).frame(width: 48, height: 5).frame(height: 20).frame(maxHeight: .infinity, alignment: .top)
            
        }
    }
}

struct forecastView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
