//
//  HomeViewModel.swift
//  MotivationApp
//
//  Created by Иван Семикин on 30/07/2025.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var quotes: [Quote] = []
    @Published var searchText: String = ""
    @Published var categoriesIsOpen: Bool = false    
    
    private let apiManager = APIManager.shared
    private var errorMessage = ""
    
    private var isLoading: Bool = false
    
    init() {
        Task {
            await loadQuotes()
        }
    }
    
    func loadQuotes() async {
        do {
            quotes = try await apiManager.fetchQuotes()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
