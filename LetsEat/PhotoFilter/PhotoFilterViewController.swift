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
    
    func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 7
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func checkSource (){
        let cameraMediaType = AVMediaType.video
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)
        switch cameraAuthorizationStatus {
        case .authorized:
            self.showCameraUserInterface()
        case .restricted, .denied:
            break
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: cameraMediaType) { granted in
                if granted {
                    DispatchQueue.main.async {
                        self.showCameraUserInterface()
                    }
                }
            }
        }
    }
    
    func showApplyFilter() {
        manager.fetch { (items) in
            filters = items
            if let image = self.image {
                imgExample.image = image
                collectionView.reloadData()
            }
        }
    }
    @IBAction func onPhotoTapped(_ sender: Any) {
        checkSource()
    }
}

extension PhotoFilterViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filterCell", for: indexPath) as! FilterCell
        let item = self.filters[indexPath.row]
        if let img = self.thumbnail {
            cell.set(image: img, item: item)
        }
        return cell
    }
}

extension PhotoFilterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenRect = collectionView.frame.size.height
        let screenHt = screenRect - 14
        return CGSize(width: 150, height: screenHt)
    }
}
