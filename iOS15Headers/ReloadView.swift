//
//  ListReloadView.swift
//

import SwiftUI

struct ReloadView: View {

    // MARK: - Properties

    @Binding var isLoading: Bool
    @Binding var lastFetchDate: Date?
    let action: () -> Void

    // Body

    var body: some View {
        Button(
            action: action,
            label: { buttonContent }
        )
    }

    // Helpers

    private var buttonContent: some View {
        HStack(alignment: .center) {
            Spacer()
            lastFetchDate.flatMap(timeLabel)
            reloadLabel
            Spacer()
        }
    }

    private var reloadLabel: some View {
        Text(isLoading ? "Loading..." : "Reload")
            .font(.system(size: 12.0, weight: .semibold))
            .foregroundColor(.accentColor)
            .multilineTextAlignment(.center)
    }

    // MARK: - Utilities

    private func timeLabel(for date: Date) -> some View {
        let formatted = formatUpdatedString(date)

        return Text("Last updated: \(formatted)")
            .font(.system(size: 12.0, weight: .regular))
            .foregroundColor(.secondary)
            .multilineTextAlignment(.center)
    }

    private func formatUpdatedString(_ date: Date) -> String {
        let now = Date()

        if let interval = Calendar.current.dateComponents([.year], from: date, to: now).day, interval > 0 {
            return "\(interval) year\(interval == 1 ? "" : "s")" + " " + "ago"
        }
        if let interval = Calendar.current.dateComponents([.month], from: date, to: now).month, interval > 0 {
            return "\(interval) month\(interval == 1 ? "" : "s")" + " " + "ago"
        }
        if let interval = Calendar.current.dateComponents([.weekOfMonth], from: date, to: now).weekOfMonth, interval > 0 {
            return "\(interval) week\(interval == 1 ? "" : "s")" + " " + "ago"
        }
        if let interval = Calendar.current.dateComponents([.day], from: date, to: now).day, interval > 0 {
            return "\(interval) day\(interval == 1 ? "" : "s")" + " " + "ago"
        }
        if let interval = Calendar.current.dateComponents([.hour], from: date, to: now).hour, interval > 0 {
            return "\(interval) hour\(interval == 1 ? "" : "s")" + " " + "ago"
        }
        if let interval = Calendar.current.dateComponents([.minute], from: date, to: now).minute, interval > 0 {
            return "\(interval) minute\(interval == 1 ? "" : "s")" + " " + "ago"
        }

        return "Just now"
    }
}
