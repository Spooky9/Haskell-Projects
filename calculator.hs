
-- Calculates equation based on the users operator. 
-- If no valid operator is chosen, "error" message is displayed and getEquation function is called
calculate :: Int -> String -> Int -> IO ()
calculate num1 operator num2
    | operator == "+" = print (num1 + num2)
    | operator == "-" = print (num1 - num2)
    | operator == "*" = print (num1 * num2)
    | operator == "/" = print (num1 `div` num2)
    | otherwise = do
        putStrLn "**ENTER A VALID OPERATOR**"
        getEquation

-- This function gets 2 numbers and an operator from the user and passes them to the calculate function
getEquation :: IO ()
getEquation = do
    -- Get first number from user and assign it to the variable "numOneStr"
    putStrLn "Enter first number: "
    numOneStr <- getLine
    -- Get operator from user and assign it to the variable "operator"
    putStrLn "Enter operation (+ , - ,  * , /)"
    operator <- getLine
    -- Get second number from user and assign it to the variable "numTwoStr"
    putStrLn "Enter second number: "
    numTwoStr <- getLine
    
    -- Converts the two numbers into integers and passes numOneStr, operator, numTwoStr to the calculate function
    calculate (read numOneStr::Int) operator (read numTwoStr::Int)


main :: IO ()
main = do
    -- Calls the getEquation function to start the program
    getEquation
