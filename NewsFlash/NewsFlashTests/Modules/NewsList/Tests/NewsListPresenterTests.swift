//
//  NewsListPresenterTests.swift
//  NewsFlashTests
//
//  Created by Anurag Sharma on 01/08/25.
//

import Testing
@testable import NewsFlash
struct NewsListPresenterTests {
    
    @Test("Presenter calls interactor and shows loader")
    func testViewDidLoad() {
        let presenter = NewsListPresenter()
        let interactor = MockNewsListInteractor()
        let viewModel = MockNewsListViewModel()
        
        presenter.interactor = interactor
        presenter.viewModel = viewModel
        
        presenter.viewDidLoad()
        
        #expect(interactor.fetchCalled)
        #expect(viewModel.loaderStatus == true)
    }
    
    @Test("Presenter stops loader and updates data")
    func testDidFetchData() {
        let presenter = NewsListPresenter()
        let viewModel = MockNewsListViewModel()
        presenter.viewModel = viewModel
        
        let dummyData = NewsListEntity(status: "ok", copyright: "",
                                       numResults: 1, results: [])
        
        presenter.didFetchData(dummyData)
        
        #expect(viewModel.loaderStatus == false)
        #expect(viewModel.newsReceived?.status == "ok")
    }
}
