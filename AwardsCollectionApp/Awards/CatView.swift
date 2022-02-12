//
//  CatView.swift
//  AwardsCollectionApp
//
//  Created by Денис Карпов on 07.02.2022.
//

import SwiftUI

struct CatView: View {
    @State private var animationСoefficient: Double = 0.07
    @State private var degress : Angle = .zero
    
    private var animation: Animation {
        Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)
    }
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let middle = size / 2
            
            CatShape(
                middle: middle,
                size: size,
                animationCoefficient: animationСoefficient
            )
                .fill(
                    LinearGradient(
                        colors: [.gray, .black],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .rotation3DEffect(degress, axis: (x: 1.0, y: 1.0, z: 0.0))
                .shadow(color: .black, radius: 1, x: 1, y: 5)
                .onAppear {
                    withAnimation(animation) {
                        degress = .degrees(2)
                        animationСoefficient = 0.18
                    }
                }
            
            CatEyeView(
                startX: middle * 0.8,
                startY: size * 0.2,
                radius: middle * 0.1,
                color: .yellow
            )
            
            CatEyeView(
                startX: middle * 1.2,
                startY: size * 0.2,
                radius: middle * 0.1,
                color: .yellow
            )
            
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.green, .cyan],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .opacity(0.25)
                .frame(width: size, height: size)
        }
    }
}

struct CatShape: Shape {
    
    let middle: Double
    let size: Double
    
    var animationCoefficient: Double
    
    var animatableData: Double {
        get { animationCoefficient }
        set { animationCoefficient = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: middle, y: size * 0.085))
        //Up part
        path.addQuadCurve(
            to: CGPoint(x: middle * 0.7, y: size * 0.1),
            control: CGPoint(x: middle * 0.8, y: size * 0.09)
        )
        //Ear
        path.addQuadCurve(
            to: CGPoint(x: middle * 0.5, y: size * 0.15),
            control: CGPoint(x: middle * 0.5, y: 0)
        )
        //Cheek
        path.addCurve(
            to: CGPoint(x: middle * 0.8, y: size * 0.5),
            control1: CGPoint(x: middle * 0.3, y: size * 0.3),
            control2: CGPoint(x: middle * 0.5, y: size * 0.5)
        )
        //Shoulder
        path.addQuadCurve(
            to: CGPoint(x: middle * 0.6, y: size * 0.65),
            control: CGPoint(x: middle * 0.6, y: size * 0.5)
        )
        //Tail
        path.addCurve(
            to: CGPoint(x: middle * 0.15, y: size * 0.6),
            control1: CGPoint(x: middle * 0.4, y: size * 0.5),
            control2: CGPoint(x: middle * 0.2, y: size * 0.75)
        )
        path.addQuadCurve(
            to: CGPoint(x: middle * 0.08, y: size * 0.6),
            control: CGPoint(x: middle * animationCoefficient, y: size * 0.4)
        )
        path.addCurve(
            to: CGPoint(x: middle * 0.6, y: size * 0.75),
            control1: CGPoint(x: middle * 0.1, y: size * 0.9),
            control2: CGPoint(x: middle * 0.5, y: size * 0.45)
        )
        //Body
        path.addLine(to: CGPoint(x: middle * 0.6, y: size * 0.9))
        
        //Circle
        path.addQuadCurve(
            to: CGPoint(x: middle * 0.5, y: size * 0.933),
            control: CGPoint(x: middle * 0.6, y: size  * 0.96)
        )
        path.addArc(
            center: CGPoint(x: middle, y: middle),
            radius: middle,
            startAngle: .degrees(120),
            endAngle: .degrees(420),
            clockwise: false)
        path.addQuadCurve(
            to: CGPoint(x: middle * 1.415, y: size * 0.9),
            control: CGPoint(x: middle * 1.42, y: size * 0.957)
        )
        
        //Right Body
        path.addLine(to: CGPoint(x: middle * 1.4, y: size * 0.65))
        //Right Shoulder
        path.addQuadCurve(
            to: CGPoint(x: middle * 1.2, y: size * 0.5),
            control: CGPoint(x: middle * 1.4, y: size * 0.5)
        )
        //Right Cheek
        path.addCurve(
            to: CGPoint(x: middle * 1.5, y: size * 0.15),
            control1: CGPoint(x: middle * 1.5, y: size * 0.5),
            control2: CGPoint(x: middle * 1.7, y: size * 0.3)
        )
        //Right Ear
        path.addQuadCurve(
            to: CGPoint(x: middle * 1.3, y: size * 0.1),
            control: CGPoint(x: middle * 1.5, y: 0)
        )
        //Right Up Part
        path.addQuadCurve(
            to: CGPoint(x: middle, y: size * 0.085),
            control: CGPoint(x: middle * 1.2, y: size * 0.09)
        )
        path.closeSubpath()
        
        return path
    }
}


struct MyAward_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
            .frame(width: 200, height: 200)
    }
}
