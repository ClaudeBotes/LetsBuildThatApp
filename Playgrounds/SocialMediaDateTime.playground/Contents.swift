//: Playground - noun: a place where people can play

import UIKit

extension Date {
    func timeAgoDisplay() -> String {
        
        let secondsAgo = Int(Date().timeIntervalSince(self))
        var displayValue = ""
        var numberValue = 0
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let year = 52 * week
        
        func formattedTimeAgoDisplay(seconds: Int, displayUnit: String) -> String {
            
            let lastCharacterOfDisplayUnit = displayUnit.characters.last!
            var singularUnit = ""
            var pluralUnit = ""
            
            // This check can be simpliefied, but leaving it in so that
            // if a developer can pass in singular or plural and the function will still work.
            if(lastCharacterOfDisplayUnit == "s"){
                pluralUnit = displayUnit
                singularUnit = String(displayUnit.characters.dropLast(1))
                
            }else{
                pluralUnit = displayUnit + "s"
                singularUnit = displayUnit
            }
            
            if(seconds > 1){
                return "\(seconds) \(pluralUnit) ago"
            }else{
                return "\(seconds) \(singularUnit) ago"
            }
        }
        
        switch secondsAgo {
        case let seconds where seconds < minute:
            return formattedTimeAgoDisplay(seconds: seconds, displayUnit: "seconds")
            
        case var seconds where seconds < hour:
            seconds = seconds / minute
            return formattedTimeAgoDisplay(seconds: seconds, displayUnit: "minutes")
            
        case var seconds where seconds < day:
            seconds = seconds / hour
            return formattedTimeAgoDisplay(seconds: seconds, displayUnit: "hours")
            
        case var seconds where seconds < week:
            seconds = seconds / day
            return formattedTimeAgoDisplay(seconds: seconds, displayUnit: "days")
            
        case var seconds where seconds < year:
            seconds = seconds / week
            return formattedTimeAgoDisplay(seconds: seconds, displayUnit: "weeks")
            
        default:
            return formattedTimeAgoDisplay(seconds: secondsAgo, displayUnit: "years")
        }
        
        return displayValue
    }
}

let now = Date()

// Testing values
// happend six seconds ago = -6
// happend one minute ago = -65
// happend one hour ago = -60 * 60, two hours ago = -60 * 120
// happend one day ago = -60 * 60 * 24, two days ago = -60 * 60 * 48
// happend one week ago = -60 * 60 * 24 * 7, two weeks ago =

let pastDate = Date(timeIntervalSinceNow: -1)

pastDate.timeAgoDisplay()
