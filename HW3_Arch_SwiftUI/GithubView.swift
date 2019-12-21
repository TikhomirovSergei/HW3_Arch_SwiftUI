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
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            HStack() {
                Spacer()
                if githubRepoListVM.loading {
                    ActivityIndicatorView()
                } else {
                    VStack() {
                        PieChartView(data: [
                            githubRepoListVM.swiftRepoCount,
                            githubRepoListVM.objCRepoCount,
                            githubRepoListVM.kotlinRepoCount
                            ],
                            title: "Number of repositories"
                        )
                        Text("swift: \(githubRepoListVM.swiftRepoCount)")
                        Text("objC: \(githubRepoListVM.objCRepoCount)")
                        Text("kotlin: \(githubRepoListVM.kotlinRepoCount)")
                    }
                }
                Spacer()
            }
            Spacer()
        }
    }
}
