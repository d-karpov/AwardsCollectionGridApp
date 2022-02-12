//
//  CatEyeView.swift
//  AwardsCollectionApp
//
//  Created by Денис Карпов on 08.02.2022.
//

import SwiftUI

struct CatEyeView: View {
    @State private var animationTrigger = false
    
    let startX: Double
    let startY: Double
    let radius: Double
    let color: Color
    
    var body: some View {
        Path { path in
            path.addArc(
                center: CGPoint(x: startX, y: startY),
                radius: radius,
                startAngle: .degrees(180),
                endAngle: .zero,
                clockwise: true)
        }
        .foregroundColor(animationTrigger ? color : .white)
        .blur(radius: 2)
        .animation(
            .easeInOut(duration: 2)
                .repeatForever(autoreverses: true),
            value: animationTrigger
        )
        .onAppear {
            animationTrigger.toggle()
        }
    }
}

struct CatEyeView_Previews: PreviewProvider {
    static var previews: some View {
        CatEyeView(startX: 200, startY: 200, radius: 20, color: .green)
            .frame(width: 400, height: 400)
    }
}
