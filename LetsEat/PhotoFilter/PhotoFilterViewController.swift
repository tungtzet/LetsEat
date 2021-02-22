//
//  PhotoFilterViewController.swift
//  LetsEat
//
//  Created by Michael Nguyen on 22.02.21.
//

import UIKit
import AVFoundation
import CoreServices

class PhotoFilterViewController: UIViewController {
    var image: UIImage?
    var thumbnail: UIImage?
    let manager = FilterManager()
    var selectedRestaurantID:Int?
    var filters:[FilterItem] = []
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var imgExample: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - Private Extension
private extension PhotoFilterViewController {
    func initialize() {
        setupCollectionView()
        checkSource()
    }
    
    
}
