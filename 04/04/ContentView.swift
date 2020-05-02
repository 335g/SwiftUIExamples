//  Copyright © 2020 335g. All rights reserved.

import SwiftUI
import Combine

// MARK: - ViewModel

final class ContentViewModel: ObservableObject {
    @Published var texts: [String] = ["a", "b", "c", "d"]
}

// MARK: - View

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel = .init()
    
    var body: some View {
        List {
            ForEach(viewModel.texts.indices, id: \.self) { idx in
                MyTextField(text: self.$viewModel.texts[idx])
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
