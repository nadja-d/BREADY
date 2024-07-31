import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "backgroundColor")
    }
    
    var body: some View {
        // use zstack
        
        NavigationStack {
            TabView {
                    VideosHP()
                        .tabItem() {
                            Image(systemName: "video")
                                
                            
                            Text("Videos")
                                
                        }
                    ProgressBar()
                        .tabItem() {
                            Image(systemName: "clock.badge.checkmark")
                            Text("Progress")
                        }
                        


                }
                .onAppear() {
                    UITabBar.appearance().backgroundColor = UIColor(Color("tabViewbackgroundColor"))
                }
            .tint(Color("tabTint"))
        }
        
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
