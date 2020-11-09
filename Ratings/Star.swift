//
//  Star.swift
//  Ratings
//
//  Created by Anurag Ajwani on 18/10/2020.
//

import SwiftUI

struct Star: Shape {
    
    let sides: Int = 5
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let startAngle = CGFloat(-1*(360/sides/4))
        let adjustment = startAngle + CGFloat(360/sides/2)
        let center = CGPoint(x: rect.width/2, y: rect.height/2)
        let innerPolygon = polygonPointArray(sides: self.sides,
                                             x: center.x,
                                             y: center.y,
                                             radius: rect.width/5,
                                             adjustment: startAngle)
        let outerPolygon = polygonPointArray(sides: self.sides,
                                             x: center.x,
                                             y: center.y,
                                             radius: rect.width/2,
                                             adjustment: adjustment)
        let points = zip(innerPolygon, outerPolygon)
        path.move(to: innerPolygon[0])
        points.forEach({ (innerPoint, outerPoint) in
            path.addLine(to: innerPoint)
            path.addLine(to: outerPoint)
        })
        path.closeSubpath()
        return path
    }
}

func degree2Radian(_ degree: CGFloat) -> CGFloat {
    return CGFloat.pi * degree/180
}

func polygonPointArray(sides: Int,
                       x: CGFloat,
                       y: CGFloat,
                       radius: CGFloat,
                       adjustment: CGFloat = 0) -> [CGPoint] {
    let angle = degree2Radian(360/CGFloat(sides))
    return Array(0...sides).map({ side -> CGPoint in
        let adjustedAngle: CGFloat = angle * CGFloat(side) + degree2Radian(adjustment)
        let xpo = x - radius * cos(adjustedAngle)
        let ypo = y - radius * sin(adjustedAngle)
        return CGPoint(x: xpo, y: ypo)
    })
}

struct Star_Previews: PreviewProvider {
    static var previews: some View {
        Star()
            .fill(Color(UIColor.systemGray4))
            .background(Color.green)
            .frame(width: 50, height: 50, alignment: .center)
    }
}
