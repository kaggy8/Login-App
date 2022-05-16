//
//  User.swift
//  Login App
//
//  Created by Stanislav Demyanov on 20.04.2022.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUsers() -> User {
        User(login: "admin",
             password: "admin",
             person: Person(fullName: "Rasta"))
    }
}

struct Person {
    let fullName: String
}
