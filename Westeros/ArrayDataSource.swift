//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Marta Roldán Arellano on 21/9/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

// Tiene que descender de NSObject para aprovechar todos
// los métodos propios de NSObject que el protocolo
// UITableViewDataSource requiere.
class ArrayDataSource <Element>: NSObject, UITableViewDataSource{
    // Tipo que define una clausura que recibe un Elemento
    // (Person, House, etc) que necesita para configurar una celda,
    // una tabla (la necesita para re-aprovechar celdas) y que devuelve
    // una celda plenamente configurada
    typealias CellMaker = (Element, UITableView)->UITableViewCell
    private let _model : [Element]
    private let _cellMaker : CellMaker
    init(model: [Element], cellMaker: @escaping CellMaker) {
        _model = model
        _cellMaker = cellMaker
    }
    // Función que devuelve el elemento del array según el
    // indexpath.
    func element(atIndexPath indexPath: IndexPath)->Element{
        return _model[indexPath.row]
    }
    // Todo el resto son métodos del datasource.
    // Se podrían implementar más.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:
        Int) -> Int {
        return _model.count
    }
    // Este es el método clave: obtiene el elemento y llama a la clausura
    // que se encarga de crear la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        let elt = element(atIndexPath: indexPath)
        return _cellMaker(elt, tableView)
    }
}
