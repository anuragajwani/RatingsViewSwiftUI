//
//  RatingsView.swift
//  Ratings
//
//  Created by Anurag Ajwani on 19/10/2020.
//

import SwiftUI

struct RatingsView: View {
    
    var onDidRate: ((Int) -> ())?
    
    @Binding var rating: CGFloat
    
    var body: some View {
        HStack {
            StarView(fillAmount: self.getFillAmount(forIndex: 1)).onTapGesture(count: 1, perform: {
                self.didRate(1)
            })
            StarView(fillAmount: self.getFillAmount(forIndex: 2)).onTapGesture(count: 1, perform: {
                self.didRate(2)
            })
            StarView(fillAmount: self.getFillAmount(forIndex: 3)).onTapGesture(count: 1, perform: {
                self.didRate(3)
            })
            StarView(fillAmount: self.getFillAmount(forIndex: 4)).onTapGesture(count: 1, perform: {
                self.didRate(4)
            })
            StarView(fillAmount: self.getFillAmount(forIndex: 5)).onTapGesture(count: 1, perform: {
                self.didRate(5)
            })
        }
    }
    
    private func didRate(_ rate: Int) {
        guard let onDidRate = self.onDidRate else { return }
        self.rating = CGFloat(rate)
        onDidRate(rate)
    }
    
    private func getFillAmount(forIndex index: Int) -> CGFloat {
        let calc = self.rating - CGFloat(index)
        if calc >= 0.0 {
            return 1.0
        } else if calc <= 0.0 && calc > -1.0 {
            return self.rating - CGFloat(index - 1)
        } else {
            return 0.0
        }
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    var body: some View {
        content($value)
    }

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}

struct RatingsView_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(4.2) { RatingsView(rating: $0) }
    }
}
