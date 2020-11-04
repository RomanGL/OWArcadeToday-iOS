//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import SwiftUI

struct TileView: View {
    @ObservedObject private(set) var viewModel: TileViewModel

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            GeometryReader { proxy in
                Image("testImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }

            VStack(alignment: .leading, spacing: 0) {
                Text("\(viewModel.players) ")
                    .font(.custom("BigNoodleTooOblique", size: 32))
                    .foregroundColor(Color(hex: 0x28354F))
                    .padding([.top, .leading, .trailing], 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)

                Text("\(viewModel.name) ")
                    .font(.custom("BigNoodleTooOblique", size: 28))
                    .foregroundColor(Color(hex: 0x1C75BC))
                    .padding([.leading, .trailing, .bottom], 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
    }
}

#if DEBUG

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(viewModel: .placeholderDaily)
            .previewLayout(.fixed(width: 500, height: 600))

        TileView(viewModel: .placeholderWeekly)
            .previewLayout(.fixed(width: 500, height: 300))

        TileView(viewModel: .placeholderPermanent)
            .previewLayout(.fixed(width: 500, height: 300))
    }
}

#endif
