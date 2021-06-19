//
//  DetailViewController.swift
//  travelmay
//
//  Created by Arie May Wibowo on 18/06/21.
//

import UIKit
import Loading

class DetailViewController: UIViewController {
    
    weak var delegate: ViewController?
    
    var data: Wisata?
    
    @IBOutlet weak var imageDetail: UIImageView?
    @IBOutlet weak var descriptionDetail: UILabel?
    @IBOutlet weak var addressDetail: UILabel!
    @IBOutlet weak var longDetail: UILabel!
    @IBOutlet weak var latDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.data?.name
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.backgroundColor = UIColor.white
        self.descriptionDetail?.text = "heloo"
        
        self.imageDetail?.loading.start(.system(UIActivityIndicatorView.Style.medium))
        let url = URL(string: data?.image ?? "")
            if url != nil {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url!)
                    DispatchQueue.main.async {
                        if data != nil {
                            self.imageDetail?.image = UIImage(data:data!)
                            self.imageDetail?.contentMode = UIView.ContentMode.scaleToFill
                            if self.imageDetail?.image != nil {
                                self.imageDetail?.loading.stop()
                            }
                        }
                    }
                }
            }
        self.addressDetail.text = data?.address
        self.longDetail.text = String(describing: data!.longitude) as String
        self.latDetail.text = String(describing: data!.latitude) as String
        self.descriptionDetail?.text = data?.description

    }


}
