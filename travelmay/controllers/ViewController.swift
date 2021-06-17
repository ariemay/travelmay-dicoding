//
//  ViewController.swift
//  travelmay
//
//  Created by Arie May Wibowo on 18/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    var networkProvider: Networkable!
    
    init(networkProvider: Networkable) {
        super.init(nibName: nil, bundle: nil)
        self.networkProvider = networkProvider
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkProvider.getTravelPlaces { results in
            print(type(of: results))
        }
    }


}

