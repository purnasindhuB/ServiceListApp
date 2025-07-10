//
//  IconWithBadge.swift
//  ServiceListApp
//
//  Created by Purnasindhu-749 on 10/07/25.
//

import SwiftUI

struct IconWithBadge: View {
    let systemIcon: String
    let badgeColor: Color

    var body: some View {
        ZStack(alignment: .topTrailing) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(red: 34/255, green: 90/255, blue: 158/255).opacity(0.1))
                .frame(width: 32, height: 32)

            Image(systemName: systemIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(Color(red: 34/255, green: 90/255, blue: 158/255))

            Circle()
                .fill(badgeColor)
                .frame(width: 8, height: 8)
                .offset(x: 4, y: -4)
        }
    }
}
