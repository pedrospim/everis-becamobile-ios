//
//  ViewConfiguration.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 12/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

protocol ViewConfiguration: class {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() { }
}
