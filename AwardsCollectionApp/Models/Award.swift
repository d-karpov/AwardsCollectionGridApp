//
//  Award.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 09.02.2022.
//

import SwiftUI

struct Award {
    let awardView: AnyView
    let title: String
    let awarded: Bool
    
    static func getAwards() -> [Award] {
        [
            Award(
                awardView: AnyView(GradientRectangles().frame(width: 160, height: 160)),
                title: "Gradient Rectangles",
                awarded: true
            ),
            Award(
                awardView: AnyView(PathView().frame(width: 160, height: 160)),
                title: "Path View",
                awarded: true
            ),
            Award(
                awardView: AnyView(CurvesView().frame(width: 160, height: 160)),
                title: "Curves View",
                awarded: true
            ),
            Award(
                awardView: AnyView(HypocycloidView(width: 160, height: 160)),
                title: "Hypocycloid View",
                awarded: false
            ),
            Award(
                awardView: AnyView(CatView().frame(width: 160, height: 160)),
                title: "Cat View",
                awarded: true
            ),
        ]
    }
}
