//
//  weatherView.swift
//  Weather
//
//  Created by Tianyi
//

import SwiftUI

struct weatherView: View {
    @State private var searchText = ""
    var searchResults : [Forecast] {
        if searchText.isEmpty {
            return Forecast.cities
        } else {
            return Forecast.cities.filter {$0.location.contains(searchText)}
        }
    }
    var body: some View {
        ZStack{
            //MARK: background
            Color.background.ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(searchResults) { forecast in
                        weatherWidget(forecast: forecast)
                    }
                }
            }.safeAreaInset(edge: .top) {
                EmptyView().frame(height: 110)
            }
        }.overlay {
            // MARK: navigation bar
            navigationBar(searchText: $searchText)
        }.navigationBarHidden(true)
        //.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a city")
    }
}

struct weatherView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            weatherView().preferredColorScheme(.dark)
        }
    }
}
