//
//  HistogramView.swift
//  HW3_Arch_SwiftUI
//
//  Created by Сергей on 21/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct HistogramView: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            HStack() {
                Spacer()
                LineChartView(data: Array(Histogram().histogram.values), title: "Histogram")
                Spacer()
            }
            Spacer()
        }
    }
}
