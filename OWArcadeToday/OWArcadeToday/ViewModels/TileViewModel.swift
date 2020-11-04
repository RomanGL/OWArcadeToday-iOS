//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation
import SwiftUI
import OWArcadeTodayAPI

final class TileViewModel: ObservableObject {
    @Published private(set) var id: UInt
    @Published private(set) var name: String
    @Published private(set) var players: String
    @Published private(set) var imageUrl: String
    @Published private(set) var duration: OWArcades.Modes.Tile.Duration

    // MARK: - Lifecycle

    init(tileData: OWArcades.Modes.Tile) {
        id = tileData.id
        name = tileData.name
        players = tileData.players
        imageUrl = tileData.image
        duration = tileData.duration
    }

    #if DEBUG

    private init(id: UInt,
                 name: String,
                 players: String,
                 imageUrl: String,
                 duration: OWArcades.Modes.Tile.Duration) {
        self.id = id
        self.name = name
        self.players = players
        self.imageUrl = imageUrl
        self.duration = duration
    }

    #endif
}

// MARK: - Placeholder

#if DEBUG

extension TileViewModel {
    static var placeholderDaily: TileViewModel {
        TileViewModel(id: 1,
                      name: "Competitive Team Deathmatch",
                      players: "4v4",
                      imageUrl: "https://overwatcharcade.today/img/gamemodes/4ab6cd981f1e3284781500bd09039a9d.jpg",
                      duration: .daily)
    }

    static var placeholderWeekly: TileViewModel {
        TileViewModel(id: 2,
                      name: "Capture the Flag",
                      players: "6v6",
                      imageUrl: "https://overwatcharcade.today/img/gamemodes/d96e2e7ab65537e92bf20961c1646b76.jpg",
                      duration: .weekly)
    }

    static var placeholderPermanent: TileViewModel {
        TileViewModel(id: 3,
                      name: "Mystery Heroes",
                      players: "6v6",
                      imageUrl: "https://overwatcharcade.today/img/gamemodes/79eba70d1695e915a810f1a41d0bb756.jpg",
                      duration: .permanent)
    }
}

#endif
