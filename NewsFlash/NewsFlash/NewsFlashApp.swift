//
//  NewsFlashApp.swift
//  NewsFlash
//
//  Created by Anurag Sharma on 30/07/25.
//

import SwiftUI
import NewsFlashNetworking

@main
struct NewsFlashApp: App {
    
    init() {
        setup()
    }
    
    var body: some Scene {
        WindowGroup {
            NewsListRouter.createModule()
        }
    }
    
    func setup() {
        // added for internet connection monitoring, can be commented if not needed
        Task {
            await Reachability.shared.startMonitoring()
        }
    }
}
