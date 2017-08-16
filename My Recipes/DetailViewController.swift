//
//  DetailViewController.swift
//  My Recipes
//
//  Created by Jorge Eduardo on 14/08/17.
//  Copyright © 2017 Jorge Eduardo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    var recipe : Recipe!
    var backButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor(red: 0.8 , green: 0.8, blue: 0.8, alpha: 0.25) //provide custom color for table view
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero) //provide a cero hight view to avoid showing empty cells at the end of the table
        
        self.tableView.separatorColor = UIColor(red: 0.4, green: 0.7, blue: 1.0, alpha: 0.5)
        
        
        //this two lines sets the height for each cell according with its content dynamically
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        if let recipeImage = recipe.image{
            self.detailImageView.image = recipeImage
        }
        
        self.title = recipe.name
        // Do any additional setup after loading the view.
        
        backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        backButton.setBackgroundImage(UIImage(named: "rating"), for: .normal)
        backButton.addTarget(self, action: #selector(self.reviewRecipe(_:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: backButton)
        
        
        if let rating = recipe.rating {
            
            if let ratingImage = UIImage(named: rating){
                backButton.setBackgroundImage(ratingImage, for: .normal)
                
            }
            
        }
        
    }
    
    func reviewRecipe(_ sender : UIBarButtonItem) {
        performSegue(withIdentifier: "reviewRecipe", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override var prefersStatusBarHidden: Bool { //to hidde or show status bar
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 3
        case 1:
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemDetailCell", for: indexPath) as! RecipeDetailItemCell
        
        cell.backgroundColor = UIColor.clear //delete any color over the table view
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.keyLabel.text = "Nombre: "
                cell.valueLabel.text = recipe.name
            case 1:
                cell.keyLabel.text = "Tiempo: "
                cell.valueLabel.text = "\(recipe.time!) mins"
            case 2:
                cell.keyLabel.text = "Favorito"
                var isFavoriteText : String = "No"
                if self.recipe.isFavorite{
                    isFavoriteText = "Si"
                }
                cell.valueLabel.text = isFavoriteText
            default:
                break
            }
        case 1:
            cell.keyLabel.text = ""
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
            
        case 2:
            cell.keyLabel.text = ""
            cell.valueLabel.text = self.recipe.steps[indexPath.row]
            
        default:
            break;
        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        
        switch section {
        case 0:
            break
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        default:
            break
        }
        return title
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "reviewRecipe"{
            _ = segue.destination as! ReviewRecipeViewController
        }
    }
    
    
    @IBAction func close (segue : UIStoryboardSegue) {
        
        if let reviewVC = segue.source as? ReviewRecipeViewController {
            
            if let rating = reviewVC.ratingSelected {
                
                if let ratingImage = UIImage(named: rating){
                 self.recipe.rating = rating
                 backButton.setBackgroundImage(ratingImage, for: .normal)
                    
                }
            }
            
        }
        
    }
    
}

extension DetailViewController : UITableViewDelegate {
    
}
