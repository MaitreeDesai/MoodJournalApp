//
//  ContentView.swift
//  MoodJournalApp
//
//  Created by BMIIT on 25/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MoodViewModel()
    @State private var showAddMoodView = false
    @State private var showChartView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.moodEntries) { entry in
                    VStack(alignment: .leading) {
                        Text("\(entry.mood) - \(entry.date.formatted(date: .abbreviated, time: .omitted))")
                            .font(.headline)
                        Text(entry.note)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Mood Journal")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddMoodView.toggle() }) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showChartView.toggle() }) {
                        Image(systemName: "chart.bar.xaxis")
                    }
                }
            }
            .sheet(isPresented: $showAddMoodView) {
                AddMoodView(viewModel: viewModel)
            }
            .sheet(isPresented: $showChartView) {
                MoodChartView(viewModel: viewModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
