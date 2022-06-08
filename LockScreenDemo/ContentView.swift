//
//  ContentView.swift
//  LockScreenDemo
//
//  Created by zhaoqt on 2022/6/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{ geo  in
            VStack(alignment: .center){
                HealthLevelCircular()
                    .frame(width: 80,height: 80)
                Spacer()
                HealthLevelRectangular().frame(width: 180,height: 80)
            }
            .padding(10)
            .frame(width: geo.size.width, height: 200)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
