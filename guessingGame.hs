import System.Random

-- If user guesses wrong, prints hint to the user and calls the guessNumber function to get another guess
-- If user guesses correctly, prints winner message
calculate :: Int -> Int -> IO ()
calculate guess number = do
    if guess > number
        then do 
            putStrLn "Guess Lower!"
            guessNumber number
    else if guess < number
        then do
            putStrLn "Guess Higher!"
            guessNumber number
    else putStrLn ("You guessed correctly! The number was " ++ show number)

-- Gets guess from the user and passes that guess and numberToGuess to the calculate function
guessNumber :: Int -> IO ()
guessNumber number = do
    putStrLn "Guess the number from 1 to 100"
    userInput <- getLine
    let guess = read userInput::Int

    -- If number is not in range, error message is displayed & guessNumber is recursively called,
    -- else, calls the calculate function & passes the guess and the number
    if not (elem guess [1 .. 100])
        then do
            putStrLn "INVALID NUMBER"
            guessNumber number
    else calculate guess number


main :: IO ()
main = do
    -- Generates a random number from 1 to 100 and assigns it to the numberToGuess variable
    numberToGuess <- randomRIO (1, 100)

    -- Calls the guessNumber function and passes numberToGuess
    guessNumber numberToGuess