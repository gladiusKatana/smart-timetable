//  TimetableVars.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)

import UIKit

var currentDate = Date()

var lastLoggedInDate = Date()

var (year, monthString, dayInt, weekday, hour, minute) = (0, "", 0, "", 0, 0)

var lastLoginDateComponents = [0, "", 0, "", 0, 0] as [Any] // = [Any?]()

var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

//var daysOfTheWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"] 
var weekdaysAbbreviated = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
var wkdysDefaultOrder = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

var hoursOfTheDay = ["12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]
//var militaryDayHours = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]

var nowRow = 0;       var nowColumn = 0

var reloadedFromHourTickingOver = false
