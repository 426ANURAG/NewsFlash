//
//  MockNewsListInteractor.swift
//  NewsFlashTests
//
//  Created by Anurag Sharma on 01/08/25.
//

import Foundation
@testable import NewsFlash

class MockNewsListInteractor: NewsListInteractorInputProtocol {
    var output: NewsListInteractorOutputProtocol?
    var fetchCalled = false
    func fetchData() {
        fetchCalled = true
        output?.didFetchData(.init(status: "", copyright: "", numResults: 1, results: []))
    }
}

class MockNewsListInteractorOutput: NewsListInteractorOutputProtocol {
    var dataReceived: NewsListEntity?
    
    func didFetchData(_ data: NewsListEntity) {
        dataReceived = data
    }
}
