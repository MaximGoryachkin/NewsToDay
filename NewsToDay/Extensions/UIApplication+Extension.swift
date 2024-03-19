//
//  UIApplication+Extension.swift
//  NewsToDay
//
//  Created by Victor on 19.03.2024.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
