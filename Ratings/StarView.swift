//
//  StarView.swift
//  Ratings
//
//  Created by Anurag Ajwani on 25/10/2020.
//

import SwiftUI

struct StarView: View {
    
    let fillAmount: CGFloat
    
    var body: some View {
            ZStack {
                Rectangle()
                    .fill(Color.gray)
                GeometryReader { geometry in
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: geometry.size.width * fillAmount, height: geometry.size.height, alignment: .leading)
                }
            }
            .mask(Star())
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView(fillAmount: 0.2)
            .frame(width: 50, height: 50, alignment: .center)
    }
}
