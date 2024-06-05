//
//  Stub.swift
//
//
//  Created by Emre on 01/01/2024.
//

import Foundation
import Model

struct Stub {
    
    static var shared = Stub()
    public var bets: [Bet] = []
    public var betsDetail: [BetDetail] = []
    public var users: [User] = []
    
    public init() {
        loadBets()
    }
    
    public mutating func loadBets() {
        
        let user1 = User(username: "Lucas", email: "lucas.delanier@etu.uca.fr", nbCoins: 100, nbBets: 0, nbFriends: 0, bestWin: 0)
        users.append(user1)
        
        let user2 = User(username: "Imri", email: "emre.kartal@etu.uca.fr", nbCoins: 75, nbBets: 0, nbFriends: 0, bestWin: 0)
        users.append(user2)
        
        let user3 = User(username: "Arthur", email: "arthur.valin@etu.uca.fr", nbCoins: 30, nbBets: 0, nbFriends: 0, bestWin: 0)
        users.append(user3)

        let bet1 = BinaryBet(
            theme: "Football - Finale de la Ligue des Champions",
            phrase: "Le gagnant de la finale sera l'équipe avec le plus de tirs au but.",
            endRegisterDate: Date().addingTimeInterval(-86400),
            endBetDate: Date().addingTimeInterval(172800),
            isPublic: true,
            status: .inProgress,
            invited: [],
            author: "Lucas",
            registered: [user2]
        )
        self.bets.append(bet1)
        
        let bet2 = BinaryBet(
            theme: "Cuisine - Concours de cuisine en direct",
            phrase: "Le plat préféré du jury sera une recette végétarienne.",
            endRegisterDate: Date().addingTimeInterval(172800),
            endBetDate: Date().addingTimeInterval(259200),
            isPublic: false,
            status: .inProgress,
            invited: [user3],
            author: "Lucas",
            registered: [user2]
        )
        self.bets.append(bet2)
        
        let bet3 = BinaryBet(
            theme: "Technologie - Lancement d'un nouveau smartphone",
            phrase: "Le nombre total de précommandes dépassera-t-il 1 million dans la première semaine ?",
            endRegisterDate: Date().addingTimeInterval(259200),
            endBetDate: Date().addingTimeInterval(345600),
            isPublic: true,
            status: .finished,
            invited: [],
            author: "Lucas",
            registered: [user2, user1, user3]
        )
        self.bets.append(bet3)
        
        let bet4 = BinaryBet(
            theme: "Cinéma - Oscars 2024",
            phrase: "Le film favori des critiques remportera-t-il le prix du meilleur film ?",
            endRegisterDate: Date().addingTimeInterval(345600),
            endBetDate: Date().addingTimeInterval(432000),
            isPublic: false,
            status: .finished,
            invited: [user1],
            author: "Lucase",
            registered: [user3]
        )
        self.bets.append(bet4)

        for bet in bets {
            let betDetail = BetDetail(bet: bet, answers: [AnswerDetail(response: "OUI", totalStakes: 120, totalParticipants: 2, highestStake: 200, odds: 1.2), AnswerDetail(response: "NON", totalStakes: 120, totalParticipants: 2, highestStake: 200, odds: 1.2)], participations: [])
            self.betsDetail.append(betDetail)
        }
        
        self.betsDetail[0].addParticipation(newParticipation: Participation(stake: 120, answer: "OUI", username: user1.username, betId: "1"))
        self.betsDetail[0].addParticipation(newParticipation: Participation(stake: 20, answer: "NON", username: user2.username, betId: "2"))
        self.betsDetail[0].addParticipation(newParticipation: Participation(stake: 320, answer: "OUI", username: user3.username, betId: "3"))
        self.betsDetail[0].addParticipation(newParticipation: Participation(stake: 320, answer: "OUI", username: user3.username, betId: "3"))
        
    }
    
    public mutating func add(bet: Bet) {
        let newBetDetail = BetDetail(bet: bet, answers: [], participations: [], finalAnswer: "test")
        self.betsDetail.append(newBetDetail)
    }
}
