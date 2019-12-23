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
    
    @State var isShowView: Bool = true
    
    var body: some View {
        VStack(alignment: .center) {
            if ramCharacterStatusListVM.loading == false {
                Toggle(isOn: $isShowView.animation()) {
                    Text("show BarChartView")
                }
                .padding()
            }
            Spacer()
            HStack() {
                Spacer()
                if ramCharacterStatusListVM.loading {
                    ActivityIndicatorView()
                } else {
                    VStack() {
                        if isShowView {
                            BarChartView(data: [
                                ramCharacterStatusListVM.aliveCount,
                                ramCharacterStatusListVM.deadCount,
                                ramCharacterStatusListVM.unknownCount
                                ],
                                title: "status of characters"
                            )
                            .transition(.scale)
                            .animation(.easeInOut(duration: 1))
                        } else {
                            Text("alive: \(ramCharacterStatusListVM.aliveCount)")
                            Text("dead: \(ramCharacterStatusListVM.deadCount)")
                            Text("unknown: \(ramCharacterStatusListVM.unknownCount)")
                        }
                    } // VStack
                        .onTapGesture {
                            self.isShowView.toggle()
                    }
                }
                Spacer()
            } // HStack
            Spacer()
        } // VStack
    }
}
