//
//  CalendarVars.swift
//  fooood
//
//  Created by Susan Chappuis Hanson on 14/04/2020.
//  Copyright © 2020 Susan Chappuis Hanson. All rights reserved.
//

import Foundation


let date = Date()
let calendar = Calendar.current

let day = calendar.component(.day, from: date)
var weekday = calendar.component(.weekday, from: date) - 1
var month = calendar.component(.month, from: date) - 1
var year = calendar.component(.year, from: date)
