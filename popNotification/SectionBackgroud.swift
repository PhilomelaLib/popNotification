//
//  SectionBackgroud.swift
//  popNotification
//
//  Created by 陈宝 on 2020/2/8.
//  Copyright © 2020 chenbao. All rights reserved.
//

import SwiftUI
import UIKit

struct SectionBackgroud: View {
    var body: some View {
        return

            TextField("Tag Name", text: .constant("asdfafdasf"))
//            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(
                Capsule()
                    .stroke(Color.blue, lineWidth: 1)
                    .foregroundColor(.clear)
            )
        

        NavigationView {
            NavigationLink(destination: Text("asdfadsf")) {
                Text("dsafsaf")
            }
            .navigationBarTitle(Text("tilte"))
            .navigationBarHidden(true)
        }
        List {
            ForEach(0 ... 5, id: \.self) { j in

                Section(header: Text("\(j)")) {
                    ForEach(0 ... 5, id: \.self) { i in
                        VStack {
                            Text("\(i)  Text Text Text Text Text")
                            HStack {
                                Text("2020-12-13 12:23:04")
                                    .font(Font.callout.weight(Font.Weight.light))
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }.listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            }
        }.listStyle(GroupedListStyle())
    }

    func 年月日时分秒(date: Date) -> String {
        let d = DateFormatter()

        d.dateFormat = "yyyy-M-d HH:mm:ss"

        return d.string(from: date)

        let sdadsadsf = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}

struct SectionBackgroud_Previews: PreviewProvider {
    static var previews: some View {
        SectionBackgroud()
    }
}

let adf = Color(hue: 31 / 360, saturation: 1, brightness: 2, opacity: 2)
