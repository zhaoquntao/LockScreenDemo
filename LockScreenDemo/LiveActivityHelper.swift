//
//  LiveActivityHelper.swift
//  LockScreenDemo
//
//  Created by zhaoqt on 2022/9/15.
//

import ActivityKit
import Foundation

@available(iOS 16.1, *)
class LiveActivityHelper {
    var statusActivity: Activity<PizzaDeliveryAttributes>?

    func start() {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("Activities are not enabled!")
            return
        }
        // Initializing the models.
        let statusAttribute = PizzaDeliveryAttributes(buildId: "1234567890", numberOfPizzas: 10, totalAmount: "100", orderNumber: "1234567890")
        let timeRange: ClosedRange<Date> = Date()...Date()
        let initialStatus = PizzaDeliveryAttributes.PizzaDeliveryStatus(driverName: "driverName",
                                                                        deliveryTimer: timeRange)
        do {
            statusActivity = try Activity<PizzaDeliveryAttributes>.request(
                attributes: statusAttribute,
                contentState: initialStatus,
                pushType: nil)
            print("Build with ID: \(statusActivity?.id) is now pending.")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }

    // Now I will update the current activity.
    func update() {
        Task {
            let timeRange: ClosedRange<Date> = Date()...Date()
            let updatedCICDStatus = PizzaDeliveryAttributes.PizzaDeliveryStatus(driverName: "driverName",
                                                                                deliveryTimer: timeRange)
            guard let statusActivity else { return }
            await statusActivity.update(using: updatedCICDStatus)
        }
    }

    func end() {
        Task {
            let timeRange: ClosedRange<Date> = Date()...Date()
            let updatedCICDStatus = PizzaDeliveryAttributes.PizzaDeliveryStatus(driverName: "driverName",
                                                                                deliveryTimer: timeRange)
            guard let statusActivity else { return }
            await statusActivity.end(using: updatedCICDStatus, dismissalPolicy: .default)
        }
    }
}
