//
//  UIRoundButton.swift
//  lunchRoulette
//
//  Created by 최혜린 on 2021/04/13.
//

import UIKit

class UIRoundButton: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 25.0
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.borderWidth = 4.0
    }
}

class UITitleLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.font = UIFont(name: "UhBee Se_hyun", size: 28)
        self.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
