//
//  Utility.swift
//  ServiceListApp
//
//  Created by Purnasindhu-749 on 10/07/25.
//

import Foundation
import SwiftUI

class Utility {
    
    static func getBadgeColor(_ status: String) -> Color {
        switch status.lowercased() {
        case "scheduled": return Color.green.opacity(0.2)
        case "confirmed": return Color.blue.opacity(0.2)
        case "planned": return Color.blue.opacity(0.2)
        case "approved": return Color.orange.opacity(0.2)
        case "in progress": return Color.gray.opacity(0.2)
        default: return Color.gray.opacity(0.2)
        }
    }

    static func getDotColor(_ status: String) -> Color {
        switch status.lowercased() {
        case "scheduled": return .green
        case "confirmed": return .blue
        case "planned": return .blue
        case "approved": return .orange
        case "in progress": return .gray
        default: return .gray
        }
    }
    
    static func statusIconName(for status: String) -> String {
        switch status.lowercased() {
        case "scheduled": return "calendar"
        case "confirmed": return "checkmark"
        case "planned": return "calendar.badge.clock"
        case "approved": return "checkmark.seal"
        case "in progress": return "clock"
        default: return "questionmark"
        }
    }
}
