//
//  CurrencyDataSource.swift
//  TemplateProject
//
//  Created by Benoit PASQUIER on 24/01/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class CurrencyDataSource : GenericDataSource<CurrencyRate>, UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CurrencyCell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath as IndexPath) as? CurrencyCell else {
            fatalError("CurrencyCell cell is not found")
        }
        let currencyRate = self.data.value[indexPath.row]
        cell.currencyRate = currencyRate
        return cell
    }
}
