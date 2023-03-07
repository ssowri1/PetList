//
//  DataConfigurator.swift
//  PetList
//
//  Created by Sowrirajan S on 07/03/23.
//

import Foundation

class DateConfigurator {
    
    typealias DaysFormat = [Days: (Int, Int)]

    enum Days: Int, CaseIterable {
        case Sun = 1
        case Mon = 2
        case Tue = 3
        case Wed = 4
        case Thu = 5
        case Fri = 6
        case Sat = 7
    }
    
    static func checkEligibleForWorkingHours(response: String, closureHandler: (Bool) -> Void) {
        let regex = try! NSRegularExpression(pattern: AppGeneral.pattern)
        if let match = regex.matches(in: response, range: .init(response.startIndex..., in: response)).first,
            match.numberOfRanges == 3 {
            let startT = response[Range(match.range(at: 1), in: response)!].minutesFromTime
            let endT = response[Range(match.range(at:2), in: response)!].minutesFromTime
            let minutes = startT - endT
            
            let day = response.components(separatedBy: " ").first?.components(separatedBy: "-")
            let startDay = day?.first
            let endDay = day?.last
            
            configureSchedule((startDay, endDay), (startT, endT)) { schedule in
                closureHandler(isWorkingHours(weekSchedule: schedule))
            }
        }
    }
    
    private static func configureSchedule(_ payload: (String?, String?),
                                   _ workingHours: (Int, Int),
                                   closureHandler: (DaysFormat) -> Void) {
        var schedule = DaysFormat()

        switch payload {
        case ("M", "F"):
            for i in Days.allCases where i != .Sat && i != .Sun  {
                schedule[i] = workingHours
            }
            
        case ("S", "F"):
            Days.allCases.forEach { day in
                schedule[day] = workingHours
            }
           
        case (_, _): break
        }
        closureHandler(schedule)
    }

    private static func isWorkingHours(weekSchedule: DaysFormat) -> Bool {
        let tz = NSTimeZone.default
        let now = NSCalendar.current.dateComponents(in: tz, from: Date())

        guard let weekday = now.weekday,
            let today = Days(rawValue: weekday),
            let hour = now.hour,
            let minute = now.minute else {
                return false
        }

        guard let todayTuple = weekSchedule[today] else {
            return false // no key, means closed
        }

        let opensAt = todayTuple.0
        let closesAt = todayTuple.1

        assert(opensAt < closesAt, "Your schedule is setup wrong.")

        let rightNowInMinutes = hour * 60 + minute

        return rightNowInMinutes > opensAt &&
            rightNowInMinutes < closesAt
    }
}
