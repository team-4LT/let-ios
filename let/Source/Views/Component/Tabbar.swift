//
//  Tabbar.swift
//  beep
//
//  Created by cher1shRXD on 3/29/25.
//

import SwiftUI

enum Tab {
    case home
    case workout
    case profile
}

struct Tabbar: View {
    @Binding var currentTab: Tab;
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .opacity(0.2)
            HStack(alignment: .center) {
                Spacer()
                Spacer()
                
                Button {
                    HapticManager.instance.impact(style: .heavy)
                    currentTab = .workout
                } label: {
                    Image(currentTab == .workout ? "WorkoutActive" : "Workout")
                        .resizable()
                        .frame(width: 24, height: 24)
                        
                }
                .foregroundStyle(
                    currentTab == .workout ? Color.main : Color.placeholder
                )
                .disabled(currentTab == .workout)
                
                Spacer()
                Spacer()
                Spacer()
                
                
                Button {
                    HapticManager.instance.impact(style: .heavy)
                    currentTab = .home
                } label: {
                    Image(currentTab == .home ? "HomeActive" : "Home")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .foregroundStyle(currentTab == .home ? Color.main : Color.placeholder)
                .disabled(currentTab == .home)
                
                Spacer()
                Spacer()
                Spacer()
                
                Button {
                    HapticManager.instance.impact(style: .heavy)
                    currentTab = .profile
                } label: {
                    Image(currentTab == .profile ? "ProfileActive" : "Profile")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                .foregroundStyle(
                    currentTab == .profile ? Color.main : Color.placeholder
                )
                .disabled(currentTab == .profile)
                
                Spacer()
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: 64)
            .padding(.bottom, 16)
            .background(Color.white)
        }
    }
        
}

#Preview {
    Tabbar(currentTab: .constant(Tab.home))
}
