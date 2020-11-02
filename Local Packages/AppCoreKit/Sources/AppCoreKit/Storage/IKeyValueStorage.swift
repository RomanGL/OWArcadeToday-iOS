//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation

/// Represents a key-value persistent storage.
public protocol IKeyValueStorage {

    /// Sets the entity to the storage.
    /// - Parameter entity: Entity to save.
    func set<Entity: IStorable>(_ entity: Entity)

    /// Gets the entity from the storage.
    /// - Parameter key: The unique entity key.
    /// - Returns: An required entity or `nil`.
    func get<Entity: IStorable>(by key: String) -> Entity?

    /// Removes an entity by the key.
    /// - Parameter key: The unique entity key.
    func remove(by key: String)

    /// Removes all objects from the storage.
    func drop()
}
