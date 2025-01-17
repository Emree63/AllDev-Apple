//
//  AllInApp.swift
//  AllIn
//
//  Created by Emre on 19/09/2023.
//

import SwiftUI
import DependencyInjection
import Model

@main
struct AllInApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) var phase
    let DI = DependencyInjection.shared
    
    init() {
        DI.addSingleton(IAuthService.self, AuthService())
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    AppStateContainer.shared.notificationState.scheduleNotifications()
                }
                .onChange(of: phase) { newPhase in
                    switch newPhase {
                    case .background, .inactive:
                        UIApplication.shared.shortcutItems = QuickAction.allShortcutItems
                    default:
                        break
                    }
                }
        }
    }
}
