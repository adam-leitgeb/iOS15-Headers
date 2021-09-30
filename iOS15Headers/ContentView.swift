//
//  ContentView.swift
//  iOS15Headers
//
//  Created by Adam Leitgeb on 30.09.2021.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Properties

    @State var isLoading: Bool = false
    @State var recentFetchDate: Date? = Date()
    @State var numbers: [String] = ["one", "two", "three"]

    var body: some View {
        NavigationView {
            List {
                if #available(iOS 15.0, *) {
                    testSection
                        .headerProminence(.increased)   // this doesn't help
                                                        // neither `UITableView.appearance().sectionHeaderTopPadding = 0`
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Title")
        }
    }

    // Helpers

    private var testSection: some View {
        Section(
            header: ReloadView(
                isLoading: $isLoading,
                lastFetchDate: $recentFetchDate,
                action: { print("reload") }
            ),
            content: { ForEach(numbers, id: \.self) { number in Text(number) } }
        )
        .textCase(nil)
    }
}
