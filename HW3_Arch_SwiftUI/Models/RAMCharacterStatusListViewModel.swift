//
//  RAMCharacterStatusListViewModel.swift
//  HW3_Arch_SwiftUI
//
//  Created by Сергей on 21/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI

final class RAMCharacterStatusListViewModel: ObservableObject {
    
    private let statusList: [Status] = [.alive, .dead, .unknown]
    
    @Published private(set) var aliveCount: Int = 0
    @Published private(set) var deadCount: Int = 0
    @Published private(set) var unknownCount: Int = 0
    
    @Published var loading = false
    
    init() {
        pageLoad()
    }
    
    func pageLoad() {
        guard loading == false else { return }
        
        loading = true
        
        let group = DispatchGroup()
        
        for status in statusList {
            group.enter()
            
            StatusAPI.callGet(status: status) { personList, error in
                
                group.leave()
                guard error == nil else { return }
                
                let count = personList?.info?.count ?? 0
                
                switch status {
                case .alive: self.aliveCount = count
                case .dead: self.deadCount = count
                case .unknown: self.unknownCount = count
                }
            }
        }
        
        group.notify(queue: .main) {
            self.loading = false
        }
    }
}
