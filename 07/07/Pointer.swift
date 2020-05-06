//  Copyright © 2020 335g. All rights reserved.

import SwiftUI

struct Pointer: View {
    @Binding var cornerRadius: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width
                
                path.move(to: CGPoint(x: 0.0, y: self.cornerRadius))
                path.addArc(
                    tangent1End: CGPoint(x: 0.0, y: 0.0),
                    tangent2End: CGPoint(x: self.cornerRadius, y: 0.0),
                    radius: self.cornerRadius)
                path.addLine(to: CGPoint(x: width - self.cornerRadius, y: 0.0))
                path.addArc(
                    tangent1End: CGPoint(x: width, y: 0.0),
                    tangent2End: CGPoint(x: width, y: self.cornerRadius),
                    radius: self.cornerRadius)
                path.addLine(to: CGPoint(x: width, y: height - self.cornerRadius))
                path.addArc(
                    tangent1End: CGPoint(x: width, y: height),
                    tangent2End: CGPoint(x: width - self.cornerRadius, y: height),
                    radius: self.cornerRadius)
                path.addLine(to: CGPoint(x: self.cornerRadius, y: height))
                path.addArc(
                    tangent1End: CGPoint(x: 0.0, y: height),
                    tangent2End: CGPoint(x: 0.0, y: height - self.cornerRadius),
                    radius: self.cornerRadius)
                path.closeSubpath()
            }
        }
    }
}

struct Pointer_Previews: PreviewProvider {
    static var previews: some View {
        Pointer(cornerRadius: .constant(20.0))
    }
}
