//
//  ChartView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 22.10.2024.
//

import SwiftUI

struct ChartView: View {
    var systolicData: [Double]
    var diastolicData: [Double]
    var timePoints: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(systolicData.isEmpty && diastolicData.isEmpty ? "Нет Данных" : "Данные")
                .bigStyleText()
            
            Text("Сегодня")
                .smallStyleText()
            
            Divider()
                .background(Color(.systemGray2))
            
            parametersView()
            
            DiagramView(
                systolicData: systolicData,
                diastolicData: diastolicData,
                timePoints: timePoints
            )
            
            addDataButtonView()
        }
        .backgroundModifier()
        .padding(.horizontal)
    }
}

private extension ChartView {
    @ViewBuilder
    func parametersView() -> some View {
        HStack(spacing: 16) {
            Circle()
                .fill(Color(red: 255/255, green: 114/255, blue: 94/255))
                .frame(width: 8, height: 8)
            Text("Систолическое")
                .smallStyleText()
            
            Circle()
                .fill(Color(red: 255/255, green: 179/255, blue: 66/255))
                .frame(width: 8, height: 8)
            Text("Диастолическое")
                .smallStyleText()
        }
        .padding(.vertical, 8)
    }
    
    @ViewBuilder
    func addDataButtonView() -> some View {
        HStack {
            Spacer()
            Button {
                print("")
            } label: {
                Text("Добавить данные")
            }
            .addDataButtonStyle()
        }
        .padding(.vertical, 8)
    }
}
