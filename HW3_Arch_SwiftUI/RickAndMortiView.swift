//
//  RickAndMortiView.swift
//  HW3_Arch_SwiftUI
//
//  Created by Сергей on 21/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct RickAndMortiView: View {
    
    @EnvironmentObject var ramCharacterStatusListVM: RAMCharacterStatusListViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            HStack() {
                Spacer()
                if ramCharacterStatusListVM.loading {
                    ActivityIndicatorView()
                } else {
                    VStack() {
                        BarChartView(data: [
                            ramCharacterStatusListVM.aliveCount,
                            ramCharacterStatusListVM.deadCount,
                            ramCharacterStatusListVM.unknownCount
                            ],
                            title: "status of characters"
                        )
                        .transition(.move(edge: .leading))
                        Text("alive: \(ramCharacterStatusListVM.aliveCount)")
                        Text("dead: \(ramCharacterStatusListVM.deadCount)")
                        Text("unknown: \(ramCharacterStatusListVM.unknownCount)")
                    }
                }
                Spacer()
            }
            Spacer()
        }
    }
}
