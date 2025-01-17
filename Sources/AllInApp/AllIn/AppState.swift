//
//  AppState.swift
//  AllIn
//
//  Created by Emre on 17/12/2023.
//

import SwiftUI
import Model

class AppStateContainer: ObservableObject {
    static let shared = AppStateContainer()
    let loggedState: LoggedState = LoggedState()
    var onlineStatus: OnlineStatus = OnlineStatus()
    var notificationState: NotificationService = NotificationService()
    @Published var user: User?
    
    @AppStorage("authenticationRefresh", store: UserDefaults(suiteName: "group.alldev.AllIn")!) var authenticationRefresh: String?
}

class LoggedState: ObservableObject {
    @Published var connectedUser: Bool = false
}

class OnlineStatus: ObservableObject {
    @Published var isOnline: Bool = true
}
