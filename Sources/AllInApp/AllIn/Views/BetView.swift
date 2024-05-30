//
//  BetView.swift
//  AllIn
//
//  Created by Lucas on 22/09/2023.
//

import SwiftUI
import Model

struct BetView: View {
    
    @StateObject private var viewModel = BetViewModel()
    @Binding var showMenu: Bool
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            TopBar(showMenu: self.$showMenu)
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .center, spacing: 0, pinnedViews: [.sectionHeaders]) {
                    
                    TrendingBetCard().padding(.top,25).padding([.leading,.trailing],25)
                    
                    Section {
                        VStack(spacing: 20){
                            if(viewModel.bets.isEmpty){
                                EmptyInfo(emoji:"🎮", title: "Aucun Bet ne correspond à votre recherche", explain: "")
                            }
                            else{
                                ForEach(viewModel.bets, id: \.id) { (bet: Bet) in
                                    BetCard(bet: bet)
                                }
                            }
                        }
                        .padding([.leading,.trailing],25)
                        
                    } header: {
                        ZStack{
                            AllInColors.fadeInGradiantCard
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack{
                                    ChoiceCapsule(filter: .isPublic, viewModel: viewModel)
                                    ChoiceCapsule(filter: .isInvitation, viewModel: viewModel)
                                    ChoiceCapsule(filter: .inProgress, viewModel: viewModel)
                                    ChoiceCapsule(filter: .isFinished, viewModel: viewModel)
                                }
                                .padding(.leading,25)
                                .padding([.top,.bottom],15)
                            }
                        }
                    }
                }
            }
            .refreshable {
                viewModel.getItems()
            }
            .sheet(isPresented: $viewModel.showingSheet, onDismiss: {
                viewModel.betsOver.removeFirst()
                viewModel.showingSheet = !viewModel.betsOver.isEmpty
            }) {
                if let firstBetDetail = viewModel.betsOver.first {
                    BetEndingValidationView(bet: firstBetDetail)
                }
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(AllInColors.backgroundColor)
        
    }
}


struct BetView_Previews: PreviewProvider {
    static var previews: some View {
        BetView(showMenu: .constant(false))
            .preferredColorScheme(.light)
    }
}
