//
//  OverlayView.swift
//  HW3_Arch_SwiftUI
//
//  Created by Сергей on 22/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct OverlayView: View {
    
    @State var isShowViews: Bool = true
    
    var body: some View {
        ScrollView {
            Button(action: {
                AppState.shared.toggleOverlay()
            }) {
                Text("hidden view")
            }
            .padding()
            Toggle(isOn: $isShowViews.animation()) {
                Text("show views")
            }
            VStack {
                if isShowViews {
                    LineChartView(data: Array(Histogram().histogram.values), title: "Histogram")
                        .padding()
                        .transition(.identity)
                        .animation(.easeIn(duration: 1))
                    PieChartView(data: Array(Histogram().histogram.values), title: "Histogram")
                        .padding()
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 1))
                    BarChartView(data: Array(Histogram().histogram.values).reversed(), title: "Histogram")
                        .padding()
                        .transition(.slide)
                        .animation(.easeOut(duration: 1))
                } else {
                    Text("")
                }
            }
            .frame(width: UIScreen.main.bounds.size.width)
        }
    }
}
