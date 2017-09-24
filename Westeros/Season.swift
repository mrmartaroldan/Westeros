//
//  Season.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 22/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

typealias Episodes = Set<Episode>

final class Season {

	let name : String
	let releaseDate : Date
	var _episodes : Episodes
	
	init(name: String, releaseDate: Date) {
        (self.name, self.releaseDate) = (name, releaseDate)
        _episodes = Episodes()
    }
    
    func sortedEpisodes() -> [Episode] {
        let episodes: [Episode] = Array(_episodes)
        return episodes.sorted()
    }
}

extension Season {

    var count: Int {
        return _episodes.count
    }

    func add(episode: Episode){
        guard episode.season?.name == self.name else{
            return
        }
        
        _episodes.insert(episode)
    }
    
    func add(episodes: Episode...){
        _episodes = _episodes.union(episodes.filter{$0.season == self})
    }
}

extension Season{
    var _proxyForComparison : String{
        return "\(name) \(releaseDate)"
    }
}

extension Season : CustomStringConvertible{
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return "\(name). Start: \(dateFormatter.string(from: releaseDate))"
    }
}

extension Season : Equatable{
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return (lhs._proxyForComparison == rhs._proxyForComparison)
    }
}

extension Season: Hashable {
    
    public var hashValue: Int {
        get {
            return _proxyForComparison.hashValue
        }
    }
}

extension Season: Comparable {
    
    public static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.releaseDate < rhs.releaseDate
    }
}

