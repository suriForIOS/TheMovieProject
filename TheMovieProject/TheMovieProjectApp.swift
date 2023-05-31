//
//  TheMovieProjectApp.swift
//  TheMovieProject
//
//  Created by Surbhi Bagadia on 27/05/23.
//
import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TheMovieProjectApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
    }
}
