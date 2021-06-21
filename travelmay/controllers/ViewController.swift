//
//  ViewController.swift
//  travelmay
//
//  Created by Arie May Wibowo on 18/06/21.
//

import UIKit
import Loading

class ViewController: UIViewController {
    
    let provider = NetworkManager()
    var networkProvider: Networkable!
    
    @IBOutlet weak var wisataTV: UITableView!
    
    var data = [Wisata]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Home"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.loading.start(.circle(line: .blue, line: 3.0))
        self.networkProvider = provider
        networkProvider.getTravelPlaces(completion: { results in
            self.data = results
            self.wisataTV.reloadData()
            self.view.loading.stop()
        },
        sendError: { error in
            let alert = UIAlertController(title: "Getting List Error", message: "You're not connected to internet cuy", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.view.loading.stop()
        })
        
        self.registerTableViewCells()
        
        self.wisataTV.dataSource = self
        self.wisataTV.delegate = self
        
        wisataTV.contentInset = UIEdgeInsets(top: 0,left: 0,bottom: 50,right: 0)
    }

    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "CustomTableViewCell",
                                  bundle: nil)
        self.wisataTV.register(textFieldCell,
                                forCellReuseIdentifier: "CustomTableViewCell")
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.data.count)
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = wisataTV.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        cell.imageWisata.loading.start(.system(UIActivityIndicatorView.Style.medium))
        let url = URL(string: data[indexPath.row].image)
            if url != nil {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url!)
                    DispatchQueue.main.async {
                        if data != nil {
                            cell.imageWisata.image = UIImage(data:data!)
                            cell.clipsToBounds = true
                            if cell.imageWisata.image != nil {
                                cell.imageWisata.loading.stop()
                            }
                        }
                    }
                }
            }
        cell.titleLabel.text = self.data[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = (self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController"))! as! DetailViewController
        detailVC.delegate = self
        detailVC.data = data[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

enum WisataError: Error {
    case nodata
}
