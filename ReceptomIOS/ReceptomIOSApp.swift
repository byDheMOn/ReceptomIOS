//
//  ReceptomIOSApp.swift
//  ReceptomIOS
//
//  Created by Jorge Ordax on 3/1/24.
//

import SwiftUI
import SwiftData

@main
struct ReceptomIOSApp: App {
    let coordinator = Coordinator()
    var body: some Scene {
        WindowGroup {
            HomePageView()
                .environmentObject(coordinator)
        }
    }
}
