//
//  DataSource.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 21/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

// Dos funciones que devuelven las DataSources que necesitamos: Houses & Persons
// La clase DataSources existe simplemente para agrupar dichas funciones
final class DataSources{
    static func housesDataSource(model: [House]) -> ArrayDataSource<House>{
        return ArrayDataSource(model: model) { (house:House, tableView: UITableView) -> UITableViewCell in
            let cellID = "House"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            return cell!
        }
    }
    static func personsDataSource(model: [Person]) -> ArrayDataSource<Person>{
        return ArrayDataSource(model: model) { (person:Person, tableView: UITableView) -> UITableViewCell in
            let cellID = "Person"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            cell?.textLabel?.text = person.fullName
            return cell!
        }
    }
}

