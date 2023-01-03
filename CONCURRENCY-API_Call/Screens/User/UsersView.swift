//
//  UsersView.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 02/01/23.
//

import SwiftUI

struct UsersView: View {
    @ObservedObject var viewModel: ContentViewModel
//    a
    var body: some View {
        List {
            ForEach(viewModel.users) { user in

                HStack {
                    Label {
                        Text(user.username)
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
                await viewModel.fetch(type: .user)
            }
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView(viewModel: ContentViewModel())
    }
}
