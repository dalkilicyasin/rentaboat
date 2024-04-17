//
//  rentaboatApp.swift
//  rentaboat
//
//  Created by yasin on 19.02.2024.
//

import SwiftUI

@main
struct rentaboatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            MainPageTabView()
        }
    }
}
