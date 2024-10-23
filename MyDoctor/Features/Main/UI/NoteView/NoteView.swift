//
//  NoteView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 22.10.2024.
//

import SwiftUI

struct NoteView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            headerView()
            
            Divider()
                .background(Color(.systemGray2))
            
            Text("")
        }
        .backgroundModifier()
        .padding(.horizontal)
    }
}

private extension NoteView {
    @ViewBuilder
    func headerView() -> some View {
        HStack(spacing: 8) {
            Image("note")
                .frame(minWidth: 24)
            
            Text("Заметки")
                .bigStyleText()
        }
    }
}

#Preview {
    NoteView()
}
