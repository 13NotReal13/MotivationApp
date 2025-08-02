//
//  ContentView.swift
//  MotivationApp
//
//  Created by Иван Семикин on 30/07/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var quotes: [Quote] = []
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Search", text: $viewModel.searchText)
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.black.opacity(0.05))
            }
            
            ForEach(viewModel.quotes, id: \.author) { quote in
                QuoteView(
                    text: quote.quote,
                    updateAction: { await viewModel.loadQuotes() }
                )
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Quotoday")
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.categoriesIsOpen.toggle()
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .foregroundStyle(.black)
                }
            }
        }
        .sheet(isPresented: $viewModel.categoriesIsOpen) {
            CategoriesVew()
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}
