//
//  PostsView.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 02/01/23.
//

import SwiftUI

struct PostsView: View {
    @ObservedObject var viewModel: ContentViewModel
//    a
    var body: some View {
        List {
            ForEach(viewModel.posts) { todo in
                HStack {
                    Label {
                        Text(todo.title)
                            .font(.title)
                    } icon: {
                        Image(systemName: "checkmark.diamond.fill")
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
                await viewModel.fetch(type: .post)
            }
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView(viewModel: ContentViewModel())
    }
}
