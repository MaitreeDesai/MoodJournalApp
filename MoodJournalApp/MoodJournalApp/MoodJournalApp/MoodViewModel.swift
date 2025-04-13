//
//  MoodViewModel.swift
//  MoodJournalApp
//
//  Created by BMIIT on 25/03/25.
//
import Foundation

class MoodViewModel: ObservableObject {
    @Published var moodEntries: [MoodEntry] = [] {
        didSet {
            saveData()
        }
    }

    let moods = ["😊", "😢", "😡", "😌", "😴"]

    init() {
        loadData()
    }
    
    func addMoodEntry(mood: String, note: String) {
        let newEntry = MoodEntry(date: Date(), mood: mood, note: note)
        moodEntries.append(newEntry)
    }
    
    private func saveData() {
        if let encodedData = try? JSONEncoder().encode(moodEntries) {
            UserDefaults.standard.set(encodedData, forKey: "MoodEntries")
        }
    }
    
    private func loadData() {
        if let savedData = UserDefaults.standard.data(forKey: "MoodEntries"),
           let decodedData = try? JSONDecoder().decode([MoodEntry].self, from: savedData) {
            moodEntries = decodedData
        }
    }
}
