//
//  Dynamic_Widget.swift
//  Dynamic Widget
//
//  Created by Appnap WS01 on 22/10/20.
//

import WidgetKit
import SwiftUI

struct DynamicProvider: IntentTimelineProvider {
    typealias Entry = SimpleEntry
    
    typealias Intent = MainintentIntent
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), name: "Nam nai")
    }
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (SimpleEntry) -> Void) {

        completion(SimpleEntry(date: Date(), name: "Nam nai"))
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        let entry = SimpleEntry(date: Date(), name: configuration.image?.name ?? "Nothing selected")
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
  
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let name: String
}

struct Dynamic_WidgetEntryView : View {
    var entry: SimpleEntry

    var body: some View {
        ZStack {
            Image(systemName: entry.name)
            
        }
    }
}

@main
struct Dynamic_Widget: Widget {
    let kind: String = "Dynamic_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: MainintentIntent.self ,provider: DynamicProvider()) { entry in
            Dynamic_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Dynamic_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Dynamic_WidgetEntryView(entry: SimpleEntry(date: Date(), name: "Nai"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
