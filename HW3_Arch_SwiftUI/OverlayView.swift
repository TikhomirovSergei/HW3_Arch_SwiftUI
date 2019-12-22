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
    var body: some View {
        ScrollView {
            VStack {
                LineChartView(data: Array(Histogram().histogram.values), title: "Histogram", dropShadow: false)
                    .padding()
                    .animation(.easeIn(duration: 1))
                PieChartView(data: Array(Histogram().histogram.values), title: "Histogram", dropShadow: false)
                    .padding()
                    .animation(.easeInOut(duration: 1))
                BarChartView(data: Array(Histogram().histogram.values).reversed(), title: "Histogram", dropShadow: false)
                    .padding()
                    .animation(.easeOut(duration: 1))
            }
            .frame(width: UIScreen.main.bounds.size.width)
        }
        .onTapGesture {
            AppState.shared.toggleOverlay()
        }
        
    }
}
