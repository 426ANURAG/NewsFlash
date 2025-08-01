//
//  NewsLIstView.swift
//  NewsFlash
//
//  Created by Anurag Sharma on 31/07/25.
//

import SwiftUI

struct NewsListView: View {
    @ObservedObject private var viewModel = NewsListViewModel()
    var presenter: NewsListPresenterProtocol?
    
    init(viewModel: NewsListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    VStack {
                        ProgressView("Loading...")
                    }
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.news.results) { article in
                                ArticleView(article: article)
                            }
                        }
                    }
                    .padding(.top)
                    
                }
            }
            .navigationTitle("NewsList")
            .onAppear {
                presenter?.viewDidLoad()
            }
        }
    }
}
#Preview {
    NewsListView(viewModel: NewsListViewModel())
}
