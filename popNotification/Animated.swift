//
//  Animated.swift
//  popNotification
//
//  Created by 陈宝 on 2020/2/6.
//  Copyright © 2020 chenbao. All rights reserved.
//

import SwiftUI

struct Animated: View {
    @State private var name: Bool = false
    @State(initialValue: false) var haha
    var sdafadf = State(initialValue: false)
//        .projectedValue.animation(Animation.spring().repeatForever())
    var body: some View {
        VStack {
//            (self.name ? Color.green : Color.red)
            Color.green

            Button("Hello, World!") {
                self.name.toggle()
            }
            .foregroundColor(self.name ? Color.green : Color.red)

        }
        .frame(height: self.name ? 100 : 400)
        .animation(Animation.spring(), value: self.name)
    }
}

struct Animated_Previews: PreviewProvider {
    static var previews: some View {
        Animated()
    }
}
