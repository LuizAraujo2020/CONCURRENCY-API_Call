//
//  CommentCardView.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 02/01/23.
//

import SwiftUI

struct CommentCardView: View {
    var comment: Comment
    
    var body: some View {
        GroupBox {
            VStack {
                Text("#\(comment.id)")
                    .bold()
                    .font(.system(.largeTitle, design: .rounded))
                    .font(.title2)
                    .padding()
                VStack(alignment: .leading) {
                    Text(comment.name)
                        .font(.title3)
                    
                    Text(comment.email)
                        .font(.title3)
                        .padding(.bottom)
                    
                    Text(comment.body)
                }
                .padding()
            }
        }
    }
}

struct CommentCardView_Previews: PreviewProvider {
    static var previews: some View {
        CommentCardView(comment: Comment(id: 1,
                                         postId: 1,
                                         name: "Biruleibe",
                                         email: "biru@email",
                                         body: "Lorem ipsumaksjdbahjsd"))
    }
}
