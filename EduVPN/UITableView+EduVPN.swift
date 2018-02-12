//
//  UITableView+EduVPN.swift
//  EduVPN
//
//  Created by Jeroen Leenarts on 29-08-17.
//  Copyright © 2017 SURFNet. All rights reserved.
//

import UIKit

extension UITableView {

    func register<T: Identifyable>(type: T.Type, prefix: String = "") where T: UITableViewCell {
        register(type, forCellReuseIdentifier: prefix + type.identifier)
    }

    func dequeueReusableCell<T: Identifyable>(type: T.Type, for indexPath: IndexPath, prefix: String = "") -> T where T: UITableViewCell {
        return dequeueReusableCell(withIdentifier: prefix + type.identifier, for: indexPath) as! T // swiftlint:disable:this force_cast
    }

    func registerNib<T: Identifyable>(type: T.Type, prefix: String = "") where T: UITableViewCell {
        let nib = UINib(nibName: prefix + type.identifier, bundle: nil)
        register(nib, forCellReuseIdentifier: prefix + type.identifier)
    }

    func registerNib<T: Identifyable>(type: T.Type, prefix: String = "") where T: UITableViewHeaderFooterView {
        let nib = UINib(nibName: prefix + type.identifier, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: prefix + type.identifier)
    }

    func dequeueReusableHeaderFooterView<T: Identifyable>(type: T.Type, prefix: String = "") -> T where T: UITableViewHeaderFooterView {
        return dequeueReusableHeaderFooterView(withIdentifier: prefix + type.identifier) as! T // swiftlint:disable:this force_cast
    }
}
