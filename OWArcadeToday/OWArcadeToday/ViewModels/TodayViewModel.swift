//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation
import SwiftUI
import OWArcadeTodayAPI

final class TodayViewModel: ObservableObject {

    // Dependencies
    @Injected private var overwatchApi: OWArcadeApi

    // State
    @Published var tiles: [TileViewModel] = []

    func refresh() {
        overwatchApi
            .obtainToday()
            .done(on: .main) { todayArcades in
                self.tiles = todayArcades.modes.tiles.map { TileViewModel(tileData: $0) }
            }
            .catch { error in
                print(error)
            }
    }
}

#if DEBUG

extension TodayViewModel {
    static var placeholder: TodayViewModel {
        let viewModel = TodayViewModel()
        viewModel.tiles = [.placeholderDaily, .placeholderWeekly, .placeholderPermanent]
        return viewModel
    }
}

#endif
