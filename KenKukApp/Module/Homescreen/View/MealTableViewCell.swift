//
//  MealTableViewCell.swift
//  KenKukApp
//
//  Created by Bayu Aslama  on 18/07/21.
//

import UIKit
import SDWebImage

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var arrowView: UIView!{
        didSet {
            arrowView.layer.cornerRadius = 9
        }
    }
    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.containerView.layer.cornerRadius = 15

            self.containerView.layer.shadowColor = UIColor(red: 0.353, green: 0.424, blue: 0.918, alpha: 0.07).cgColor
            self.containerView.layer.shadowOpacity = 1
            self.containerView.layer.shadowOffset = CGSize(width: 12, height: 26)
            self.containerView.layer.shadowRadius = 50
            self.containerView.layer.shadowPath = UIBezierPath(roundedRect: self.containerView.bounds, cornerRadius: 28).cgPath
            self.containerView.clipsToBounds = false
        }
    }
    @IBOutlet weak var mealImageView: UIImageView!{
        didSet{
            mealImageView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    func setCell(_ meal: MealItem){
        
        self.selectionStyle = .none
        areaLabel.text = meal.strArea
        categoryLabel.text = meal.strCategory
        nameLabel.text = meal.strMeal
        mealImageView.sd_setImage(with: URL(string: meal.strMealThumb!), completed: .none)
    }
    
}
