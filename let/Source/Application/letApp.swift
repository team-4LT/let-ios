//
//  letApp.swift
//  let
//
//  Created by cher1shRXD on 4/14/25.
//

import SwiftUI

@main
struct letApp: App {
    @State var isSplash = true
    var body: some Scene {
        WindowGroup {
            if isSplash {
                Splash()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            isSplash = false
                        }
                    }
            } else {
                Login()
            }
                
        }
    }
}
