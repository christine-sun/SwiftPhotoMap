//
//  LocationsViewController.swift
//  SwiftPhotoMap
//
//  Created by JC on 9/23/21.
//

import UIKit

protocol LocationsViewControllerDelegate:AnyObject {
    func locationsViewController(_ controller: LocationsViewController?, didPickLocationWithLatitude latitude: NSNumber?, longitude: NSNumber?)
}

class LocationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    weak var delegate: LocationsViewControllerDelegate?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var results:Array<Any>
    
    private let clientID = "QA1L0Z0ZNA2QVEEDHFPQWK0I5F1DE3GPLSNW4BZEBGJXUCFL"
    private let clientSecret = "W2AOE1TYC4MHK5SZYOUGX0J3LVRALMPB4CXT3ZH21ZCPUMCU"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        // TODO: [self fetchLocationsWithQuery:@"Restaurants" nearCity:@"San Francisco"];
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell

        // TODO: get one element from the "results" array, and pass it to the cell

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let venue = results[indexPath.row] as! [AnyHashable : Any]
        let lat = venue["location.lat"]
        let lng = venue["location.lng"]
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let range2 = text.startIndex..<text.index(after: text.startIndex)
        let newText = searchBar.text?.replacingCharacters(in: range2, with: text)
        
        /*
         let newText = searchBar.text.replacingCharacters(in: range, with: text)
         NSString *newText = [searchBar.text stringByReplacingCharactersInRange:range withString:text];
         [self fetchLocationsWithQuery:newText nearCity:@"San Francisco"];
         return true;
         */
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
