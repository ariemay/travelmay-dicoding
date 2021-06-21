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
    @IBOutlet weak var rateDetail: UILabel!
    
    let scrollView = UIScrollView()
    let descriptionView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.data?.name
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.backgroundColor = UIColor.white
        
        self.imageDetail?.loading.start(.system(UIActivityIndicatorView.Style.medium))
        let url = URL(string: data?.image ?? "")
            if url != nil {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url!)
                    DispatchQueue.main.async {
                        if data != nil {
                            self.imageDetail?.image = UIImage(data:data!)
                            self.imageDetail?.contentMode = UIView.ContentMode.scaleAspectFill
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
        self.descriptionDetail?.text = data!.description
        self.rateDetail.text = "Like: \(String(describing: data!.like))"
        self.rateDetail.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        self.rateDetail.textColor = UIColor.red

        setupScrollView()
        setupViews()
    }
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(descriptionView)
            
        scrollView.topAnchor.constraint(equalTo: rateDetail.bottomAnchor, constant: 10).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2).isActive = true
            
        descriptionView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        descriptionView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        descriptionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 20).isActive = true
        descriptionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 1.5).isActive = true
    
    }
    
    func setupViews(){
        descriptionView.addSubview(descriptionLabel)
        descriptionLabel.centerXAnchor.constraint(equalTo: descriptionView.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: descriptionView.widthAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor).isActive = true
        
        descriptionLabel.text = data?.description
    
    }
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


}
