//  Copyright © 2020 335g. All rights reserved.

import SwiftUI

struct ContentView: View {
    @State var allGestures: [GestureExample] = GestureExample.allCases
    @State var selectedGesture: GestureExample? = nil
    
//    @State var width: CGFloat = 700
//    @State var height: CGFloat = 400
//    @State var sidebarWidth: CGFloat = 300
    
    var body: some View {
        NavigationView {
            GestureList(gestures: $allGestures, selectedGesture: $selectedGesture)
            if selectedGesture != nil {
                Canvas(gestureExample: selectedGesture!)
            }
        }
        .frame(minWidth: 700, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
