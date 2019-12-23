//
//  GithubView.swift
//  HW3_Arch_SwiftUI
//
//  Created by Сергей on 21/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct GithubView: View {
    
    @EnvironmentObject var githubRepoListVM: GitHubRepoListViewModel
    
    @State var isShowView: Bool = true
    
    var body: some View {
        VStack(alignment: .center) {
            if githubRepoListVM.loading == false {
                Toggle(isOn: $isShowView.animation()) {
                    Text("show PieChartView")
                }
                .padding()
            }
            Spacer()
            HStack() {
                Spacer()
                if githubRepoListVM.loading {
                    ActivityIndicatorView()
                } else {
                    VStack() {
                        if isShowView {
                            PieChartView(data: [
                                githubRepoListVM.swiftRepoCount,
                                githubRepoListVM.objCRepoCount,
                                githubRepoListVM.kotlinRepoCount
                                ],
                            title: "Number of repositories"
                            )
                            .transition(.customMove(insertionMove: .trailing, removalMove: .leading))
                        } else {
                            Text("swift: \(githubRepoListVM.swiftRepoCount)")
                            Text("objC: \(githubRepoListVM.objCRepoCount)")
                            Text("kotlin: \(githubRepoListVM.kotlinRepoCount)")
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
