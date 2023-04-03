//
//  ComingSoonView.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 30/03/2023.
//

import SwiftUI

struct ComingSoonView: View {
    @State private var showNotificationList = false
    
    var body: some View {
        NavigationStack {
            Group {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView {
                        VStack {
                            NotificationBar(showNotificationList: $showNotificationList)
                            Text("For each loop here")
                        }
                    }
                    .foregroundColor(.white)
                }
            }
            .navigationDestination(isPresented: $showNotificationList) {
                Text("Notification List")
            }
        }
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}
