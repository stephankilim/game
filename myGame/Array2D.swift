//
//  Array2D.swift
//  myGame
//
//  Created by UCode on 1/26/18.
//  Copyright © 2018 UCode. All rights reserved.
//

// #1
class Array2D<T> {
    var columns: Int = 0

    var rows: Int = 0

    // #2
    
    var array: Array<T?> = []
    
    init(columns: Int, rows: Int) {
    
    self.columns = columns
    self.rows = rows
    
        //#3
    
        array = Array<T?>(repeating: nil, count: rows * columns)
    
    
    
    }
    // #4
    subscript(column: Int, row: Int) -> T? {
        get {
            return array [(row * columns) + column]
        }
        set(newValue) {
            array[(row * columns) + column] = newValue
        }
    }
}
