import Foundation


func main() {
    
    let dbCon = DBHandler(for: "exampleDatabase.db")

    var dummyUser = User(id: 1, name: "Anshil")
    dummyUser.isLoggedIn = 0
    
//    print(dbCon.createTable("Users", for: User()))
//    print(dbCon.insertInto("Users", values: [dummyUser]))
    print(dbCon.select(["name"], from: "Users", where: "id = 1"))
    print(dbCon.select(from: "Users", where: "id = 1", as: User.self))
    
//    dbCon.exec(query: "DROP TABLE Users")
//    print(dbCon.insertInto("Test", values: ["2","Naveen"]))
//    print(dbCon.select(["id"], from: "Users", where: "id = 1", as: User.self)?[0].name)
    
}

main()


//print(dbCon.createTable("Users", for: User()))
//print(dbCon.insertInto("Users", values: [dummyUser]))
//dbCon.exec(query: "DROP TABLE Users")
//print(dbCon.insertInto("Test", values: ["2","Naveen"]))
//print(dbCon.select(["id","name"], from: "Users", where: "id = 1", as: User.self)?[0].name)


