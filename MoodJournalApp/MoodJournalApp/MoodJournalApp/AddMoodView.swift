//
//  AddMoodView.swift
//  MoodJournalApp
//
//  Created by BMIIT on 25/03/25.
//
import SwiftUI

struct AddMoodView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: MoodViewModel
    @State private var selectedMood = "😊"
    @State private var note = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("How are you feeling?")
                    .font(.title2)
                
                HStack {
                    ForEach(viewModel.moods, id: \.self) { mood in
                        Text(mood)
                            .font(.largeTitle)
                            .padding()
                            .background(selectedMood == mood ? Color.blue : Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedMood = mood
                            }
                    }
                }
                
                TextField("Add a note...", text: $note)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Save Mood") {
                    viewModel.addMoodEntry(mood: selectedMood, note: note)
                    presentationMode.wrappedValue.dismiss()
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .padding()
        }
    }
}

