//
//  DiagramView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 22.10.2024.
//

import SwiftUI
import Charts

struct DiagramView: View {
    var systolicData: [Double] = [120.0, 140.0, 110.0]
    var diastolicData: [Double] = [80.0, 90.0, 70.0]
    var timePoints: [String] = ["0h", "6h", "12h", "18h", "24h"]

    var body: some View {
        VStack {
            Chart {
                // Systolic data
                ForEach(0..<systolicData.count, id: \.self) { index in
                    LineMark(
                        x: .value("Time", timePoints[index]),
                        y: .value("Systolic Pressure", systolicData[index]),
                        series: .value("SP", "A")
                    )
                    .foregroundStyle(.red.opacity(0.2))
                    .interpolationMethod(.catmullRom)
                    
                    PointMark(
                        x: .value("Time", timePoints[index]),
                        y: .value("Systolic Pressure", systolicData[index])
                    )
                    .foregroundStyle(.red)
                }

                // Diastolic data
                ForEach(0..<diastolicData.count, id: \.self) { index in
                    LineMark(
                        x: .value("Time", timePoints[index]),
                        y: .value("Diastolic Pressure", diastolicData[index]),
                        series: .value("DP", "B")
                    )
                    .foregroundStyle(.orange.opacity(0.2))
                    .interpolationMethod(.catmullRom)
                    
                    PointMark(
                        x: .value("Time", timePoints[index]),
                        y: .value("Diastolic Pressure", diastolicData[index])
                    )
                    .foregroundStyle(.orange)
                }
                
                // Horizontal lines
                RuleMark(y: .value("Level", 200))
                    .foregroundStyle(Color.gray)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                RuleMark(y: .value("Level", 150))
                    .foregroundStyle(Color.red)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                RuleMark(y: .value("Level", 100))
                    .foregroundStyle(Color.gray)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                RuleMark(y: .value("Level", 50))
                    .foregroundStyle(Color.blue)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))

                RuleMark(y: .value("Level", 0))
                    .foregroundStyle(Color.black)
                    .lineStyle(StrokeStyle(lineWidth: 1))
                                    
            }
            .frame(maxWidth: .infinity, maxHeight: 215)
        }
        .onAppear {
            for (index, time) in timePoints.enumerated() {
                print("Index: \(index), Time: \(time)")
            }
        }
    }
}
