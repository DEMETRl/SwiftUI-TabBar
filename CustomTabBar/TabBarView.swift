

import SwiftUI


var tabs = ["house.fill","magnifyingglass", "plus","message", "person.crop.circle"]




struct TabBarView: View {
    
    @State var selectedTab = "house.fill"
    
    var body: some View {
        
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab){
                
                
                Main()
                    .tag("house.fill")
                
                
                ExploreView()
                    .tag("magnifyingglass")
                
                UploadView()
                    .tag("plus")
                
                
                UserMessagesView()
                    .tag("message")
                
                
                ProfileView()
                    .tag("person.crop.circle")
                
            }
                
                HStack(spacing: 0){
                    ForEach(tabs, id: \.self){
                        image in
                        TabButton(image: image, selectedTab: $selectedTab)
                        
                        
                        if image != tabs.last {
                            Spacer(minLength: 0) 
                        }
                    }
                }.padding(.horizontal, 25)
                    .padding(.vertical, 5)
                    .background(.yellow)
                    .clipShape(Capsule())
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.15), radius: -5, x: -5, y: -5)
                    .padding(.horizontal)
            }
            .navigationBarBackButtonHidden(true)
            
        }
    }
    
    
    
    
    struct TabButton: View {
        var image: String
        
        @Binding var selectedTab: String
        
        var body: some View{
            Button(action: {selectedTab = image}) {
                Image(systemName: "\(image)")
                    .foregroundColor(selectedTab == image ? Color.black: (Color(#colorLiteral(red: 0.3386308253, green: 0.0476020053, blue: 0.5101187229, alpha: 1))))
                    .padding()
                
            }
            
            
            
            
        }
        
        
    }
    
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
