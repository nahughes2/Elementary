//
//  Element.swift
//  Elementary!
//
//  Created by Nathan Hughes on 3/5/22.
//

import Foundation

struct ElementList: Decodable {
    var lowWeight: [Element]
    var highWeight: [Element]
}

struct Element: Decodable {
    var atomicNumber = ""
    var name = ""
    
    var cpkHexColor = ""
    
    var atomicMass = ""
    var boilingPoint = ""
    var symbol = ""
    var history = ""
    var standardState = ""
}
