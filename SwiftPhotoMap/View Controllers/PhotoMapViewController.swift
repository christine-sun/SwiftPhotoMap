//
//  PhotoMapViewController.swift
//  SwiftPhotoMap
//
//  Created by JC on 9/23/21.
//

import UIKit
import MapKit

class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var thisImage:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the map view to show Princeton University region
        let princetonRegion = MKCoordinateRegion(center:CLLocationCoordinate2DMake(40.3431, -74.6551), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView?.setRegion(princetonRegion, animated: false)
    }
    
    @IBAction func onTapCamera(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = .photoLibrary
        self.present(vc, animated: true, completion: nil)
    }
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let originalImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let editedImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        
        // Do something with the images (based on your use case)
        thisImage = editedImage
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "tagSegue", sender: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "tagSegue" {
            let vc = segue.destination as? LocationsViewController
//            vc?.delegate = self
        }
    }

}
