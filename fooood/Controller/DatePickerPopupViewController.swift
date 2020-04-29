//
//  DatePickerPopupViewController.swift
//  fooood
//
//  Created by Susan Chappuis Hanson on 14/04/2020.
//  Copyright © 2020 Susan Chappuis Hanson. All rights reserved.
//

import UIKit

class DatePickerPopupViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var calendar: UICollectionView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let daysOfMonth = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let daysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth = String()
    
    var numberOfEmptyBoxes = Int() // The number of "empty boxes" at the start of the current month
    var nextNumberOfEmptyBoxes = Int() // The same as above but for the next month
    var previousNumberOfEmptyBoxes = 0 // The same as above but for the previous month
    
    var direction = 0 // Is =0 if we are within the current month, = 1 if we are within a future month, = -1 if we are in a previous month
    var positionIndex = 0 // To store the afore-mentioned vars of the emtpy boxes
    
    var dayCounter = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMonth = months[month]
        
        monthLabel.text = "\(currentMonth)"
        yearLabel.text = "\(year)"
        
        if weekday == 0 {
            weekday = 7
        }
        
        getStartDateDayPosition()
        
    }
    
    @IBAction func next(_ sender: UIButton) {
        
        switch currentMonth {
        case "December":
            month = 0
            year += 1
            direction = 1
            
            getStartDateDayPosition()
            
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth)"
            yearLabel.text = "\(year)"
            
            calendar.reloadData()
            
        default:
            direction = 1
            
            getStartDateDayPosition()
            
            month += 1
            
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth)"
            yearLabel.text = "\(year)"
            
            calendar.reloadData()
        }
        
        print("next button pressed")
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        
        switch currentMonth {
        case "January":
            month = 11
            year -= 1
            direction = -1
            
            getStartDateDayPosition()
            
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth)"
            yearLabel.text = "\(year)"
            
            calendar.reloadData()
            
        default:
            month -= 1
            
            direction = -1
            
            getStartDateDayPosition()
            
            currentMonth = months[month]
            monthLabel.text = "\(currentMonth)"
            yearLabel.text = "\(year)"
            
            calendar.reloadData()
        }
        
        print("back button pressed")
        
    }
    
    
    
    //MARK: - get the Start Date Position methods
    
    func getStartDateDayPosition() {
        
        switch direction {                                                            // This function gives us the number of empty boxes
        case 0:                                                                       // If we are at the current month (case 0)
            numberOfEmptyBoxes = weekday
            dayCounter = day
            while dayCounter > 0 {
                
                numberOfEmptyBoxes = numberOfEmptyBoxes - 1
                dayCounter = dayCounter - 1
                
                if numberOfEmptyBoxes == 0 {
                    
                    numberOfEmptyBoxes = 7
                    
                }
                
            }
            
            if numberOfEmptyBoxes == 7 {
                
                numberOfEmptyBoxes = 0
                
            }
            
            positionIndex = numberOfEmptyBoxes
            
        case 1...:                                                                    // If we are at sa future month
            numberOfEmptyBoxes = (positionIndex + daysInMonth[month])%7
            positionIndex = nextNumberOfEmptyBoxes
            
        case -1:                                                                      // If we are at a previous month
            previousNumberOfEmptyBoxes = (7 - (daysInMonth[month] - positionIndex)%7)
            
            if previousNumberOfEmptyBoxes == 7 {
                
                previousNumberOfEmptyBoxes = 0
                
            }
            
            positionIndex = previousNumberOfEmptyBoxes
            
        default:
            fatalError()
        }
        
    }
    
    
    
    //MARK: - CollectionView DataSource Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch direction {                                                                                      // returns the number of days in the month + the number of "empty boxes" based on the direction we are going in
        case 0:
            return daysInMonth[month] + numberOfEmptyBoxes
        case 1...:
            return daysInMonth[month] + nextNumberOfEmptyBoxes
        case -1:
            return daysInMonth[month] + previousNumberOfEmptyBoxes
        default:
            fatalError()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        
        cell.backgroundColor = UIColor.clear
        
        if cell.isHidden {
            
            cell.isHidden = false
            
        }
        
        switch direction {
        case 0:
            cell.datelabel.text = "\(indexPath.row + 1 - numberOfEmptyBoxes)"
        case 1:
            cell.datelabel.text = "\(indexPath.row + 1 - nextNumberOfEmptyBoxes)"
        case -1:
            cell.datelabel.text = "\(indexPath.row + 1 - previousNumberOfEmptyBoxes)"
        default:
            fatalError()
        }
        
        if Int(cell.datelabel.text!)! < 1 {                                                                 // hides every cell that is smaller than 1
            cell.isHidden = true
        }
        
        // show the weekend days in a different colour
        
        switch indexPath.row {
        case 5, 6, 12, 13, 19, 20, 26, 27, 33, 34:                                                          // the indexes of the collection view that match the weekend days
            if Int(cell.datelabel.text!)! > 0 {
                cell.datelabel.textColor = UIColor.blue
            }
        default:
            break
        }
        
        return cell
        
    }
    
}
