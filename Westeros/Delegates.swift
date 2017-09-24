//
//  Delegate.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 21/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

    
class BaseViewControllerDelegate<Element>: NSObject {
    var source: ArrayDataSource<Element>?
    weak var viewController: UIViewController?
}
final class GreatHousesDelegate: BaseViewControllerDelegate<House>, UITableViewDelegate {
        
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let house = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController {
            
            let vc = HouseViewController(model: house)
            nav.pushViewController(vc, animated: true)
        }
    }
}

final class SeasonsDelegate: BaseViewControllerDelegate<Season>, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let season = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController {
            
            let dataSource = DataSources.episodesDataSource(model: season.sortedEpisodes())
            let vc = ArrayTableViewController(arrayDataSource: dataSource,
                                              title: "Episodes",
                                              style: .plain,
                                              delegate: EpisodesDelegate())

            nav.pushViewController(vc, animated: true)
        }
    }
}

final class EpisodesDelegate: BaseViewControllerDelegate<Episode>, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let episode = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController {
            
            let vc = EpisodeViewController(model: episode)
            nav.pushViewController(vc, animated: true)
        }
    }
}
 
