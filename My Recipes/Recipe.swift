//
//  Recipe.swift
//  My Recipes
//
//  Created by Jorge Eduardo on 27/07/17.
//  Copyright © 2017 Jorge Eduardo. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    var name: String!
    var image: UIImage!
    var time: Int!
    var ingredients : [String]!
    var steps: [String]!
    var isFavorite : Bool = false
    var rating : String?
    
    init(name : String, image : UIImage, time : Int,
         ingredients : [String], steps : [String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }
}
