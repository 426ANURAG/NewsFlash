//
//  MockNewsListViewModel.swift
//  NewsFlashTests
//
//  Created by Anurag Sharma on 01/08/25.
//

import Foundation
@testable import NewsFlash

class MockNewsListViewModel: NewsListViewModelProtocol {
    var loaderStatus: Bool = false
    var newsReceived: NewsListEntity?
    
    func startLoader(status: Bool) {
        loaderStatus = status
    }
    
    func displayNewsList(_ data: NewsListEntity) {
        newsReceived = data
    }
}
