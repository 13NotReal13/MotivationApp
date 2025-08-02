//
//  QuoteView.swift
//  MotivationApp
//
//  Created by Иван Семикин on 02/08/2025.
//

import SwiftUI

struct QuoteView: View {
    let text: String
    let updateAction: () async -> Void
    
    var body: some View {
        Text(text)
            .padding(.vertical, 120)
            .padding(.horizontal)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
            .overlay {
                VStack {
                    Spacer()
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "bookmark")
                                .padding()
                        }
                        
                        Spacer()
                        
                        Button {
                            Task { await updateAction() }
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .padding()
                        }
                    }
                    .foregroundStyle(.black)
                    .font(.title2)
                }
            }
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.yellow.opacity(0.2))
            }
            .padding()
    }
}

#Preview {
    QuoteView(text: "Hello world Hello world Hello world Hello world Hello world", updateAction: {} )
}
