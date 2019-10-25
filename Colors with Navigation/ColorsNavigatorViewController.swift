//
//  ColorsNavigatorViewController.swift
//  Colors with Navigation
//
//  Created by Grant Harrison on 10/24/19.
//  Copyright © 2019 Grant Harrison. All rights reserved.
//

import UIKit

class ColorsNavigatorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var colors = [Color(colors: "Red", uiColor: UIColor.red),
                  Color(colors: "Orange", uiColor: UIColor.orange),
                  Color(colors: "Yellow", uiColor: UIColor.yellow),
                  Color(colors: "Green", uiColor: UIColor.green),
                  Color(colors: "Blue", uiColor: UIColor.blue),
                  Color(colors: "Purple", uiColor: UIColor.purple),
                  Color(colors: "Brown", uiColor: UIColor.brown)]

    @IBOutlet weak var colorsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Colors"

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        cell.textLabel?.text = colors[indexPath.row].colors
        
        cell.backgroundColor = colors[indexPath.row].uiColor
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController,
           let row = colorsTableView.indexPathForSelectedRow?.row {
            destination.color = colors[row]
        }
    }

}
