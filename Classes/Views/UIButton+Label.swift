//
//  UIButton+Label.swift
//  Freetime
//
//  Created by Ryan Nystrom on 6/8/17.
//  Copyright © 2017 Ryan Nystrom. All rights reserved.
//

import UIKit

extension UIButton {

    enum State {
        case merged
        case closed
        case open
        case locked
        case unlocked
    }

    func setupAsLabel() {
        accessibilityTraits = UIAccessibilityTraitNone
        tintColor = .white
        titleLabel?.font = Styles.Fonts.smallTitle
        layer.cornerRadius = Styles.Sizes.avatarCornerRadius
        clipsToBounds = true
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -Styles.Sizes.columnSpacing, bottom: 0, right: 0)
        contentEdgeInsets = UIEdgeInsets(top: 2, left: Styles.Sizes.columnSpacing + 2, bottom: 2, right: 4)
    }

    func config(pullRequest: Bool, state: State) {

        let prName = "git-pull-request-small"

        let icon: String
        let color: UIColor

        switch state {
        case .closed:
            icon = pullRequest ? prName : "issue-closed-small"
            color = Styles.Colors.red.color
        case .open:
            icon = pullRequest ? prName : "issue-opened-small"
            color = Styles.Colors.green.color
        case .merged:
            icon = "git-merge-small"
            color = Styles.Colors.purple.color
        case .locked:
            icon = "lock-small"
            color = Styles.Colors.Gray.dark.color
        case .unlocked:
            icon = "key-small"
            color = Styles.Colors.Gray.dark.color
        }
        setImage(UIImage(named: icon)?.withRenderingMode(.alwaysTemplate), for: .normal)
        backgroundColor = color
    }

}
