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
                contentManager.changeTitle("Home")
                HapticManager.shared.impact(style: .soft)
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
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
            .toolbarBackground(.ultraThickMaterial, for: .tabBar)
           
    }
    
}

//MARK: - AssistantTab
struct AssistantTabView: View {
    @EnvironmentObject var contentManager: HomeViewManager
    
    
    var body: some View {
        AssistantView()
            .onAppear {
                contentManager.changeTitle("Assistant")
                UIApplication.shared.addTapGestureRecognizer()
                HapticManager.shared.impact(style: .soft)
            }
            .tabItem {
                Image(systemName: "wand.and.stars")
                Text("Ask AI")
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
                Image(systemName: "chart.pie.fill")
                Text("Progress")
                    .font(.system(size: 20))
            }
    }
}



//MARK: - AccountTab
struct ProfileTabView: View {
    @EnvironmentObject var contentManager: HomeViewManager
    
    var body: some View {
        AccountView()
            .onAppear {
                contentManager.changeTitle("Profile")
                HapticManager.shared.impact(style: .soft)
            }
            .tabItem {
                Image(systemName: "person.circle.fill")
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
