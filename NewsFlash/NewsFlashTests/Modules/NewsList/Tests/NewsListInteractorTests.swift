//
//  NewsListInteractorTests.swift
//  NewsFlashTests
//
//  Created by Anurag Sharma on 01/08/25.
//

import Testing
@testable import NewsFlash
struct NewsListInteractorTests {
    @Test("Interactor fetches and passes data")
    func testFetchDataCallsOutput() async {
        let interactor = MockNewsListInteractor()
        let output = MockNewsListInteractorOutput()
        interactor.output = output
        interactor.fetchData()
        
        try? #require(output.dataReceived != nil)
    }
}
