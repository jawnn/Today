//
//  DatePickerContentView.swift
//  Today
//
//  Created by Roberto Manese III on 1/10/24.
//

import UIKit

class DatePickerContentView: UIView, UIContentView {
    struct Configuration: UIContentConfiguration {
        var date: Date = .now

        func makeContentView() -> UIView & UIContentView {
            return DatePickerContentView(self)
        }
    }
    var configuration: UIContentConfiguration {
        didSet {
            configuration(configuration: configuration)
        }
    }

    var datePicker = UIDatePicker()

    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubview(datePicker)
        datePicker.preferredDatePickerStyle = .inline
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configuration(configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else {
            return
        }
        datePicker.date = configuration.date
    }

}

extension UICollectionViewListCell {
    func datePickerConfiguration() -> DatePickerContentView.Configuration {
        DatePickerContentView.Configuration()
    }
}

