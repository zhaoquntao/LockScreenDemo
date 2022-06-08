//
//  LockScreenWidgetView.swift
//  LockScreenDemo
//
//  Created by zhaoqt on 2022/6/8.
//

import SwiftUI
import WidgetKit

struct LockScreenWidgetView: View {
    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        switch family {
        case .accessoryInline:
            HealthLevelInline()
        case .accessoryRectangular:
            HealthLevelRectangular()
        case .accessoryCircular:
            HealthLevelCircular()
        default:
            HealthLevelCircular()
        }
    }
}

struct HealthLevelCircular: View {
    var body: some View {
        ZStack (alignment: .center){
//            Color.clear
//            SmallCicleView(title: "电量",percentageInt: 40)
//            Text("40").font(Font.system(size: 18)).fixedSize()

            SmallCicleView1(title: "微信")
        }
    }
}

struct HealthLevelRectangular: View {
    var body: some View {
        GeometryReader{ geo  in
//            Text("iOS16锁屏小组件")
//                .font(Font.system(size: 18))
//                .fixedSize()

            HStack{
//                SmallCicleView(title: "电量",percentageInt: 40)
//                SmallCicleView(title: "电量",percentageInt: 60)
//                SmallCicleView(title: "任务",percentageInt: 80)

                SmallCicleView1(title: "微信")
                SmallCicleView1(title: "微博")
                SmallCicleView1(title: "钉钉")
            }

            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            .frame(width: geo.size.width, height: geo.size.height)
            .border(.red, width: 1)
//            .cornerRadius(4)
        }
    }
}

struct SmallCicleView: View {
    @State var title: String = ""
    @State var percentageInt: Double = 0
    var body: some View {
        ZStack (alignment: .center){
            AccessoryWidgetBackground()
            Gauge(value: percentageInt, in: 0...100) {
                Text("\(title)").font(Font.system(size: 10)).fixedSize()
            }.gaugeStyle(.accessoryCircular)
            Text("\(Int(percentageInt))").font(Font.system(size: 16)).fixedSize()
        }.widgetURL(URL(string: "SmallCicleViewClick"))
    }
}


struct SmallCicleView1: View {
    @State var title: String = ""
    @State var percentageInt: Double = 0
    var body: some View {
        ZStack (alignment: .center){
//            Color.red.opacity(0.2)
            AccessoryWidgetBackground()
            Text("\(title)")
                .widgetAccentable()
                .font(Font.system(size: 16))
                .fixedSize()
        }.cornerRadius(.infinity)
    }
}


struct HealthLevelInline: View {
    var body: some View {
        Text("iOS16锁屏小组件")
    }
}


struct LockScreenWidgetEntryView_Previews: PreviewProvider {
    static var previews: some View {
        LockScreenWidgetView()
    }
}
