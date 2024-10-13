//
//  ContentView.swift
//  WorkLess
//  Hacking with Swift
//

import SwiftUI

struct AddActivityView: View {
    @EnvironmentObject var dataController: DataController
    @Environment(\.dismiss) var dismiss

    @State private var unusedActivities = [Activity]()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    if unusedActivities.isEmpty {
                        ContentUnavailableView("Nothing left to add.", systemImage: "checkmark.rectangle.stack", description: Text("Great job - you are barely working at all!"))
                    } else {
                        
                        ForEach(unusedActivities) { activity in
                            Button {
                                dataController.add(activity)
                                dismiss()
                            } label: {
                                VStack(alignment: .leading) {
                                    Image(activity.id)
                                        .resizable()
                                        .scaledToFit()
                                    
                                    Text(activity.id)
                                        .font(.largeTitle)
                                    
                                    Text(activity.summary)
                                        .multilineTextAlignment(.leading)
                                    
                                    HStack {
                                        Text("**Difficulty:** \(activity.difficulty)")
                                        
                                        Spacer()
                                        
                                        Text("**Time:** \(activity.time)")
                                    }
                                    .padding(.top, 10)
                                }
                                .foregroundStyle(.white)
                                .padding(20)
                                .frame(maxWidth: .infinity)
                                .background(.blue.gradient)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                            }
                        }
                    }
                }
                // .padding(.horizontal, 16)
                .contentMargins(.horizontal, 16, for: .scrollContent)
                .scrollTargetLayout()
            }
            .navigationTitle("Add Activity")
            .onAppear {
                unusedActivities = dataController.unusedActivities
            }
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

#Preview {
    AddActivityView()
        .environmentObject(DataController())
}
