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
    var recipe : Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let recipeImage = recipe.image{
            self.detailImageView.image = recipeImage
        }
        
        // Do any additional setup after loading the view.
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
