//
//  ScheduleInterfaceController.swift
//  FitFirst Extension
//
//  Created by Nikita Skrypchenko  on 9/25/18.
//  Copyright © 2018 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var flightTable: WKInterfaceTable!
    var  flights = Flight.allFlights()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        flightTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
      for index in 0..<flightTable.numberOfRows {
        guard let controller = flightTable.rowController(at: index) as? FlightRowController else { continue }
        
        controller.flight = flights[index]
      }
    }
  
}
