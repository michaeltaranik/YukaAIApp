//
//  ContentView.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.07.2024.
//

import SwiftUI

class HomeViewManager: ObservableObject {
    @Published var mainTitle = "YukaAI"
    
    func changeTitle(_ newTitle: String) {
        self.mainTitle = newTitle
    }
}

struct HomeView: View {

    @StateObject private var vm = BarcodeScannerViewModel()
    @StateObject var contentManager = HomeViewManager()
    
    var body: some View {
        ZStack {
            Color(.accentInverted)
                .ignoresSafeArea()
            VStack(alignment: .leading, content: {
//                Text(contentManager.mainTitle)
//                    .font(.system(size: 40, weight: .bold))
//                    .foregroundColor(.darkGreen)
//                    .padding()
//                    .shadow(color: .gray, radius: 10, x: 0.0, y: 10.0)
                ZStack {
                    TabView {
                        CartTabView()
                            .tag(0)
                        
                        StatsTabView()
                            .tag(1)
                        
                        ScanTabView()
                            .tag(2)
                        
                        AssistantTabView()
                            .tag(3)
                        
                        ProfileTabView()
                            .tag(4)
                    }
                }
            })
        }
        .environmentObject(contentManager)
    }
}




//MARK: - CartTab
struct CartTabView: View {
    @EnvironmentObject var contentManager: HomeViewManager

    var body: some View {
        CartView()
            .onAppear {
                contentManager.changeTitle("Cart")
                HapticManager.shared.impact(style: .soft)
            }
            .tabItem {
                Image(systemName: "cart")
                Text("Cart")
                    .font(.system(size: 20))
            }
    }
}

//MARK: - ScanTab
struct ScanTabView: View {
    @EnvironmentObject var contentManager: HomeViewManager
    
    
    var body: some View {
        BarcodeScannerView()
            .onAppear {
                contentManager.changeTitle("Scan")
                HapticManager.shared.impact(style: .soft)
            }
            .tabItem {
                Image(systemName: "camera.viewfinder")
                Text("Scan")
                    .font(.system(size: 20))
            }
    }
    
}

//MARK: - ProgressTab
struct StatsTabView: View {
    @EnvironmentObject var contentManager: HomeViewManager
    
    
    var body: some View {
        StatsView()
            .onAppear {
                contentManager.changeTitle("Progress")
                HapticManager.shared.impact(style: .soft)
            }
            .tabItem {
                Image(systemName: "star.fill")
                Text("Progress")
                    .font(.system(size: 20))
            }
    }
}


//MARK: - AssistantTab
struct AssistantTabView: View {
    @EnvironmentObject var contentManager: HomeViewManager
    
    
    var body: some View {
        AssistantView()
            .onAppear {
                contentManager.changeTitle("Assistant")
                HapticManager.shared.impact(style: .soft)
            }
            .tabItem {
                Image(systemName: "questionmark.bubble.fill")
                Text("Ask AI")
                    .font(.system(size: 20))
            }
    }
}

//MARK: - ProfileTab
struct ProfileTabView: View {
    @EnvironmentObject var contentManager: HomeViewManager
    
    
    var body: some View {
        ProfileView()
            .onAppear {
                contentManager.changeTitle("Profile")
                HapticManager.shared.impact(style: .soft)
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
                    .font(.system(size: 20))
            }
    }
}

//MARK: - ContentPreview

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
