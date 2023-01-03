//
//  CONCURRENCY_API_CallApp.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 01/01/23.
//

import SwiftUI

@main
struct CONCURRENCY_API_CallApp: App {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
                .onAppear {
                    Task {
                        await viewModel.fetch(type: .album)
                        await viewModel.fetch(type: .photo)
                        await viewModel.fetch(type: .post)
                        await viewModel.fetch(type: .user)
                        await viewModel.fetch(type: .comment)
                        await viewModel.fetch(type: .todo)
                    }
                }
        }
    }
}
