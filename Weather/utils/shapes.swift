//
//  shapes.swift
//  Weather
//
//  Created by Tianyi
//

import SwiftUI

struct Arc: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // from top left corner relatively to the rectangle(where we put the path into)
        path.move(to: CGPoint(x: rect.minX-1, y: rect.minY))
        // specify endpoint and control point
        path.addQuadCurve(to: CGPoint(x: rect.maxX+1, y: rect.minY), control: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX+1, y: rect.maxY+1))
        path.addLine(to: CGPoint(x: rect.minX-1, y: rect.maxY+1))
        path.closeSubpath()
        return path
    }
}
