//
//  AboutView.swift
//  WorkLess
//  Hacking with Swift
//

import SwiftUI

struct AboutView: View {
    @EnvironmentObject var dataController: DataController

    let aboutTextStrings = [
        "Welcome to *Work Less*, an application designed to encourage a healthier, more balanced lifestyle by shifting focus from the unending cycle of work to the vibrant exploration of new hobbies and interests. We strongly believe that there's more to life than just work, and we're here to help you rediscover that.",
        "In our increasingly fast-paced world, there's a tendency to equate success with constant productivity and overwork. However, studies show that overworking not only negatively impacts your health and relationships, but it can also diminish your productivity and creativity. We're here to challenge this norm and redefine success in terms of happiness, balance, and personal growth.",
        "*Work Less* harnesses the principle of work-life balance, fostering a culture where working less doesn't mean accomplishing less. Instead, it signifies making more space for curiosity, creativity, and personal fulfillment. This app encourages you to step back from the habitual rigors of work and step into a world teeming with enriching hobbies and activities. From painting to gardening, cycling to dancing, there's a universe of opportunities waiting for you.",
        "*Work Less* acts as your compass, guiding you towards interests you never knew you had, or reigniting passions you might have left behind in the hustle of your career. Our Very Smart Algorithms™ will suggest hobbies based on your preferences, and connect you with a global community of enthusiasts.",
        "Remember, a well-rounded life isn't one solely dedicated to work, but one that thrives on exploration, learning, and the joy of new experiences. Unleash your potential with *Work Less*, because you are *more* than your work, and life is richer when you dive into its infinite possibilities.",
        "**Welcome to a life where less work equals more life. Welcome to *Work Less*.**"
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(aboutTextStrings, id: \.self) { string in
                        Text(LocalizedStringKey(string))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom)
                    }
                    
                    ForEach(dataController.allActivities) { activity in
                        VStack(alignment: .leading) {
                            Text(activity.id)
                                .font(.title.bold())
                            Text(activity.details)

                            Text("**Benefits:** \(activity.benefits.formatted(.list(type: .and)))")
                                .padding(.vertical, 10)
                                .font(.subheadline)
                            Text("**You'll need:** \(activity.materials.formatted(.list(type: .and)))")
                                .font(.subheadline)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue.gradient)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .foregroundStyle(.white)
                    }
                }
                // .padding(.horizontal, 16)
                .contentMargins(.horizontal, 16, for: .scrollContent)
            }
            .contentMargins([.bottom, .horizontal], 16, for:.scrollContent)
            .navigationTitle("How it works")
        }
    }
}

#Preview {
    AboutView()
        .environmentObject(DataController())
}
