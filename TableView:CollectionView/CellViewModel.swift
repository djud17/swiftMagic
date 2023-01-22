//
//  CellViewModel.swift
//  
//
//  Created by Давид Тоноян  on 22.01.2023.
//

import UIKit

// Model for cell, need to create model subscribed to CellViewModel for each type of cell

protocol CellViewAnyModel {
    static var cellAnyType: UIView.Type { get }
    
    func setupAny(cell: UIView)
}

protocol CellViewModel: CellViewAnyModel {
    associatedtype CellType: UIView
    
    func setup(cell: CellType)
}

extension CellViewModel {
    static var cellAnyType: UIView.Type {
        return CellType.self
    }
    
    func setupAny(cell: UIView) {
        guard let cell = cell as? CellType else {
            assertionFailure("Cann`t setup cell")
            return
        }
        
        setup(cell: cell)
    }
}
