//
//  ContentView.swift
//  LockScreenDemo
//
//  Created by zhaoqt on 2022/6/8.
//

import ActivityKit
import SwiftUI

@available(iOS 16.1, *)
struct ContentView: View {
    let helper: LiveActivityHelper = .init()
    var body: some View {
        GeometryReader { geo in
//            VStack(alignment: .center){
//                HealthLevelCircular()
//                    .frame(width: 80,height: 80)
//                Spacer()
//                HealthLevelRectangular().frame(width: 180,height: 80)
//
//            }
//            .padding(10)
//            .frame(width: geo.size.width, height: 200)
            VStack(spacing: 16) {
                Button {
                    DispatchQueue
                        .main
                        .asyncAfter(deadline: .now() + 2) {
                            helper.start()
                        }

                } label: {
                    Text("Start1111")
                        .font(.system(size: 18, weight: .medium))
                }

                Button {
                    DispatchQueue
                        .main
                        .asyncAfter(deadline: .now() + 2) {
                            helper.update()
                        }

                } label: {
                    Text("Update with in progress")
                        .font(.system(size: 18, weight: .medium))
                }

                Button {
                    DispatchQueue
                        .main
                        .asyncAfter(deadline: .now() + 2) {
                            helper.end()
                        }
                } label: {
                    Text("End")
                        .font(.system(size: 18, weight: .medium))
                }

            }.frame(width: geo.size.width, height: 200)
        }
    }
}

@available(iOS 16.1, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
