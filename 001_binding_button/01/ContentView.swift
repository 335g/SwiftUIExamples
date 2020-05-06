//  Copyright © 2020 335g. All rights reserved.

import SwiftUI

struct ContentView: View {
    @State var b1: Bool = false
    @State var b2: Bool = true
    @State var b3: Bool = true
    
    var body: some View {
        let action1 = {
            self.b1 = true
            self.b2 = false
        }
        let action2 = {
            self.b2 = true
            self.b3 = false
        }
        let action3 = {
            self.b3 = true
            self.b1 = false
        }
        
        return HStack {
            Button("Button 1", action: action1).disabled(b1)
            Button("Button 2", action: action2).disabled(b2)
            Button("Button 3", action: action3).disabled(b3)
        }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
