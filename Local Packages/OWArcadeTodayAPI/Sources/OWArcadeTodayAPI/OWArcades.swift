//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation

public struct OWArcades {
    public let createdAt: Date
    public let user: User
    public let isToday: Bool
    public let modes: Modes
}

// MARK: - Nested models

public extension OWArcades {
    struct Modes {
        public let tile1: Tile
        public let tile2: Tile
        public let tile3: Tile
        public let tile4: Tile
        public let tile5: Tile
        public let tile6: Tile
        public let tile7: Tile
    }

    struct User {
        public let battleTag: String
        public let avatarUrl: String
    }
}

public extension OWArcades.Modes {
    struct Tile {
        public let id: UInt
        public let image: String
        public let name: String
        public let players: String
        public let duration: Duration
    }
}

public extension OWArcades.Modes.Tile {
    enum Duration {
        case daily
        case weekly
        case permanent
    }
}

// MARK: Codable

extension OWArcades: Codable {
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case user
        case isToday = "is_today"
        case modes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let createdAtString = try container.decode(String.self, forKey: .createdAt)
        
        createdAt = dateFormatter.date(from: createdAtString) ?? Date()
        user = try container.decode(User.self, forKey: .user)
        isToday = try container.decode(Bool.self, forKey: .isToday)
        modes = try container.decode(Modes.self, forKey: .modes)
    }
}

extension OWArcades.User: Codable {
    enum CodingKeys: String, CodingKey {
        case battleTag = "battletag"
        case avatarUrl = "avatar"
    }
}

extension OWArcades.Modes: Codable {
    enum CodingKeys: String, CodingKey {
        case tile1 = "tile_1"
        case tile2 = "tile_2"
        case tile3 = "tile_3"
        case tile4 = "tile_4"
        case tile5 = "tile_5"
        case tile6 = "tile_6"
        case tile7 = "tile_7"
    }
}

extension OWArcades.Modes.Tile: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case image
        case name
        case players
        case duration = "label"
    }
}

extension OWArcades.Modes.Tile.Duration: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)

        switch value {
        case "Daily":
            self = .daily
        case "Weekly":
            self = .weekly
        default:
            self = .permanent
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .daily:
            try container.encode("Daily")
        case .weekly:
            try container.encode("Weekly")
        case .permanent:
            try container.encodeNil()
        }
    }
}

// MARK: Modes extension

public extension OWArcades.Modes {

    /// Gets tiles as an array.
    var tiles: [OWArcades.Modes.Tile] {
        return [tile1, tile2, tile3, tile4, tile5, tile6, tile7]
    }
}
