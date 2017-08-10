 //
//  SingleViewController.swift
//  My Recipes
//
//  Created by Jorge Eduardo on 10/08/17.
//  Copyright © 2017 Jorge Eduardo. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {

    var recipes : [Recipe] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*self.tableView.dataSource = self
        self.tableView.delegate = self*/

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

}
 
 //You can also add this on the class header as follows
 // class SingleViewController : UIViewController, UITableViewDataSources...
 extension SingleViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe: Recipe = recipes[indexPath.row]
        let cellId: String = "recipeCellItem"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image
        
        return cell
    }
    
    
 }
