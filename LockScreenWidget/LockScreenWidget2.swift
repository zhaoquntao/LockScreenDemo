//
//  LockScreenWidget2.swift
//  LockScreenWidgetExtension
//
//  Created by zhaoqt on 2022/9/9.
//

import SwiftUI
import WidgetKit

struct Provider2: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
//
//struct SimpleEntry: TimelineEntry {
//    let date: Date
//}

@available(iOSApplicationExtension 16.0, *)
struct LockScreenWidgetEntryView2 : View {
    var entry: Provider2.Entry

    var body: some View {
        LockScreenWidgetView()
    }
}

@available(iOSApplicationExtension 16.0, *)
struct LockScreenWidget2: Widget {
    let kind: String = "LockScreenWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider2()) { entry in
            LockScreenWidgetEntryView2(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.accessoryCircular, .accessoryRectangular, .accessoryInline, .systemMedium, .systemSmall, .systemLarge])
    }
}

@available(iOSApplicationExtension 16.0, *)
struct LockScreenWidget2_Previews: PreviewProvider {
    static var previews: some View {
        LockScreenWidgetEntryView2(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .accessoryCircular))
    }
}
