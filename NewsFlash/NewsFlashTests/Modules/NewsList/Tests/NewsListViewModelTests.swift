//
//  NewsListViewModelTests.swift
//  NewsFlashTests
//
//  Created by Anurag Sharma on 01/08/25.
//

import Testing
@testable import NewsFlash
struct NewsListViewModelTests {
    @Test("ViewModel updates loading state")
    func testLoadingState() {
        let vm = MockNewsListViewModel()
        #expect(vm.loaderStatus == false)
        
        vm.startLoader(status: true)
        #expect(vm.loaderStatus == true)
    }
    
    @Test("ViewModel updates news list")
    func testDisplayNews() {
        let vm = MockNewsListViewModel()
        let dummy = NewsListEntity(status: "ok", copyright: "",
                                   numResults: 1, results: [])
        vm.displayNewsList(dummy)
        #expect(vm.newsReceived?.status == "ok")
        #expect(vm.newsReceived?.numResults == 1)
    }
}
