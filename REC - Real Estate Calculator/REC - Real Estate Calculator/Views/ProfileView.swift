//
//  ProfileView.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/20/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    func loadSelf(superView: UIView, tabBar: UIView) {
        backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        superView.addSubview(self)
        self.anchor(top: superView.topAnchor, leading: superView.leadingAnchor, bottom: tabBar.topAnchor, trailing: superView.trailingAnchor)
    }
}

