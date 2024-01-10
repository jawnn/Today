//
//  TextViewContentView.swift
//  Today
//
//  Created by Roberto Manese III on 1/10/24.
//

import UIKit

class TextViewContentView: UIView, UIContentView {
    struct Configuration: UIContentConfiguration {
        var text: String? = ""

        func makeContentView() -> UIView & UIContentView {
            return TextViewContentView(self)
        }
    }
    var configuration: UIContentConfiguration {
        didSet {
            configuration(configuration: configuration)
        }
    }

    let textView = UITextView()

    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }

    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubview(textView, height: 200)
        textView.backgroundColor = nil
        textView.font = UIFont.preferredFont(forTextStyle: .body)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configuration(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else {
            return
        }
        textView.text = configuration.text
    }
}

extension UICollectionViewListCell {
    func textViewConfiguration() -> TextViewContentView.Configuration {
        TextViewContentView.Configuration()
    }
}

