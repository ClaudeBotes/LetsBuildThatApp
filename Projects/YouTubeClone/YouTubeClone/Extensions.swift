//
//  Extensions.swift
//  YouTubeClone
//
//  Created by Claude on 2/7/2017.
//  Copyright © 2017 Claude. All rights reserved.
//

import UIKit

extension UIColor {
    /**
     Returns a UIColor object based on the RGB values passed through.
     
     - Parameter red: Value of red
     - Parameter green: Value of green
     - Parameter blue: Value of blue
     
     - Returns: A UIColor object based on the RGB values passed through
     */
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    
    /**
     Builds a constraint for a provided set of views and adds the constraint to the view.
     
     - Parameter format: Format of the constraint. Example: "H:|-16-[v0]-16-|"
     - Parameter views: An array of views to which the constraint should be applied to.
     */
    func addConstraintWithFormat(format: String, views: UIView...){
        var viewsDictionary = [String:UIView]()
        
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UIImageView {
    
    /**
     Loads an image from a given url string and sets the image of the UIImageView.
     
     - Parameter urlString: The url of where the image is located.
     
     */
    func loadImageUsingUrlString(urlString: String) {
        
        let url = NSURL(string: urlString)
        
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            if error != nil {
                print(error ?? "Error trying to fetch videos image thubnail.")
                return
            }
            // TODO: fix refresh rate of images loaded.
            DispatchQueue.main.async(execute: {
                self.image = UIImage(data: data!)
            })
            
            }.resume()
    }
}
