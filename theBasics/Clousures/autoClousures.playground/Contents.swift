import Foundation

/// # Auto Clousures
/// We will Go through an example for AutoClousure For better understanding.

func AcceptAndRun(this clousure: ()->()){
    clousure()
}

/// So when we use this function we will pass the clousure,
AcceptAndRun(this: {print("Hi there")})

/// But when we have `@autoclousure`

func AcceptAndRun(this clousure: @autoclosure ()->()){
    clousure()
}

/// Same Function we can Run using
AcceptAndRun(this: print("Hello World")) // Without the clousures, Coz it will automatically gets added.

/// This still gets Intresting with the Concept `Trailing Closures`:
///  When clousure is the only or last parameter of function, we can take it outside, For Example :

AcceptAndRun {
    print("Trailing Clousure")
}



