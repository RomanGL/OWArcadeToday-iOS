//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import SwiftUI
import OWArcadeTodayAPI

struct DurationHintView: View {
    var duration: OWArcades.Modes.Tile.Duration

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(hintText)
                .font(.custom("BigNoodleTitlingCyr", size: 28))
                .foregroundColor(.white)
                .padding([.leading, .trailing], 15)
                .padding(.top, 10)
                .padding(.bottom, 5)
                .frame(minWidth: 80)
                .background(backgroundColor)
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 20, y: 0))
                path.addLine(to: CGPoint(x: 20, y: 20))
                path.addLine(to: CGPoint(x: 0, y: 0))
            }
            .fill(backgroundColor2)
            .fixedSize()
        }
    }
}

private extension DurationHintView {
    var backgroundColor: Color {
        switch duration {
        case .daily:
            return Color(hex: 0xF89E1B)
        case .weekly:
            return Color(hex: 0x17B113)
        case .permanent:
            return .clear
        }
    }

    var backgroundColor2: Color {
        switch duration {
        case .daily:
            return Color(hex: 0x7C4F0E)
        case .weekly:
            return Color(hex: 0x0C590A)
        case .permanent:
            return .clear
        }
    }

    var hintText: String {
        switch duration {
        case .daily:
            return "Daily "
        case .weekly:
            return "Weekly "
        case .permanent:
            return ""
        }
    }
}

#if DEBUG

struct DurationHintView_Previews: PreviewProvider {
    static var previews: some View {
        DurationHintView(duration: .daily)
            .previewLayout(.sizeThatFits)

        DurationHintView(duration: .weekly)
            .previewLayout(.sizeThatFits)
    }
}

#endif
