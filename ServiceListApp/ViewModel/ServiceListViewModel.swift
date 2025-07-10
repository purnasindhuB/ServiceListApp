//
//  ServiceListViewModel.swift
//  ServiceListApp
//
//  Created by Purnasindhu-749 on 10/07/25.
//

import Foundation
import ServicesSampleData
import Combine

class ServiceListViewModel : ObservableObject {
    @Published var allServices: [Service] = []
    @Published var displayedServices: [Service] = []
    @Published var searchText: String = ""
    
    private var cancelLabels = Set<AnyCancellable>()
    private let isoFormatter = ISO8601DateFormatter()
    
        init() {
            setupSearch()
            loadServices()
        }

    
    
    func loadServices() {
        self.allServices = SampleData.generateServices(count: 15)
        self.displayedServices = allServices
    }
    
    func refresh() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        await MainActor.run {
            self.loadServices()
        }
    }
    
    func setupSearch(){
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink{ [weak self] text in
                guard let self = self else { return }
                if text.isEmpty {
                    self.displayedServices = self.allServices
                }
                else {
                    self.displayedServices = self.allServices.filter {
                        $0.title.localizedStandardContains(text) ||
                        $0.customerName.localizedStandardContains(text) ||
                        $0.description.localizedStandardContains(text)
                    }
                }
            }
            .store(in: &cancelLabels)
    }
    
    func formattedDate(from isoDate: String) -> String {
        guard let date = isoFormatter.date(from: isoDate) else { return "Invalid date" }
        return date.formattedDate()
    }
}
