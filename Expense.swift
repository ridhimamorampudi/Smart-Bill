//
//  Expense.swift
//  ExpenseTracker (iOS)
//
//  Created by Ridhima on 6/18/22.
//

import SwiftUI

// MARK: Expense Model And Sample Data
struct Expense: Identifiable,Hashable{
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: String
}

enum ExpenseType: String{
    case income = "Income"
    case expense = "expenses"
    case all = "ALL"
}

var sample_expenses: [Expense] = [
    Expense(remark: "Target", amount: 99, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Yellow"),
    Expense(remark: "Starbucks", amount: 19, date: Date(timeIntervalSince1970: 1652814445), type: .expense, color: "Red"),
    Expense(remark: "Gamestop", amount: 99, date: Date(timeIntervalSince1970: 1652382445), type: .expense, color: "Purple"),
    Expense(remark: "Lyft", amount: 20, date: Date(timeIntervalSince1970: 1652296045), type: .expense, color: "Green"),
    Expense(remark: "Costco", amount: 299, date: Date(timeIntervalSince1970: 1652209645), type: .expense, color: "Yellow"),
    Expense(remark: "Stocks", amount: 2599, date: Date(timeIntervalSince1970: 1652036845), type: .income, color: "Purple"),
    Expense(remark: "Dividend", amount: 499, date: Date(timeIntervalSince1970: 1651864045), type: .income, color: "Red"),
    Expense(remark: "AMC", amount: 99, date: Date(timeIntervalSince1970: 1651691245), type: .expense, color: "Yellow"),
    Expense(remark: "Spotify Premium", amount: 25, date: Date(timeIntervalSince1970: 1651518445), type: .expense, color: "Green"),
    Expense(remark: "Amazon", amount: 49, date: Date(timeIntervalSince1970: 1651432045), type: .expense, color: "Purple"),
]
