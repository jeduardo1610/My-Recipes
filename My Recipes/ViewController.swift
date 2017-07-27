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
        var recipe : Recipe = Recipe(name: "Tortilla de patatas")
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza margarita")
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con queso")
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada Cesar")
        recipes.append(recipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return cell
    }
    
}

