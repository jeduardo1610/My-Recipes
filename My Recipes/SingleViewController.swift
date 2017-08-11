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

        var recipe : Recipe = Recipe(name: "Tortilla de patatas",
                                     image: #imageLiteral(resourceName: "tortilla"),
                                     time : 20,
                                     ingredients : ["Patata", "Huevos", "Cebolla"],
                                     steps : ["Pelar las patatas y la cebolla",
                                              "Cortar las patatas y la cebolla y sofreir",
                                              "Batir los huevos y echarlos 1 minuto a la sarten con el resto de ingredientes"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza margarita",
                        image: #imageLiteral(resourceName: "pizza"),
                        time: 60,
                        ingredients : ["Harina", "Levadura", "Aceite", "Sal", "Salsa de tomate", "Queso"],
                        steps : ["Preparar la masa con harina, levadura, aceite y sal",
                                 "Dejamos reposar la masa por 30 min",
                                 "Extendemos la masa encima de una bandeja y añadimos el resto de igredientes",
                                 "Hornear durante 12 minutos"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con queso",
                        image : #imageLiteral(resourceName: "hamburguesa"),
                        time : 10,
                        ingredients : ["Pan de hamburguesa", "Lechuga", "Tomate", "Queso", "Carne de hamburguesa"],
                        steps : ["Poner al fuego la carne al gusto",
                                 "Montar la hamburguesa con sus ingredientes entre los panes"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada Cesar",
                        image : #imageLiteral(resourceName: "ensalada"),
                        time : 15,
                        ingredients : ["Lechuga", "Tomate", "Cebolla", "Pimiento", "Salsa Cesar", "Pollo"],
                        steps : ["Limpiar todas las verduras y trocearlas",
                                 "Cocer el pollo al gusto",
                                 "Juntar todos los ingredientes en un tazon y acompañar con salsa Cesar"])
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FullRecipeItemCell
        
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        
        return cell
    }
    
    
 }
