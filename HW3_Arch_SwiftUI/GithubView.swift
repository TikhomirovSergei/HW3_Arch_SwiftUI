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
        VStack {
            if githubRepoListVM.loading {
                ActivityIndicatorView()
            } else {
                PieChartView(data: [
                    githubRepoListVM.swiftRepoCount,
                    githubRepoListVM.objCRepoCount,
                    githubRepoListVM.kotlinRepoCount
                    ],
                    title: "Number of repositories"
                )
                Text("swift repositories: \(githubRepoListVM.swiftRepoCount)")
                Text("objC repositories: \(githubRepoListVM.objCRepoCount)")
                Text("kotlin repositories: \(githubRepoListVM.kotlinRepoCount)")
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 60)
    }
}
