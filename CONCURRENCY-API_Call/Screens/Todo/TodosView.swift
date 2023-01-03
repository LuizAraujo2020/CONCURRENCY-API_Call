//
//  TodosView.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 01/01/23.
//

import SwiftUI

struct TodosView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.todos) { todo in
                HStack {
                    Label {
                        Text(todo.title)
                            .font(.title)
                    } icon: {
                        Image(systemName: todo.completed ? "checkmark.diamond.fill" : "checkmark.diamond")
                            .symbolRenderingMode(.multicolor)
                            .font(.title)
                    }
                    
                    
                    Spacer()
                }
            }
        }
        .listStyle(.plain)
        .padding()
        .onAppear {
            Task {
                await viewModel.fetch(type: .todo)
            }
        }
    }
}

struct TodosView_Previews: PreviewProvider {
    static var previews: some View {
        TodosView(viewModel: ContentViewModel())
    }
}
