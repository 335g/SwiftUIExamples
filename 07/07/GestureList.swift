//  Copyright © 2020 335g. All rights reserved.

import SwiftUI

struct GestureList: View {
    @Binding var gestures: [GestureExample]
    @Binding var selectedGesture: GestureExample?
    
    var body: some View {
        List(selection: $selectedGesture) {
            ForEach(gestures, id: \.self) { gesture in
                Text(gesture.rawValue).tag(gesture)
            }
        }
//        .listStyle(SidebarListStyle()) // 境界を左に動かすことでリスト非表示になる
            .frame(minWidth: 150, maxWidth: 200, maxHeight: .infinity)
    }
}

struct GestureList_Previews: PreviewProvider {
    static var previews: some View {
        GestureList(gestures: .constant(GestureExample.allCases), selectedGesture: .constant(nil))
    }
}
