//
//  DateFormatter.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 21.10.2024.
//

import Foundation

func mYFormattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM yyyy 'г.'"
    formatter.locale = Locale(identifier: "ru_RU")
    return formatter.string(from: date)
}

func fullFormatedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM.yyyy"
    return formatter.string(from: date)
}
