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
    var body: some View {
        NavigationView {
            ZStack {
                //MARK: background color
                Color.background.ignoresSafeArea()
                Image("Background").resizable().ignoresSafeArea()
                Image("House").frame(maxHeight: .infinity, alignment: .top).padding(.top,257)
                VStack(spacing: -10) {
                    Text("Montreal").font(.largeTitle)
                    VStack {
                        Text(textStrings)
                        Text("H:23°  L:15°").font(.title3.weight(.semibold))
                    }
                    Spacer()
                }.padding(.top,51)
                //MARK: add the bottom sheet imported
                BottomSheetView(position:$bottomSheetPosition ,
                    header: {
                        // Text(bottomSheetPosition.rawValue.formatted())
                    },
                    content: {
                        forecastView()
                    })
                //MARK: add the tab bar
                tabBar(action: {bottomSheetPosition = .top})
            }.navigationBarHidden(true)
        }
    }
    private var textStrings : AttributedString {
    /*  Text("16°").font(.system(size: 96, weight: .thin)).foregroundColor(.primary) +
        Text("\n ") +
        Text("Mostly Clear").font(.title3.weight(.semibold)).foregroundColor(.secondary)
    */
        var string = AttributedString("16°" + "\n" + "Mostly Clear")
        if let temperature = string.range(of: "16°") {
            string[temperature].font = .system(size: 96, weight: .thin)
            string[temperature].foregroundColor = .primary
        }
        if let pipe = string.range(of: "|") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
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
