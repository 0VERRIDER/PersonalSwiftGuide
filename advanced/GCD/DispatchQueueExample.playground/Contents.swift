import Foundation

DispatchQueue.main.async {
    for i in 1...5 {
        print(i)
    }
}

for i in 0...3 {
    print(i)
}

DispatchQueue.main.async {
    for i in 10...11 {
        print(i)
    }
}
