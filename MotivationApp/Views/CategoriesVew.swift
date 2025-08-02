//
//  CategoriesVew.swift
//  MotivationApp
//
//  Created by Иван Семикин on 02/08/2025.
//

import SwiftUI

enum Categories: String, CaseIterable {
    case architecture
    case art
    case beauty
    case best
    case birthday
    case business
    case car
    case communication
    case computers
}

struct CategoriesVew: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("What makes you feel that way?")
                .font(.system(.title, weight: .bold))
                .multilineTextAlignment(.center)
            
            Text("you can select more than one")
            
            
            VStack {
                ForEach(Categories.allCases, id: \.rawValue) { category in
                    CategoryButton(title: category.rawValue.capitalized)
                }
            }
            
            Text("you can change it later")
            
            Button {
                viewModel.categoriesIsOpen.toggle()
            } label: {
                Text("Done")
                    .foregroundStyle(.black)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 60)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.cyan)
                    }
            }
        }
    }
}

struct CategoryButton: View {
    let title: String
    
    @State private var isSelected: Bool = false
    
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            Text(title)
                .foregroundStyle(.black)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(
                            isSelected
                            ? .cyan
                            : .gray.opacity(0.5)
                        )
                }
                .padding(.horizontal, 60)
        }
    }
}

#Preview {
    CategoriesVew()
}
