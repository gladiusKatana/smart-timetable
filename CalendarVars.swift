//  CalendarVars.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit


var monthButtonLeft = UIButton();       var monthButtonRight = UIButton();

var monthButtonRightImage = UIImage();  var monthButtonLeftImage = UIImage()


var currentDate = Date()



var (weekday, monthString, dayInt, year) = ("", "", 0, 0)

var daysOfTheWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]//["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

var todayCellRow = 0;       var todayCellColumn = 0



var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

var currentMonthIndex = 0
