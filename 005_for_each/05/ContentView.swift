//  Copyright © 2020 335g. All rights reserved.

import SwiftUI

struct ContentView: View {
    @State var stringContents: [IdentifiableWrapped<String>] = [
        IdentifiableWrapped("0"),
        IdentifiableWrapped("1")
    ]
    @State var intContents: [Wrapped<Int>] = [
        Wrapped(0),
        Wrapped(1)
    ]
    
    var body: some View {
        VStack {
            Text("Data.Element conforms to Identifiable")
            ForEach(stringContents) { elem in
                Text(elem.inner)
            }
            Spacer()
            
            Text("Data.Element doesn't need to conform Identifiable")
            ForEach(0..<intContents.count) { idx in
                Text("\(self.intContents[idx].inner)")
            }
            Spacer()
            
            Text("Data.Element doesn't need to conform Identifiable")
            ForEach(intContents, id: \.inner) { elem in
                Text("\(elem.inner)")
            }
        }
        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 150, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
