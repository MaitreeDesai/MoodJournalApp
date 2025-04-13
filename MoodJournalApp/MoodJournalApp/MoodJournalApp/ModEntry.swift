//
//  ModEntry.swift
//  MoodJournalApp
//
//  Created by BMIIT on 25/03/25.
//

import Foundation

struct MoodEntry: Identifiable, Codable {
    var id = UUID()
    var date: Date
    var mood: String
    var note: String
}

