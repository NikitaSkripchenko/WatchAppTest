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
    var selectedIndex = 0
    @IBOutlet weak var flightTable: WKInterfaceTable!
    var  flights = Flight.allFlights()
  override func didAppear() {
    super.didAppear()
    // 1
    guard flights[selectedIndex].checkedIn,
      let controller = flightTable.rowController(at: selectedIndex) as? FlightRowController else {
        return
    }
    
    // 2
    animate(withDuration: 0.35) {
      // 3
      controller.updateForCheckIn()
    }
  }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        flightTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
      for index in 0..<flightTable.numberOfRows {
        guard let controller = flightTable.rowController(at: index) as? FlightRowController else { continue }
        
        controller.flight = flights[index]
      }
    }
  override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
    let flight = flights[rowIndex]
    let controllers = ["Flight", "CheckIn"]
    selectedIndex = rowIndex
    presentController(withNames: controllers, contexts: [flight, flight])
  }
  
}
