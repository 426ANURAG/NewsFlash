//
//  NewsListInteractor.swift
//  NewsFlash
//
//  Created by Anurag Sharma on 31/07/25.
//

import Foundation
import NewsFlashNetworking

public protocol NewsListInteractorInputProtocol: AnyObject {
    func fetchData()
}

protocol NewsListInteractorOutputProtocol: AnyObject {
    func didFetchData(_ data: NewsListEntity)
}

class NewsListInteractor: NewsListInteractorInputProtocol {
    weak var output: NewsListInteractorOutputProtocol?
    
    func fetchData() {
        Task {
            let shared = await NFNetworkManager.shared
            let request = Networkrequest(endpoint: .getNews(section: .allSections, period: "7"))
            let result: Result<NewsListEntity, NetworkError> = await shared.request(requestData: request)
            switch result {
            case .success(let data):
                self.output?.didFetchData(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
