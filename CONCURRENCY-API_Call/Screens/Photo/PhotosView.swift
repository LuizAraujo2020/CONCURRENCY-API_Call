//
//  PhotosView.swift
//  CONCURRENCY-API_Call
//
//  Created by Luiz Araujo on 02/01/23.
//

import SwiftUI

struct PhotosView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.photos) { photo in
                    HStack() {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(width: 100)
                                .frame(height: 100)
                            
                            AsyncImage(url: URL(string: photo.thumbnailUrl)!) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(minWidth: 100)
                                        .frame(height: 100)
                                } else if phase.error != nil { // 3
                                                               // some kind of error appears
                                    Text("404! \n No image available 😢")
                                        .bold()
                                        .font(.title)
                                        .multilineTextAlignment(.center)
                                    
                                } else { // 4
                                         // showing progress view as placeholder
                                    ProgressView()
                                        .font(.largeTitle)
                                        .frame(minWidth: 100)
                                        .frame(height: 100)
                                }
                            }.padding()
                                .frame(minWidth: 100)
                                .frame(height: 100)
                        }
                        
                        Text(photo.title)
                            .lineLimit(3)
                            .allowsTightening(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                    }
                }
            }
        }
        .listStyle(.plain)
        .padding()
        .onAppear {
            Task {
                await viewModel.fetch(type: .photo)
            }
        }
    }
}


//    var body: some View {
//        List {
//            ForEach(viewModel.photos) { photo in
//                HStack {
//                    Text("Ohoto")
//                    AsyncImage(url: URL(string: photo.url)!)
//                }
//            }
//        }
//        .listStyle(.plain)
//        .padding()
//        .onAppear {
//            Task {
//                await viewModel.fetch(type: .photo)
//
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                print("❤️ COUNT: \(viewModel.photos.count)")
//            }
//        }
//    }
//}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView(viewModel: ContentViewModel())
    }
}
