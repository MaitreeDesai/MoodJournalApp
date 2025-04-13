//
//  MoodChartView.swift
//  MoodJournalApp
//
//  Created by BMIIT on 25/03/25.
//

import SwiftUI
import Charts

struct MoodChartView: View {
    @ObservedObject var viewModel: MoodViewModel

    var body: some View {
        VStack {
            Text("Mood Trend")
                .font(.title2)
                .padding()

            Chart(viewModel.moodEntries) { entry in
                LineMark(
                    x: .value("Date", entry.date),
                    y: .value("Mood", viewModel.moods.firstIndex(of: entry.mood) ?? 0)
                )
            }
            .frame(height: 300)
        }
    }
}
