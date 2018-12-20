//
//  SearchView.swift
//  REC - Real Estate Calculator
//
//  Created by timofey makhlay on 12/20/18.
//  Copyright © 2018 Timofey Makhlay. All rights reserved.
//

import UIKit

class SearchView: UIView {
    func loadSelf(superView: UIView, tabBar: UIView) {
        backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        superView.addSubview(self)
        self.anchor(top: superView.topAnchor, leading: superView.leadingAnchor, bottom: tabBar.topAnchor, trailing: superView.trailingAnchor)
    }
}
