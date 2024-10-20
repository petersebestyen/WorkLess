//
//  ActivityProgressView.swift
//  WorkLess
//  Hacking with Swift
//

import SwiftUI

struct ActivityProgressView: View {
    @EnvironmentObject var dataController: DataController
    var item: ActivityProgress

    var body: some View {
        HStack {
            Image(item.id)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)

            VStack(alignment: .leading) {
                Text(item.id)

                ProgressView(value: item.completion)
                    .tint(item.isComplete ? .green : .accentColor)
            }

            Button {
                withAnimation {
                    dataController.add(to: item)
                }
            } label: {
                Label(item.progressTitle, systemImage: item.progressIcon)
                    .labelStyle(.iconOnly)
            }
            .disabled(item.isComplete)
            .buttonStyle(.bordered)
            .clipShape(Circle())
            .sensoryFeedback(item.isComplete ? .success : .increase, trigger: item.level)
            .symbolEffect(.bounce, value: item.level)
        }
    }
}

#Preview {
    ActivityProgressView(item: .init(id: "SwiftUI"))
        .environmentObject(DataController())
}
