//
//  LockScreenDemoApp.swift
//  LockScreenDemo
//
//  Created by zhaoqt on 2022/6/8.
//

import SwiftUI

@available(iOS 16.1, *)
@main
struct LockScreenDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().onOpenURL(perform: { (url) in
                print(url)
            })
        }
    }
}
