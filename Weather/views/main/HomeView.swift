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
                    Image("Background").resizable().ignoresSafeArea().offset(y: -proratedTranslation * imageOffset)
                    Image("House").frame(maxHeight: .infinity, alignment: .top).padding(.top,257).offset(y: -proratedTranslation * imageOffset)
                    VStack(spacing: -10 * (1-proratedTranslation)) {
                        Text("Montreal").font(.largeTitle)
                        VStack {
                            Text(textStrings)
                            Text("H:23°  L:15°").font(.title3.weight(.semibold)).opacity(1-proratedTranslation)
                        }
                        Spacer()
                    }.padding(.top,51).offset(y: -proratedTranslation * 46)
                    //MARK: add the bottom sheet imported
                    BottomSheetView(position:$bottomSheetPosition ,
                        header: {
                            // Text(proratedTranslation.formatted())
                        },
                        content: {
                            forecastView(proratedTranslation: proratedTranslation)
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
                    tabBar(action: {bottomSheetPosition = .top}).offset(y: proratedTranslation * 115)
                }.navigationBarHidden(true)
            }
        }
    }
    private var textStrings : AttributedString {
    /*  Text("16°").font(.system(size: 96, weight: .thin)).foregroundColor(.primary) +
        Text("\n ") +
        Text("Mostly Clear").font(.title3.weight(.semibold)).foregroundColor(.secondary)
    */
        var string = AttributedString("16°" + (hasDragged ? " | " : "\n ") + "Mostly Clear")
        if let temperature = string.range(of: "16°") {
            string[temperature].font = .system(size: (96 - (proratedTranslation*(96 - 20))), weight: (hasDragged ? .semibold : .thin))
            string[temperature].foregroundColor = .primary
        }
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary.opacity(proratedTranslation)
        }
        if let weather = string.range(of: "Mostly Clear") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        return string
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().preferredColorScheme(.dark)
    }
}
