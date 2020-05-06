//  Copyright © 2020 335g. All rights reserved.

import SwiftUI

struct MyTextField: View {
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text)
    }
}

struct MyTextField_Previews: PreviewProvider {
    static var previews: some View {
        MyTextField(text: .constant(""))
    }
}
