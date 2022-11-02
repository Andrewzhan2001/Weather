//
//  blur.swift
//  Weather
//
//  Created by Tianyi
//

import SwiftUI

class BackgroundView: UIView {
    override class var layerClass: AnyClass {
        NSClassFromString("CABackdropLayer") ?? CALayer.self
    }
}
struct Background: UIViewRepresentable {
    func makeUIView(context: Context) -> BackgroundView {
        BackgroundView()
    }
    // here we don't need to update this view
    func updateUIView(_ uiView: BackgroundView, context: Context) {}
}

struct blurLayer: View {
    var radius: CGFloat = 3
    var opaque: Bool = false
    var body: some View {
        Background().blur(radius: radius, opaque: opaque)
    }
}

struct blurLayer_Previews: PreviewProvider {
    static var previews: some View {
        blurLayer()
    }
}
