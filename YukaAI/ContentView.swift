//
//  ContentView.swift
//  YukaAI
//
//  Created by Michael Taranik on 08.07.2024.
//

import SwiftUI

class ContentViewManager: ObservableObject {
    @Published var mainTitle = "YukaAI"
    
    func changeTitle(_ newTitle: String) {
        self.mainTitle = newTitle
    }
}

struct ContentView: View {

    @EnvironmentObject var vm: ScanViewModel
    
    @StateObject var contentManager = ContentViewManager()
    
    var body: some View {
        ZStack {
            Color(.lightGreen)
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
                        StatsTabView()
                        ScanTabView()
                        
                        AssistantTabView()
                        ProfileTabView()
                    }
                }
            })
        }
        .environmentObject(vm)
        .task {
            await vm.requestDataScannerAccessStatus()
        }
        .environmentObject(contentManager)
    }
}




//MARK: - CartTab
struct CartTabView: View {
    @EnvironmentObject var contentManager: ContentViewManager
    
    
    var body: some View {
        CartView()
            .onAppear {
                contentManager.changeTitle("Cart")
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
    @EnvironmentObject var contentManager: ContentViewManager
    @EnvironmentObject var vm: ScanViewModel
    
    @State var myImg = UIImage(systemName: "camera")
    
    var body: some View {
//        BarcodeScannerView()
        CustomCameraView(image: $myImg, didTapCapture: false)
            .environmentObject(vm)
            .task {
                await vm.requestDataScannerAccessStatus()
            }
            .onAppear {
                contentManager.changeTitle("Scan")
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
    @EnvironmentObject var contentManager: ContentViewManager
    
    
    var body: some View {
        StatsView()
            .onAppear {
                contentManager.changeTitle("Progress")
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
    @EnvironmentObject var contentManager: ContentViewManager
    
    
    var body: some View {
        AssistantView()
            .onAppear {
                contentManager.changeTitle("Assistant")
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
    @EnvironmentObject var contentManager: ContentViewManager
    
    
    var body: some View {
        ProfileView()
            .onAppear {
                contentManager.changeTitle("Profile")
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
