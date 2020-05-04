//  Copyright © 2020 335g. All rights reserved.

import SwiftUI

struct ContentView: View {
    @State var intContent: [Wrapped<Int>] = [
        Wrapped(0),
        Wrapped(1),
        Wrapped(2)
    ]
    @State var selectedValue: Wrapped<Int>? = nil
    @State var selectedValues: Set<Wrapped<Int>> = Set()
    
    var body: some View {
        VStack {
            Group {
                Text("Creates a list with the given content. (Cannot select)")
                List {
                    Text("a")
                    Text("b")
                }
                
                Text("Creates a list that identifies its rows based on a key path to the identifier of the underlying data. (Cannot select)")
                List(intContent, id: \.inner) { elem in
                    Text("\(elem.inner)")
                }
                
                Text("Creates a list with the given content that supports selecting a single row.")
                List(selection: $selectedValue) {
                    ForEach(intContent, id: \.inner) { elem in
                        Text("\(elem.inner)").tag(elem)
                    }
                }
                                
                Text("Creates a list with the given content that supports selecting multiple rows.")
                List(selection: $selectedValues) {
                    ForEach(intContent, id: \.inner) { elem in
                        Text("\(elem.inner)").tag(elem)
                    }
                }
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
