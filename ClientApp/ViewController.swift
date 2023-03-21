//
//  ViewController.swift
//  ClientApp
//
//  Created by Vardhan Chopada on 3/20/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var numberOfRows: Int?
    var videoURL: URL?
    @IBOutlet weak var tableView: UITableView!
    static var tbv: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewController.tbv = self.tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        DataFetch.fetchData {
            self.numberOfRows = DataFetch.dataModels[0].content.count + 1
            self.tableView.reloadData()
           }
        
       
        
        tableView.register(UINib(nibName: "VideoTableViewCell", bundle: nil), forCellReuseIdentifier: "VideoCell")
        tableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoCell")
        tableView.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "DataCell")
        tableView.separatorColor = .white
       
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numberOfRows ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as? VideoTableViewCell
            cell?.selectionStyle = .none
            
            return cell!
        }
        
        else if indexPath.row % 2 == 1
        {
            let cell = (tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as? DataTableViewCell)!
            cell.selectionStyle = .none
            
            DataFetch.fetchData {
                let title = DataFetch.dataModels[0].content[indexPath.row-1].title
                cell.title.text = title
        
                let imageURL = DataFetch.dataModels[0].content[indexPath.row-1].imageURL
                cell.desImage.loadFrom(URLAddress: imageURL)
                let description = DataFetch.dataModels[0].content[indexPath.row-1].description
                cell.des.text = description
                if indexPath.row % 2 == 1 {
                    let backcolor = DataFetch.dataModels[0].content[indexPath.row-1].backgroundColor
                    cell.backgroundColor = UIColor(named: backcolor)
                } else {
                    cell.backgroundColor = .secondarySystemBackground
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
               
            }
            
            return cell
        } else {
           
            let cell = (tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? InfoTableViewCell)!
            cell.selectionStyle = .none
                DataFetch.fetchData {
                    let title = DataFetch.dataModels[0].content[indexPath.row-1].title
                    cell.title.text = title
            
                    let imageURL = DataFetch.dataModels[0].content[indexPath.row-1].imageURL
                    cell.desImage.loadFrom(URLAddress: imageURL)
                    let description = DataFetch.dataModels[0].content[indexPath.row-1].description
                    cell.des.text = description
                    if indexPath.row % 2 == 1 {
                        let backcolor = DataFetch.dataModels[0].content[indexPath.row-1].backgroundColor
                        cell.backgroundColor = UIColor(named: backcolor)
                    } else {
                        cell.backgroundColor = .secondarySystemBackground
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                   
                }
                
                return cell
            }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension

    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }


}

