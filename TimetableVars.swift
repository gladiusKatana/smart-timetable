//  TimetableVars.swift
//  smart-timetable  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder (a.k.a. gladiusKatana ⚔️)
import UIKit

var lastLoggedInDate = Date()
var selectedCellDate = Date()

var (year, month, day, weekday, hour, minute) = (Int(), String(), Int(), String(), Int(), Int()) // (0, "", 0, "", 0, 0)
//* reserving full-spelled date component names for CURRENT date (Date()!)

var lastLoginDateComponents = [Int(), String(), Int(), String(), Int(), Int()] as [Any]
//var lastLoginDateComponents = [0, "", 0, "", 0, 0] as [Any] // or could define as  = [Any?]() ... but would not handle unwrapping for printing


var eventsAtIndexPath = Dictionary<TimeBlock<Int,Int>,[SimpleEvent]>()

var timeBlock = TimeBlock(values:(0, 0));       var previousTimeBlock = TimeBlock(values:(0, 0))

var eventPathArrays = [[Int]]()
var eventDescriptionArrays = [[String]]()
var eventDateArrays = [[[Int(), String(), Int(), String(), Int(), Int()] as [Any]]] // [[[0, "", 0, "", 0, 0] as [Any]]]


var selectedTimeBlockPath = [-1, -1];             var previousSelectedTimeBlockPath = [0, 0]

var nowRow = 0;                                 var nowColumn = 0

var reloadedFromHourTickingOver = false;        var textFieldDisplayed = false


var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

var weekdaysAbbreviated = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
var wkdysDefaultOrder = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

var hoursOfTheDay = ["12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"]
//var militaryDayHours = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]

var defaultEmptyEventDescription = "❒" //="(a 'time block')"

