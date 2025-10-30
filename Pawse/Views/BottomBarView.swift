//
//  BottomBarView.swift
//  Pawse
//
//  Bottom navigation bar component
//

import SwiftUI

struct BottomBarView: View {
    @Binding var selectedTab: TabItem
    
    var body: some View {
        HStack(spacing: 0) {
            // Community Tab
            TabButton(
                tab: .community,
                selectedTab: $selectedTab
            )
            
            Spacer()
            
            // Camera Tab (Center with special styling)
            CameraTabButton(
                selectedTab: $selectedTab
            )
            
            Spacer()
            
            // Profile Tab
            TabButton(
                tab: .profile,
                selectedTab: $selectedTab
            )
        }
        .padding(.horizontal, 64)
        .padding(.top, 38)
        .frame(height: 115)
        .background(
            UnevenRoundedRectangle(
                cornerRadii: .init(
                    topLeading: 0,
                    bottomLeading: 60,
                    bottomTrailing: 60,
                    topTrailing: 0
                )
            )
            .fill(Color(hex: "F6DDB2"))
        )
    }
}

// MARK: - Tab Button Component
struct TabButton: View {
    let tab: TabItem
    @Binding var selectedTab: TabItem
    
    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(systemName: tab.iconName)
                .font(.system(size: 30))
                .foregroundColor(Color(hex: "84665C"))
                .frame(width: 50, height: 50)
        }
    }
}

// MARK: - Camera Tab Button (Special Center Button)
struct CameraTabButton: View {
    @Binding var selectedTab: TabItem
    
    var body: some View {
        Button(action: {
            selectedTab = .camera
        }) {
            ZStack {
                Circle()
                    .fill(Color(hex: "F7B455"))
                    .frame(width: 50, height: 50)
                
                Image(systemName: "camera.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
        }
        .offset(y: -10) // Slightly elevated
    }
}

// MARK: - Color Extension (for hex colors)
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Preview
#Preview {
    BottomBarView(selectedTab: .constant(.community))
}

