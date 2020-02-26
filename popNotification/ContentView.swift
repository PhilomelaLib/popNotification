//
//  ContentView.swift
//  popNotification
//
//  Created by 陈宝 on 2020/1/5.
//  Copyright © 2020 chenbao. All rights reserved.
//

import Combine
import SwiftUI

struct ContentView: View {
    @State private var text = ""
    var body: some View {
        NavigationView {
            VStack {
                slash()

                TextField("title", text: $text, onCommit: { self.send() })
                    .border(Color.gray)

                Button(action: {
                    self.send()
                }) {
                    Text("save")
                }
            }

            .modifier(BottomPopNotification()) // MARK: - code here
        }
    }

    func send() {
        BottomPopNotification.pub.send(self.text)

        self.text = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .light)
    }
}

/// 最好放到 最外面的 View, 比如 ContentView
struct BottomPopNotification: ViewModifier {
    /// 用这个 把通知放进来
    static let pub = PassthroughSubject<String, Never>()

    @State private var text: String? = nil

    func body(content: Content) -> some View {
        ZStack {
            content

            if self.text != nil {
                VStack {
                    Spacer()

                    Text(self.text ?? "")
                        .font(.callout)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(
                            Color(red: 0, green: 156 / 255, blue: 250 / 255)
                                .cornerRadius(UIScreen.main.bounds.size.height / 80)
                                .shadow(radius: 5))
                        .padding(.horizontal)
                        .transition(AnyTransition.opacity.animation(Animation.easeInOut))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onReceive(BottomPopNotification.pub) { (v: String) in

            withAnimation(Animation.easeInOut) {
                self.text = v
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(Animation.easeInOut) {
                    self.text = nil
                }
            }
        }
    }
}

public struct BlurView: UIViewRepresentable {
    public var style: UIBlurEffect.Style
    public var cornerRadius: CGFloat?

    public init(_ style: UIBlurEffect.Style, cornerRadius: CGFloat? = nil) {
        self.style = style
        self.cornerRadius = cornerRadius
    }

    public func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: self.style))
    }

    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        if let cornerRadius = self.cornerRadius {
            uiView.clipsToBounds = true
            uiView.layer.cornerRadius = cornerRadius
        }
    }
}

//        return Animated()
//
//            ZStack {
//                Image("p1")
//                ScrollView {
//                    Group {
//                        ZStack {
//                            BlurView(.dark)
//                            Text("dark")
//                        }
//
//                        ZStack {
//                            BlurView(.extraLight)
//                            Text("extraLight")
//                        }
//
//                        ZStack {
//                            BlurView(.light)
//                            Text("light")
//                        }
//
//                        ZStack {
//                            BlurView(.prominent)
//                            Text("prominent")
//                        }
//
//                        ZStack {
//                            BlurView(.regular)
//                            Text("regular")
//                        }
//
//                        ZStack {
//                            BlurView(.systemChromeMaterial)
//                            Text("systemChromeMaterial")
//                        }
//
//                        ZStack {
//                            BlurView(.systemChromeMaterialDark)
//                            Text("systemChromeMaterialDark")
//                        }
//
//                        ZStack {
//                            BlurView(.systemChromeMaterialLight)
//                            Text("systemChromeMaterialLight")
//                        }
//
//                        ZStack {
//                            BlurView(.systemMaterial)
//                            Text("systemMaterial")
//                        }
//
//                        ZStack {
//                            BlurView(.systemMaterialDark)
//                            Text("systemMaterialDark")
//                        }
//                    }
//                    .frame(width: 400, height: 400)
//
//                    Group {
//                        ZStack {
//                            BlurView(.systemMaterialLight)
//                            Text("systemMaterialLight")
//                        }
//
//                        ZStack {
//                            BlurView(.systemThickMaterial)
//                            Text("systemThickMaterial")
//                        }
//
//                        ZStack {
//                            BlurView(.systemThickMaterialDark)
//                            Text("systemThickMaterialDark")
//                        }
//
//                        ZStack {
//                            BlurView(.systemThickMaterialLight)
//                            Text("systemThickMaterialLight")
//                        }
//
//                        ZStack {
//                            BlurView(.systemUltraThinMaterial)
//                            Text("systemUltraThinMaterial")
//                        }
//                        ZStack {
//                            BlurView(.systemUltraThinMaterialDark)
//                            Text("systemUltraThinMaterialDark")
//                        }
//                        ZStack {
//                            BlurView(.systemUltraThinMaterialLight)
//                            Text("prominent")
//                        }
//
//                        ZStack {
//                            BlurView(.prominent)
//                            Text("prominent")
//                        }
//                    }
//                    .frame(width: 400, height: 400)
//                }.frame(maxWidth: .infinity)
//            }
