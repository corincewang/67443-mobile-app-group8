//
//  ContentView.swift
//  Pawse
//
//  Created by Wang Han on 10/28/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: TabItem = .community
    
    var body: some View {
        VStack(spacing: 0) {
            // Main content area
            TabView(selection: $selectedTab) {
                CommunityView()
                    .tag(TabItem.community)
                
                CameraView()
                    .tag(TabItem.camera)
                
                ProfileView()
                    .tag(TabItem.profile)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            // Bottom navigation bar
            BottomBarView(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

// MARK: - Placeholder Views
struct CommunityView: View {
    var body: some View {
        ZStack {
            Color(hex: "FAF7EB")
                .ignoresSafeArea()
            
            VStack {
                Text("Community")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image(systemName: "person.3.fill")
                    .font(.system(size: 60))
                    .foregroundColor(Color(hex: "84665C"))
            }
        }
    }
}

struct CameraView: View {
    var body: some View {
        ZStack {
            Color(hex: "FAF7EB")
                .ignoresSafeArea()
            
            VStack {
                Text("Camera")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image(systemName: "camera.fill")
                    .font(.system(size: 60))
                    .foregroundColor(Color(hex: "F7B455"))
            }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color(hex: "FAF7EB")
                .ignoresSafeArea()
            
            VStack {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image(systemName: "person.fill")
                    .font(.system(size: 60))
                    .foregroundColor(Color(hex: "84665C"))
            }
        }
    }
}

#Preview {
    ContentView()
}
