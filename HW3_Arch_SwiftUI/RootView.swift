//
//  ContentView.swift
//  HW3_Arch_SwiftUI
//
//  Created by Сергей on 20/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    @State private var pickerSelection: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Picker(selection: $pickerSelection, label: Text("NetworkApi")) {
                Text("GitHubAPI").tag(0)
                Text("RickAndMortiAPI").tag(1)
                Text("Histogram").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if pickerSelection == 0 {
                GithubView().environmentObject(GitHubRepoListViewModel())
            } else if pickerSelection == 1 {
                RickAndMortiView().environmentObject(RAMCharacterStatusListViewModel())
            } else {
                HistogramView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
