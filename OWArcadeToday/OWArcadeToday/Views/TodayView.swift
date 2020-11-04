//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import SwiftUI
import OWArcadeTodayAPI

struct TodayView: View {
    @ObservedObject var viewModel: TodayViewModel

    init(viewModel: TodayViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(viewModel.tiles, id: \.id) { tile in
                        tileView(from: tile)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .navigationBarTitle("Today")
        }
        .onAppear(perform: viewModel.refresh)
    }
}

private extension TodayView {
    func tileView(from tile: TileViewModel) -> some View {
        ZStack(alignment: .topLeading) {
            TileView(viewModel: tile)
                .frame(width: 360, height: 280)
                .clipped()

            DurationHintView(duration: tile.duration)
                .offset(x: -20, y: 20)
        }
        .shadow(radius: 20)
    }
}

#if DEBUG

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView(viewModel: .placeholder)
    }
}

#endif
