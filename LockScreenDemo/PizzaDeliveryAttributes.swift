//
//  PizzaDeliveryAttributes.swift
//  LockScreenDemo
//
//  Created by zhaoqt on 2022/9/15.
//

import SwiftUI
import WidgetKit
import ActivityKit

struct PizzaDeliveryAttributes: ActivityAttributes {
    public typealias PizzaDeliveryStatus = ContentState

    public struct ContentState: Codable, Hashable {
        var driverName: String
        var deliveryTimer: ClosedRange<Date>
    }

    var buildId: String
    var numberOfPizzas: Int
    var totalAmount: String
    var orderNumber: String
}


//struct StatusAttribute: ActivityAttributes {
//  public typealias ProcessStatus = ContentState
//
//  public struct ContentState: Codable, Hashable {
//    var estimatedCompletionTime: Date
//    var deliveryTimer: ClosedRange<Date>
//  }
//
//  var buildId: String
//}
