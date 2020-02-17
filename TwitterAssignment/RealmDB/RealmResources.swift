//
//  RealmResources.swift
//  TwitterAssignment
//
//  Created by Vaishnav C on 2/17/20.
//  Copyright © 2020 Vaishnav C. All rights reserved.
//

import Foundation
import RealmSwift

class RealmResources {
    
    private init() {}
    static let shared = RealmResources()
    
    var realm = try! Realm()
    
    func create<T:Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func update<T: Object>(_ object: T , with dictionary:[String:Any?]) {
        
        do {
            try realm.write {
                for(key , value) in dictionary {
                    object.setValue(value, forKey: key )
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func delete<T:Object>(_ Object:T) {
        do {
            try realm.write {
                realm.delete(Object)
            }
        } catch{
            print(error.localizedDescription)
        }
    }
    
}
