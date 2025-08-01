//
//  NewsListPresenter.swift
//  NewsFlash
//
//  Created by Anurag Sharma on 31/07/25.
//

import Foundation

protocol NewsListPresenterProtocol: AnyObject {
    func viewDidLoad()
}

final class NewsListPresenter: NewsListPresenterProtocol {
    weak var viewModel: NewsListViewModelProtocol?
    var interactor: NewsListInteractorInputProtocol?
    var router: NewsListRouterProtocol?

    func viewDidLoad() {
        viewModel?.startLoader(status: true)
        interactor?.fetchData()
    }
}

extension NewsListPresenter: NewsListInteractorOutputProtocol {
    func didFetchData(_ data: NewsListEntity) {
        viewModel?.startLoader(status: false)
        viewModel?.displayNewsList(data)
    }
}


