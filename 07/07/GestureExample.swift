//  Copyright © 2020 335g. All rights reserved.

import Foundation

enum GestureExample: String, CaseIterable {
    case tap
    case longpress
}

extension GestureExample: Identifiable {
    var id: String {
        return self.rawValue
    }
}
