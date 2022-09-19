//
//  PizzaDeliveryActivityWidget.swift
//  LockScreenWidgetExtension
//
//  Created by zhaoqt on 2022/9/15.
//

import ActivityKit
import SwiftUI
import WidgetKit

@available(iOS 16.1, *)
@available(iOSApplicationExtension 16.1, *)
struct PizzaDeliveryActivityWidget: Widget {
    let kind: String = "WidgetExtension"
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PizzaDeliveryAttributes.self) { context in
            LockScreenLiveActivityView(attribute: context.attributes)
        } dynamicIsland: { context in
            // Create the views that appear in the Dynamic Island.
            DynamicIsland {
                // Create the expanded view.
                DynamicIslandExpandedRegion(.leading) {
                    Label("\(context.attributes.numberOfPizzas) Pizzas", systemImage: "bag")
                        .foregroundColor(.indigo)
                        .font(.title2)
                }

                DynamicIslandExpandedRegion(.trailing) {
                    Label {
                        Text(timerInterval: context.state.deliveryTimer, countsDown: true)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 50)
                            .monospacedDigit()
                    } icon: {
                        Image(systemName: "timer")
                            .foregroundColor(.indigo)
                    }
                    .font(.title2)
                }
                DynamicIslandExpandedRegion(.center) {
                    Text("\(context.state.driverName) is on their way!")
                        .lineLimit(1)
                        .font(.caption)
                }

                DynamicIslandExpandedRegion(.bottom) {
                    Button {
                        // Deep link into your app.
                    } label: {
                        Label("Call driver", systemImage: "phone")
                    }
                    .foregroundColor(.indigo)
                }
            } compactLeading: {
                // Create the compact leading view.
                Label {
                    Text("\(context.attributes.numberOfPizzas) Pizzas")
                } icon: {
                    Image(systemName: "bag")
                        .foregroundColor(.indigo)
                }
                .font(.caption2)
            } compactTrailing: {
                // Create the compact trailing view.
                Text(timerInterval: context.state.deliveryTimer, countsDown: true)
                    .multilineTextAlignment(.center)
                    .frame(width: 40)
                    .font(.caption2)
            } minimal: {
                // Create the minimal view.
                // 单独的小 view
                VStack(alignment: .center) {
                    Image(systemName: "timer")
                    Text(timerInterval: context.state.deliveryTimer, countsDown: true)
                        .multilineTextAlignment(.center)
                        .monospacedDigit()
                        .font(.caption2)
                }
            }
            .keylineTint(.yellow)
        }
    }
}


@available(iOS 16.1, *)
struct PizzaDeliveryActivityWidget_Previews: PreviewProvider {
    static var previews: some View {
        let statusAttribute = PizzaDeliveryAttributes(buildId: "1234567890", numberOfPizzas: 10, totalAmount: "100", orderNumber: "1234567890")
        LockScreenLiveActivityView(attribute: statusAttribute)
            .previewContext(
                WidgetPreviewContext(
                    family: .systemMedium
                )
        )
    }
}

@available(iOS 16.1, *)
@available(iOSApplicationExtension 16.1, *)
struct LockScreenLiveActivityView: View {
    let attribute: PizzaDeliveryAttributes
    var body: some View {
        VStack {
            Spacer()
            Text(" is on their way with your pizza!")
            Spacer()
            HStack {
                Spacer()
                Text("\(attribute.numberOfPizzas) Pizzas")
                .font(.title2)
                Spacer()
                Label {
                    Text("timerInterval: attribute.deliveryTimer, countsDown: true")
                        .multilineTextAlignment(.center)
                        .frame(width: 50)
                        .monospacedDigit()
                } icon: {
                    Image(systemName: "timer")
                        .foregroundColor(.indigo)
                }
                .font(.title2)
                Spacer()
            }
            Spacer()
        }
        .activitySystemActionForegroundColor(.indigo)
        .activityBackgroundTint(.cyan)
    }
}
