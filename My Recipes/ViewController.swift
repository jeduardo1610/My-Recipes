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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RecipeCellItem
        
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "\(recipe.time!) min"
        cell.ingredientsLabel.text = "Ingredientes (\(recipe.ingredients.count))"
        
        if recipe.isFavorite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        //rounded image view -> that easy...?
        /*
         you can do this also in the storyboard by adding untime attributes for imageView
         1.- layer.conerRadius at identity inspector
         2.- enable "Clip to bounds" at attribute inspector
         */
        /*cell.thumbnailImageView.layer.cornerRadius = 42.0
        cell.thumbnailImageView.clipsToBounds = true
        */
        return cell
    }
    
    //to add delete functionality
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            self.recipes.remove(at: indexPath.row)
            //self.tableView.reloadData() //this will reload the whole data for table view
            self.tableView.deleteRows(at: [indexPath], with: .fade) //this will remove the item at the exact position given for indexPath ,this may result more efficient when working with a large range of data source
            
        }
        
    }
    
    //MARK: -UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let recipe = recipes[indexPath.row]
        
        let alertController = UIAlertController(title: recipe.name, message: "Valora este platillo", preferredStyle: .actionSheet) //.alert to show it as alert dialog
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        var favoriteActionTitle : String = "Me gusta"
        var alertActionStyle : UIAlertActionStyle = .default
        if recipe.isFavorite {
         favoriteActionTitle = "No me gusta"
            alertActionStyle = .destructive
        }
        
        let favoriteAction = UIAlertAction(title: favoriteActionTitle, style: alertActionStyle) { (action) in
            
            let recipe = self.recipes[indexPath.row]
            recipe.isFavorite = !recipe.isFavorite
            self.tableView.reloadData()//refresh the whole tableView
            
        }
        
        alertController.addAction(favoriteAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
}

