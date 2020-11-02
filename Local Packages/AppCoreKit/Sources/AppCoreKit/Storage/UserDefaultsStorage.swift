//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation

/// Represents an UserDefaults storage.
public class UserDefaultsStorage {

    // Dependencies
    private let userDefaults: UserDefaults

    // MARK: - Lifecycle

    public init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
}

// MARK: - IKeyValueStorage

extension UserDefaultsStorage: IKeyValueStorage {
    public func set<Entity>(_ entity: Entity) where Entity: IStorable {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(entity) {
            userDefaults.set(encoded, forKey: entity.storageKey)
            userDefaults.synchronize()
        }
    }

    public func get<Entity>(by key: String) -> Entity? where Entity: IStorable {
        if let data = userDefaults.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            return try? decoder.decode(Entity.self, from: data)
        }

        return nil
    }

    public func remove(by key: String) {
        userDefaults.removeObject(forKey: key)
        userDefaults.synchronize()
    }

    public func drop() {
        userDefaults.dictionaryRepresentation().forEach {
            userDefaults.removeObject(forKey: $0.key)
        }

        userDefaults.synchronize()
    }
}
