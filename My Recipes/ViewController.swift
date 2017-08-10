//
//  ViewController.swift
//  My Recipes
//
//  Created by Jorge Eduardo on 27/07/17.
//  Copyright © 2017 Jorge Eduardo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var recipe : Recipe = Recipe(name: "Tortilla de patatas", image: #imageLiteral(resourceName: "tortilla"))
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza margarita", image: #imageLiteral(resourceName: "pizza"))
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con queso", image : #imageLiteral(resourceName: "hamburguesa"))
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada Cesar", image : #imageLiteral(resourceName: "ensalada"))
        recipes.append(recipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe: Recipe = recipes[indexPath.row]
        let cellId: String = "recipeCellItem"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image
        
        return cell
    }
    
}

