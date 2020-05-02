//  Copyright © 2020 335g. All rights reserved.

import SwiftUI
import Combine

// MARK: - ViewModel

final class ContentViewModel: ObservableObject {
    @Published var text: String = ""
}

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel = .init()
    
    var body: some View {
        VStack {
            MyTextField(text: $viewModel.text)
            MyTextField(text: $viewModel.text)
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
