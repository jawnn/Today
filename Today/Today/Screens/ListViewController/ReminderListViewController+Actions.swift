//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Roberto Manese III on 1/9/24.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else {
            return
        }
        completeReminder(withId: id)
    }
}
