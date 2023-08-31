//
//  ViewController.swift
//  EskomSePushloadshedding
//
//  Created by Nomcebo Duma on 2023/04/05.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var areas: [Area]?
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.register(SimpleTableViewControllerCellTableViewCell.self, forCellReuseIdentifier: SimpleTableViewControllerCellTableViewCell.identifier)
        tableView.register(SimpleTableViewCell.self, forCellReuseIdentifier: SimpleTableViewCell.identifier)
        tableView.register(ImageTableViewCell.nib(), forCellReuseIdentifier:  ImageTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)

       

        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        header.imageView1.image = UIImage(named:"launch2")

        let label = UILabel(frame: header.bounds)
        label.text = "Stage:"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        header.addSubview(label)
    

        label.translatesAutoresizingMaskIntoConstraints = false

      
        NSLayoutConstraint.activate([

            label.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -16),
            label.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -10)
        ])
        
        let label2 = UILabel(frame: header.bounds)
        label2.text = "ESKOMSEPUSH"
        label2.textAlignment = .center
        label2.font = UIFont.boldSystemFont(ofSize: 20)
        label2.textColor = UIColor.red
        header.addSubview(label2)

        label2.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label2.topAnchor.constraint(equalTo: header.topAnchor, constant: 8),
            label2.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
            label2.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -16),
        ])


        tableView.tableHeaderView = header
    }
        
        override func viewDidLayoutSubviews(){
            super.viewDidLayoutSubviews()
            tableView.frame = view.bounds
            
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Area:\(section)"
        }
        
        
        func numberOfSections(in tableView:UITableView) -> Int {
            return 6
        }
        
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            
            
        }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return areas?.count ?? 0
    }



        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SimpleTableViewControllerCellTableViewCell.self), for: indexPath) as? SimpleTableViewControllerCellTableViewCell
            
            
            let area = areas![indexPath.row]
            
            let areaName = areas!.first!.name
    
            cell?.AreaLabel.text = areas!.first!.name
            cell?.textLabel?.text = ""
            cell?.backgroundColor  = .lightGray
            cell?.accessoryType = .disclosureIndicator
            
            return cell ?? UITableViewCell()
        }
        
        
        
    }
    
    

    

        
    
    
    

        
       
