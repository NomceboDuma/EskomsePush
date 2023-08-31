//
//  ViewController2.swift
//  EskomSePushloadshedding
//
//  Created by Nomcebo Duma on 2023/04/13.
//

import UIKit

class ViewController2: UIViewController {
    enum Regional: String, Codable {
        case eskomDirectCityOfJohannesburgGauteng = "Eskom Direct, City of Johannesburg, Gauteng"
    }
    
    
    
    var  areas: [Area]?
    
    @IBOutlet weak var AddButton: UIButton!
    
    @IBOutlet var search: UIView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        func fetchData() {
            
            
            //                networkmanager.shared.getAreas(searchText: "Pretoria") { [ weak self ] areaSearch, error in
            //                    guard let areaSearch = areaSearch  else { return }
            //                    self?.areas = areaSearch.Areas ?? []
            //                    self?.tableView.reloadData()
            //
            //                }
            //            }
            //
            
            
        }
    }
}
