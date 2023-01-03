//
//  CommentsView.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 02/01/23.
//

import SwiftUI

struct CommentsView: View {
    @ObservedObject var viewModel: ContentViewModel
    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    var body: some View {
        
        ScrollView {
            ForEach(viewModel.comments) { i in
                CommentCardView(comment: i)
            }
        }
        
        .padding()
        .onAppear {
            Task {
                await viewModel.fetch(type: .comment)
            }
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(viewModel: ContentViewModel())
    }
}
