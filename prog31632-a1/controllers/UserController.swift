//
//  UserController.swift
//  prog31632-a1
//
//  Created by Yiyao Zhang on 2021-03-28.
//

import Foundation
import SQLite3

class UserController {
    let databaseName: String? = "UserDatabase"
    let databasePath: String?
    var users: [User] = []
    
    var officialDateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }
    
    init() {
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
       
        let documentsDir = documentPaths[0]
        
        databasePath = documentsDir.appending("/" + databaseName!)
       
        checkAndCreateDatabase()
        
        readDataFromDatabase()
    }
    
    func checkAndCreateDatabase() {
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: databasePath!) {
            return
        }
    
        let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName!)
        
        try? fileManager.copyItem(atPath: databasePathFromApp!, toPath: databasePath!)
    
        return
    }
    
    func readDataFromDatabase() {
        users.removeAll()
        var db: OpaquePointer? = nil
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK {
            var queryStatement: OpaquePointer? = nil
            let queryStatementString: String = "select * From users"
            
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
                while sqlite3_step(queryStatement) == SQLITE_ROW {
                    let id = Int(sqlite3_column_int(queryStatement, 0))
                    let name = String(cString: sqlite3_column_text(queryStatement, 1))
                    let address = String(cString: sqlite3_column_text(queryStatement, 2))
                    let phoneNumber = String(cString: sqlite3_column_text(queryStatement, 3))
                    let email = String(cString: sqlite3_column_text(queryStatement, 4))
                    let age = Int(sqlite3_column_int(queryStatement, 5))
                    let gender = String(cString: sqlite3_column_text(queryStatement, 6))
                    let dateOfBirth = String(cString: sqlite3_column_text(queryStatement, 7))
                    let avatar = String(cString: sqlite3_column_text(queryStatement, 8))

                    
                    let date = officialDateFormatter.date(from: dateOfBirth)!

                    let user = User(id: id, name: name, address: address, phoneNumber: phoneNumber, email: email, age: age, gender: gender, dateOfBirth: date, avatar: avatar)
                    users.append(user)
                }
                sqlite3_finalize(queryStatement)
            } else {
                print("Failed to prepare a SELECT statement")
            }
            
            sqlite3_close(db)
            
        }
    }
    
    func insert(data user: User) -> Bool {
        var db: OpaquePointer? = nil
        var returnCode : Bool = true
        
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK {
            var insertStatement: OpaquePointer? = nil
            let insertStatementString : String = "insert into users values(NULL, ?, ?, ?, ?, ?, ?, ?, ?)"
                    
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                let name = user.name as NSString
                let address = user.address as NSString
                let phoneNumber = user.phoneNumber as NSString
                let email = user.email as NSString
                let age = user.age
                let gender = user.gender as NSString
                let dateOfBirth = officialDateFormatter.string(from: user.dateOfBirth) as NSString
                let avatar = user.avatar as NSString
                
                sqlite3_bind_text(insertStatement, 1, name.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, address.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, phoneNumber.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, email.utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 5, Int32(age))
                sqlite3_bind_text(insertStatement, 6, gender.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 7, dateOfBirth.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 8, avatar.utf8String, -1, nil)
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    _ = sqlite3_last_insert_rowid(db)
                    print("Successfully inserted")
                } else {
                    print("Could not insert row.")
                    returnCode = false
                }
                sqlite3_finalize(insertStatement)
            } else {
                print("INSERT statement could not be prepared.")
                returnCode = false
            }
            
            sqlite3_close(db);
                    
        } else {
            print("Unable to open database.")
            returnCode = false
        }
        return returnCode
    }
}
