//
//  Food.swift
//  AnimatedCarouselSlide
//
//  Created by Quang Bao on 30/12/2021.
//

import SwiftUI

struct Food: Identifiable {
    
    var id = UUID().uuidString
    var itemImage: String
    var itemTitle: String
}

var foods = [
    
    Food(itemImage: "BuffaloChickenBites", itemTitle: "Buffalo Chicken Bites"),
    Food(itemImage: "CakePop", itemTitle: "Cake Pop"),
    Food(itemImage: "CaramelCinnamon", itemTitle: "Caramel Cinnamon"),
    Food(itemImage: "LemonPoppyseed", itemTitle: "Lemon Poppyseed")
    
]
