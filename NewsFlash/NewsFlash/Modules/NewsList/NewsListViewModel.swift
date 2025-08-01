//
//  NewsListViewModel.swift
//  NewsFlash
//
//  Created by Anurag Sharma on 31/07/25.
//
import SwiftUI
protocol NewsListViewModelProtocol: AnyObject {
    func displayNewsList(_ data: NewsListEntity)
    func startLoader(status: Bool)
}

class NewsListViewModel: ObservableObject, NewsListViewModelProtocol {
    @Published var news: NewsListEntity = .init(status: "", copyright: "", numResults: 1, results: [])
    @Published var isLoading: Bool = false

    func displayNewsList(_ news: NewsListEntity) {
        DispatchQueue.main.async {[weak self] in
            self?.news = news
        }
    }
    
    func startLoader(status: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.isLoading = status
        }
    }
}
