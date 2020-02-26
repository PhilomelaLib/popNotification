//
//  slash.swift
//  popNotification
//
//  Created by 陈宝 on 2020/1/5.
//  Copyright © 2020 chenbao. All rights reserved.
//

import Combine
import SwiftUI
import UIKit

let viewSender = PassthroughSubject<AnyView, Never>()
let cancle = viewSender.print()
    .sink { (a: AnyView) in
        show(anyView: a)
    }

struct slash: View {
    init() {
        _ = cancle
    }

    var body: some View {
        VStack {
            Text("888 888")
//            .modifier(Slash()) // MARK: - 这样用就可以了, 不麻烦
                .onTapGesture {
                    show(anyView: AnyView(self.sdafasdfsadds))
                }

            Button(action: remove) {
                Text("remove")
            }

            Button(action: {
                viewSender.send(AnyView(self.sdafasdfsadds))
            }) {
                Text("viewSender send")
            }
        }
    }

    var sdafasdfsadds: some View {
//        NavigationView {
        ZStack {
            VStack {
                Text("sadfadsf")
                Text("sadfadsf")
                Text("sadfadsf")

                Button(action: remove) {
                    Text("remove").font(.largeTitle)
                }
            }
        }
//        }

        .edgesIgnoringSafeArea(.all)
    }
}

func show(anyView: AnyView) {
    if let _ = UIApplication.shared.windows.last {
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height

        let mview = UIHostingController(rootView: anyView).view!
        mview.tag = 1000

        mview.frame = .init(x: 0, y: 0, width: w, height: h)
        UIApplication.shared.windows.last!.addSubview(mview)

        print(UIApplication.shared.windows.last!.rootViewController)

        print(type(of: UIApplication.shared.windows.last!.rootViewController))

        let a = UIApplication.shared.windows.last!.rootViewController as? UIViewController

        print(a)
    }
}

func remove() {
    if let _ = UIApplication.shared.windows.last {
        UIApplication.shared.windows.last!.subviews.forEach { (u: UIView) in
            if u.tag == 1000 {
                u.removeFromSuperview()
            }
        }
    }
}

struct slash_Previews: PreviewProvider {
    static var previews: some View {
        slash()
    }
}

struct Slash: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { g in

                    self.f(g)

                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            )
    }

    func f(_ g: GeometryProxy) -> some View {
        let b = CGPoint(x: 0,
                        y: g.size.height)

        let a = CGPoint(x: g.size.width,
                        y: 0)

        let c = Path { p in
            p.addLines([a, b])
        }
        .strokedPath(StrokeStyle(lineWidth: 6,
                                 lineCap: .round,
                                 lineJoin: .round,
                                 miterLimit: 10,
                                 dash: [],
                                 dashPhase: 0))
        .foregroundColor(.red)

        return c
    }
}
