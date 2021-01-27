//
//  Foundation+Extentions.swift
//  FinishTestLayout
//
//  Created by Ragaie Alfy on 1/27/21.
//

import Foundation
import UIKit
extension String{
    func textHeight( width: CGFloat, fontSize: CGFloat) -> CGFloat {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: fontSize)
        ]
        let attributedText = NSAttributedString(string: self, attributes: attributes)
        let constraintBox = CGSize(width: width, height: .greatestFiniteMagnitude)
        let textheight = attributedText.boundingRect(with: constraintBox, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil).height.rounded(.up)

        return textheight
    }
}
