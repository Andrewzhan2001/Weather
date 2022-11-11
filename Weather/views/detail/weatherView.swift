//
//  weatherView.swift
//  Weather
//
//  Created by Tianyi
//

import SwiftUI

struct weatherView: View {
    var body: some View {
        ZStack{
            //MARK: background
            Color.background.ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(Forecast.cities) { forecast in
                        weatherWidget(forecast: forecast)
                    }
                }
            }.safeAreaInset(edge: .top) {
                EmptyView().frame(height: 110)
            }
        }.overlay {
            navigationBar()
        }.navigationBarHidden(true)
    }
}

struct weatherView_Previews: PreviewProvider {
    static var previews: some View {
        weatherView().preferredColorScheme(.dark)
    }
}
