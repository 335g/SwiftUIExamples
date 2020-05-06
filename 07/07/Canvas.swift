//  Copyright © 2020 335g. All rights reserved.

import SwiftUI

struct Canvas: View {
    var gestureExample: GestureExample
    @State var cornerRadius: CGFloat = 15.0
    @State var pointerWidth: CGFloat = 60.0
    @State var pointerHeight: CGFloat = 60.0
    
    var pointer: some View {
        return Pointer(cornerRadius: .constant(cornerRadius))
            .frame(width: pointerWidth, height: pointerHeight)
    }
    
    var body: some View {
        let container: AnyView = {
            switch gestureExample {
            case .tap:
                return AnyView(
                    pointer.onTapGesture {
                        print("tapped")
                    }
                )
            case .longpress:
                return AnyView(
                    pointer.onLongPressGesture {
                        print("long pressed")
                    }
                )
            }
        }()
           
        return container
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Canvas_Previews: PreviewProvider {
    static var previews: some View {
        Canvas(gestureExample: .tap)
    }
}
