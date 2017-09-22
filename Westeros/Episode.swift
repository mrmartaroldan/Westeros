//
//  Episode.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 22/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

typealias Title = String
typealias Image = UIImage

final class Episode {
    
    let title    : Title
    let emissionDate: Date
    weak var season: Season?
    let image: Image?
    
    init(title: Title, emissionDate: Date, season: Season, image: Image?=nil) {
        (self.title, self.emissionDate, self.season) = (title, emissionDate, season)
        self.image = image
    }
    
}

extension Episode{
    var _proxyForComparison : String{
        return "\(title) \(emissionDate)"
    }
}


extension Episode : CustomStringConvertible{
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es_ES")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return "\(title). Premiere: \(dateFormatter.string(from: emissionDate))"
    }
    
}

extension Episode : Equatable{
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return (lhs._proxyForComparison == rhs._proxyForComparison)
    }
}

extension Episode: Hashable {
    public var hashValue: Int {
        get {
            return _proxyForComparison.hashValue
        }
    }
}

extension Episode: Comparable {
    public static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.emissionDate < rhs.emissionDate
    }
}
