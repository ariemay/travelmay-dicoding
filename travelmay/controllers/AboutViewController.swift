//
//  AboutViewController.swift
//  travelmay
//
//  Created by Arie May Wibowo on 19/06/21.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.image.layer.borderWidth=1.0
        self.image.layer.masksToBounds = false
        self.image.layer.borderColor = UIColor.white.cgColor
        self.image.layer.cornerRadius = image.frame.size.height/2
        self.image.clipsToBounds = true
        
        self.name.text = "ARIE MAY WIBOWO"
        self.name.textColor = UIColor.blue
    }
    

}
