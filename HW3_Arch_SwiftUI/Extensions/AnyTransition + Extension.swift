//
//  AnyTransition + Extension.swift
//  HW3_Arch_SwiftUI
//
//  Created by Сергей on 23/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static func customMove(insertionMove: Edge, removalMove: Edge) -> AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: insertionMove),
            removal: .move(edge: removalMove))
    }
}
