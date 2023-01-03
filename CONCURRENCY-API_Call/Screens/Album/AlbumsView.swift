//
//  AlbumsView.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 02/01/23.
//

import SwiftUI

struct AlbumsView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.albums) { album in
                HStack {
                    Label {
                        Text(album.title)
                            .font(.title)
                    } icon: {
                        Image(systemName:  "checkmark.diamond.fill")
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
                await viewModel.fetch(type: .album)
            }
        }
    }
}

struct AlbumsView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumsView(viewModel: ContentViewModel())
    }
}
