//
//  Util.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 22/9/17.
//  Copyright © 2017 Marta Roldán Arellano. All rights reserved.
//

import UIKit

extension String {
    func stringToDate() -> Date {
        let stringDate = self
        let stringDateFormat = DateFormatter()
	
	//Aplicamos el formato que queremos
        stringDateFormat.dateFormat = "dd/MM/yyyy"
        let dateFormarted = stringDateFormat.date(from: stringDate)
        return dateFormarted!
    }
}
