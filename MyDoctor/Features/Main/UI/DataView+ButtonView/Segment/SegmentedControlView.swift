//
//  SegmentedControlView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 22.10.2024.
//

import SwiftUI

struct SegmentedControlView: View {
    @Binding var selectedSegment: Period
    
    var body: some View {
        HStack {
            ForEach(Period.allCases, id: \.self) { period in
                Text(period.rawValue)
                    .segmentText(isSelected: selectedSegment == period)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedSegment = period
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .background(Color.white)
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)
        .padding(.horizontal)
    }
}

enum Period: String, CaseIterable {
    case day = "День"
    case week = "Неделя"
    case month = "Месяц"
}
