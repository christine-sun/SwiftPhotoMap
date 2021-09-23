//
//  PhotoMapViewController.swift
//  SwiftPhotoMap
//
//  Created by JC on 9/23/21.
//

import UIKit
import MapKit

class PhotoMapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the map view to show Princeton University region
        let princetonRegion = MKCoordinateRegion(center:CLLocationCoordinate2DMake(40.3431, -74.6551), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView?.setRegion(princetonRegion, animated: false)
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
