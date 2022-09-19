//
//  LockScreenWidget.swift
//  LockScreenWidget
//
//  Created by zhaoqt on 2022/6/8.
//

import WidgetKit
import SwiftUI

@available(iOSApplicationExtension 16.0, *)
@main
struct LockScreenWidget: WidgetBundle {
    var body: some Widget{
        LockScreenWidget1()
        LockScreenWidget2()
        if #available(iOS 16.1, *) {
            PizzaDeliveryActivityWidget()
        }
    }
}
