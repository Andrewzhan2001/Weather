//
//  HomeView.swift
//  Weather
//
//  Created by Tianyi
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83 // relative position
    case middle = 0.385
}

struct HomeView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State var hasDragged: Bool = false
    @State var forecastCity : ForecastCity = ForecastCity(name: "Shanghai")
    var proratedTranslation: CGFloat {
        // pure math to get the percentage value you at between top and middle
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) /
        (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                // MARK: to make sure the image will move outside the screen
                let imageOffset = screenHeight + 36
                ZStack {
                    //MARK: background color
                    Color.background.ignoresSafeArea()
                    forecastCity.bg.resizable().ignoresSafeArea()
                    forecastCity.cityIcon.resizable().frame(width:400, height: 300, alignment: .center).frame(maxHeight: .infinity, alignment: .top).padding(.top,220).offset(y: -proratedTranslation * imageOffset)
                    VStack(spacing: -10 * (1-proratedTranslation)) {
                        Text(forecastCity.name).font(.largeTitle)
                        VStack {
                            Text(textStrings)
                            Text("H:\(forecastCity.now.high)°  L:\(forecastCity.now.low)°").font(.title3.weight(.semibold)).opacity(1-proratedTranslation)
                        }
                        Spacer()
                    }.padding(.top,51).offset(y: -proratedTranslation * 46)
                    //MARK: add the bottom sheet imported
                    BottomSheetView(position:$bottomSheetPosition ,
                        header: {
                            // Text(proratedTranslation.formatted())
                        },
                        content: {
                        forecastView(proratedTranslation: proratedTranslation, forecastCity: $forecastCity)
                    })//.onBottomSheetDrag(perform: (transation) -> Void)
                        .onBottomSheetDrag { transation in
                        bottomSheetTranslation = transation / screenHeight
                            withAnimation(.easeInOut) {
                                if bottomSheetPosition == BottomSheetPosition.top {
                                    hasDragged = true
                                } else {
                                    hasDragged = false
                                }
                            }
                        }
                    //MARK: add the tab bar
                    tabBar(action: {bottomSheetPosition = .top}, forecastCity: $forecastCity)
                }.navigationBarHidden(true)
            }
        }
    }
    private var textStrings : AttributedString {
    /*  Text("16°").font(.system(size: 96, weight: .thin)).foregroundColor(.primary) +
        Text("\n ") +
        Text("Mostly Clear").font(.title3.weight(.semibold)).foregroundColor(.secondary)
    */
        var string = AttributedString("\(forecastCity.now.temperature)°" + (hasDragged ? " | " : "\n     ") + forecastCity.now.weather.rawValue)
        if let temperature = string.range(of: "\(forecastCity.now.temperature)°") {
            string[temperature].font = .system(size: (96 - (proratedTranslation*(96 - 20))), weight: (hasDragged ? .semibold : .thin))
            string[temperature].foregroundColor = .primary
        }
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary.opacity(proratedTranslation)
        }
        if let weather = string.range(of: forecastCity.now.weather.rawValue) {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .primary
        }
        return string
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().preferredColorScheme(.dark)
    }
}
