//
//  ServiceListView.swift
//  ServiceListApp
//
//  Created by Purnasindhu-749 on 10/07/25.
//

import SwiftUI

import SwiftUI

struct ServiceListView: View {
    @StateObject var viewModel = ServiceListViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {

                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)

                    TextField("Search", text: $viewModel.searchText)
                        .autocorrectionDisabled(true)

                    Button(action: {
                        // Mic action
                    }) {
                        Image(systemName: "mic.fill")
                            .foregroundColor(.gray)
                    }
                }
                .padding(5)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)

                List(viewModel.displayedServices, id: \.id) { service in
                    ZStack {
                        ServiceRowView(
                            service: service,
                            dateString: viewModel.formattedDate(from: service.scheduledDate)
                        )
                        NavigationLink("", destination: ServiceDetailView(service: service))
                            .opacity(0)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }

                    .refreshable {
                    await viewModel.refresh()
                }
            }
            .background(Color(.white))
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Services")
                        .font(.headline)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ServiceListView()
}
