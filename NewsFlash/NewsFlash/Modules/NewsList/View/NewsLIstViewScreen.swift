//
//  NewsLIstView.swift
//  NewsFlash
//
//  Created by Anurag Sharma on 31/07/25.
//

import SwiftUI

struct NewsListViewScreen: View {
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
                                Button {
                                    viewModel.selectedArticle = article
                                } label: {
                                    ArticleView(article: article)
                                }.buttonStyle(.plain)
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
            .sheet(item: $viewModel.selectedArticle) { article in
                            ArticleDetailView(article: article)
                        }
        }
    }
}
#Preview {
    NewsListViewScreen(viewModel: NewsListViewModel())
}
