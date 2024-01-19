//
//  Manager.swift
//  
//
//  Created by Emre on 29/12/2023.
//

import Foundation

public struct Manager {
    let betDataManager: BetDataManager
    let userDataManager: UserDataManager
    
    public init(withBetDataManager betDataManager: BetDataManager, withUserDataManager userDataManager: UserDataManager){
        self.betDataManager = betDataManager
        self.userDataManager = userDataManager
    }
    
    public func addBet(theme: String, description: String, endRegister: Date, endBet: Date, isPublic: Bool, creator: User) {
        userDataManager.addBet(bet: BinaryBet(theme: theme, phrase: description, endRegisterDate: endRegister, endBetDate: endBet, totalStakes: 0, isPublic: isPublic, invited: [], author: creator, registered: []))
    }
    
    public func getBets(withIndex index: Int, withCount count: Int, completion: @escaping ([Bet]) -> Void) {
        betDataManager.getBets(withIndex: index, withCount: count) { bets in
            completion(bets)
        }
    }
    
    public func getBet(withId id: String, completion: @escaping (BetDetail) -> Void) {
        betDataManager.getBet(withId: id) { bet in
            completion(bet)
        }
    }
    
    public func getHistoricBets(withIndex index: Int, withCount count: Int, completion: @escaping ([Bet]) -> Void) {
        userDataManager.getOldBets(withIndex: index, withCount: count) { bets in
            completion(bets)
        }
    }
}
