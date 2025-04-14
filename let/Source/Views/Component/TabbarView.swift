import SwiftUI

struct TabbarView: View {
    @State var currentTab: Tab = .home
    @StateObject private var toastManager = ToastManager()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0){
                Group {
                    switch currentTab {
                    case .workout:
                        VStack{
                            
                            WorkOut()
                        }
                    case .home:
                        VStack{
                            
                            Home()
                        }
                    case .profile:
                        VStack{
                            
                            Profile()
                        }
                    }
                }
                .environmentObject(toastManager)
            }
            .padding(.horizontal, 24)

            VStack(spacing: 0){
                Spacer()
                Tabbar(currentTab: $currentTab)
            }
        }
        .background(Color.bg)
        .edgesIgnoringSafeArea(.bottom)
        .overlay{
            VStack(alignment: .leading, spacing: 0){
                ToastContainer()
                    .environmentObject(toastManager)
                Spacer()
            }
            .padding(.top, 12)
        }
    }
}


#Preview {
    TabbarView()
}
