//
//  GitHubRepoListViewModel.swift
//  HW3_Arch_SwiftUI
//
//  Created by Сергей on 21/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI
import GithubAPI

final class GitHubRepoListViewModel: ObservableObject {
    
    private let repositoriesList = ["Swift", "ObjC", "Kotlin"]
    
    @Published private(set) var swiftRepoCount: Int = 0
    @Published private(set) var objCRepoCount: Int = 0
    @Published private(set) var kotlinRepoCount: Int = 0
    
    @Published var loading = false
    
    init() {
        pageLoad()
    }
    
    func pageLoad() {
        guard loading == false else { return }
        
        loading = true
        
        let group = DispatchGroup()
        
        for i in 0..<repositoriesList.count {
            group.enter()
            
            SearchAPI.searchReposGet(q: self.repositoriesList[i], order: .asc) { repositoryList, error in
                
                group.leave()
                guard error == nil else { return }
                
                switch i {
                case 0: self.swiftRepoCount = repositoryList?.totalCount ?? 0
                case 1: self.objCRepoCount = repositoryList?.totalCount ?? 0
                case 2: self.kotlinRepoCount = repositoryList?.totalCount ?? 0
                default: break
                }
            }
        }
        
        group.notify(queue: .main) {
            self.loading = false
        }
    }
}
