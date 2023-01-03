//
//  ContentView.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 02/01/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        TabView {
            PhotosView(viewModel: viewModel)
                .tabItem {
                    Label("Photos", systemImage: "photo.on.rectangle")
                        .symbolVariant(.fill)
                        .symbolRenderingMode(.multicolor)
                }
            AlbumsView(viewModel: viewModel)
                .tabItem {
                    Label("Album", systemImage: "photo.stack")
                        .symbolVariant(.fill)
                        .symbolRenderingMode(.multicolor)
                }
            CommentsView(viewModel: viewModel)
                .tabItem {
                    Label("Comments", systemImage: "text.bubble.rtl")
                        .symbolVariant(.fill)
                        .symbolRenderingMode(.multicolor)
                }
            PostsView(viewModel: viewModel)
                .tabItem {
                    Label("Posts", systemImage: "doc.richtext.ar")
                        .symbolVariant(.fill)
                        .symbolRenderingMode(.multicolor)
                }
            TodosView(viewModel: viewModel)
                .tabItem {
                    Label("Todos", systemImage: "list.clipboard")
                        .symbolVariant(.fill)
                        .symbolRenderingMode(.multicolor)
                }
            UsersView(viewModel: viewModel)
                .tabItem {
                    Label("Users", systemImage: "person.text.rectangle")
                        .symbolVariant(.fill)
                        .symbolRenderingMode(.multicolor)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
