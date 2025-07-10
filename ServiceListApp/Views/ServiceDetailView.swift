//
//  ServiceDetailView.swift
//  ServiceListApp
//
//  Created by Purnasindhu-749 on 10/07/25.
//

import SwiftUI
import MapKit
import ServicesSampleData


struct ServiceDetailView: View {
    let service: Service

    @State private var region: MKCoordinateRegion = .init(
        center: CLLocationCoordinate2D(latitude: 12.97, longitude: 77.59),
        span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Map(coordinateRegion: $region)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                // Title + Status Badge
                HStack(alignment: .center) {
                    Text(service.title)
                        .font(.title2)
                        .bold()
                    Spacer()
                    statusBadge(service.status.rawValue.capitalized)
                }

                infoRow(icon: "person", label: "Customer", value: service.customerName)
                infoRow(icon: "doc.text", label: "Description", value: service.description)
                infoRow(icon: "clock", label: "Scheduled Time", value: formattedDate())
                infoRow(icon: "location", label: "Location", value: service.location)
                infoRow(icon: "text.bubble", label: "Service Notes", value: service.serviceNotes)
            }
            .padding()
        }
        .navigationTitle("Service Detail")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Badge View
    func statusBadge(_ status: String) -> some View {
        HStack(spacing: 6) {
            RoundedRectangle(cornerRadius: 4)
                .fill(Utility.getDotColor(status))
                .frame(width: 10, height: 10)

            Text(status)
                .font(.caption)
                .foregroundColor(.black)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Utility.getDotColor(status).opacity(0.2))
        .clipShape(Capsule())
    }

    // MARK: - Reusable Info Row
    func infoRow(icon: String, label: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(Color(red: 34/255, green: 90/255, blue: 158/255))

                Text(label)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
            }

            Text(value)
                .font(.caption)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.bottom, 8)
    }

    // MARK: - Date Formatter
    func formattedDate() -> String {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: service.scheduledDate) {
            return date.formattedDate()
        }
        return ""
    }

   
}
