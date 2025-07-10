//
//  ServiceRowView.swift
//  ServiceListApp
//
//  Created by Purnasindhu-749 on 10/07/25.
//

import SwiftUI
import ServicesSampleData

struct ServiceRowView: View {
    let service: Service
    let dateString: String

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 12) {

                Text(service.title)
                    .font(.headline)
                    .foregroundStyle(.black)

                HStack(spacing: 8) {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color(red: 34/255, green: 90/255, blue: 158/255))
                    Text(service.customerName)
                        .font(.subheadline)
                }

                HStack(spacing: 8) {
                    Image(systemName: "doc.text")
                        .foregroundColor(Color(red: 34/255, green: 90/255, blue: 158/255))
                    Text(service.description)
                        .font(.caption)
                }

                HStack {
                    statusBadge(service.status.rawValue.capitalized)
                    Spacer()
                    Text(dateString)
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)

            Circle()
                .fill(Utility.getDotColor(service.status.rawValue))
                .frame(width: 10, height: 10)
                .offset(x: -12, y: 12)
        }
        .padding(.vertical, 4)
    }

    func iconBackground(systemName: String, tint: Color) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(tint.opacity(0.15))
                .frame(width: 28, height: 28)
            Image(systemName: systemName)
                .foregroundColor(tint)
        }
    }

    func statusBadge(_ status: String) -> some View {
        HStack(spacing: 6) {
            RoundedRectangle(cornerRadius: 4)
                .fill(Utility.getDotColor(status))
                .frame(width: 10, height: 10)

            Text(status)
                .font(.caption)
                .foregroundColor(Utility.getDotColor(service.status.rawValue))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Utility.getBadgeColor(status))
        .clipShape(Capsule())
    }


   

}
