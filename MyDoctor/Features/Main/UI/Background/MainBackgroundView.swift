//
//  BackGroundView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 24.10.2024.
//

import SwiftUI

struct MainBackgroundView: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .fill(Color.yellowColor())
                            .frame(width: 138, height: 138)
                            .blur(radius: 50)
                            .offset(x: 50, y: -40)
                        
                        Circle()
                            .fill(Color.redColor())
                            .frame(width: 78, height: 78)
                            .blur(radius: 25)
                            .offset(x: 60, y: -70)
                    }
                }
                Spacer()
            }
            .padding(.top, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mainColor().ignoresSafeArea())
    }
}
