//
//  NewsListRouter.swift
//  NewsFlash
//
//  Created by Anurag Sharma on 31/07/25.
//

import SwiftUI
protocol NewsListRouterProtocol: AnyObject {
    func moveToHome()
}

class NewsListRouter: NewsListRouterProtocol {
    
    ///Build module
    static func createModule() -> some View {
        let viewModel = NewsListViewModel()
        var view = NewsListView(viewModel: viewModel)
        let presenter = NewsListPresenter()
        let interactor = NewsListInteractor()
        let router = NewsListRouter()
        
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.viewModel = viewModel
        interactor.output = presenter
        view.presenter = presenter
        return view
    }
    
    func moveToHome() {
        //Move to next view
    }
}

