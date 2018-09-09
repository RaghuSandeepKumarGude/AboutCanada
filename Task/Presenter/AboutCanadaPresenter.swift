//
//  AboutCanadaPresenter.swift
//  Task
//
//  Created by Harshavardhana Reddy on 09/09/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import Foundation

class AboutCanadaPresenter: AboutCanadaPresenterable {
    weak var view: ViewController?
    var model: AboutCanadaModel?
    
    init(view: ViewController, model: AboutCanadaModel) {
        self.view = view
        self.model = model
    }
    
    func fetchDetailsAboutCanada() {
        self.model?.fetchUpdatedDetailsAboutCanada { fetchedData, err in
            guard err == nil else {
                self.view?.showError(error: err.debugDescription)
                return
            }
            self.view?.updateView(updatedData: fetchedData!)
        }
    }
}

