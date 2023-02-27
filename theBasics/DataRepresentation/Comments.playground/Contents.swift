import Foundation

/// Commenting the Code will Help Us to understand the code in depth
/// There are different kinds of Commentings:\
/// SINGLE LINE :

var randomVariableName : Int // Its an example of single Line comment

/// Multi Line Comments :
/*
 This is an example of Multi-Line comment
 */
/// Comments Gives more understandings about the code and also we can provide Comments with Certain meaningful Keywords:
/// EXAMPLE SITUATION :
///
///Its a function to add two numbers
func add(_ a: Int, _ b: Int ) -> Int {
    //TODO: Write a logic to add two numbers
    //FIXME: Make Function to add double or other type of values too
    return a + b
}

add(2,3)

/// Documentation Commenting:
/// We can document code using commenting Swift Provide Strong Documentation Support using Comments,
/// Example:

///This is a function to find Factorial of a number
///
///```
///factorial(of: 4)
///// Will return `4`
///
///```
///-    Parameters:
///     - of : The number to find factorial
///-    Returns: Factorial of provided number
func factorial(of a: Int) -> Int {
    if a == 1 || a == 0 {
        return 1
    }
    else {
        return a * factorial(of: a - 1)
    }
}
///Press option and hover on the function invokation to  see the function Documentation
factorial(of: 4)


/// In this method Swift provides clean and Quick documentation support.
