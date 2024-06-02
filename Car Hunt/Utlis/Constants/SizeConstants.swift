//
//  SizeConstants.swift
//  Car Hunt
//
//  Created by Preet Pambhar on 2024-06-02.
//

import SwiftUI

struct SizeConstants{
        static var screenCutoff: CGFloat{
            (UIScreen.main.bounds.width / 2) * 0.8
        }
        static var cardWidth: CGFloat {
            UIScreen.main.bounds.width - 20
        }
        static var cardHeight: CGFloat {
            UIScreen.main.bounds.height / 1.45
        }
}
