import System.Random

checkWinner :: Int -> Int -> IO ()
checkWinner playerMove aiMove
    -- Checks conditionals using guards and prints winner message or loser message
    | playerMove == 1 && aiMove == 2 = putStrLn "YOU LOSE! You chose Rock and AI chose Paper"
    | playerMove == 2 && aiMove == 3 = putStrLn "YOU LOSE! You chose Paper and AI chose Scissors"
    | playerMove == 3 && aiMove == 1 = putStrLn "YOU LOSE! You chose Scissors and AI chose Rock"
    | playerMove == 2 && aiMove == 1 = putStrLn "YOU WIN! You chose Paper and AI chose Rock"
    | playerMove == 3 && aiMove == 2 = putStrLn "YOU WIN! You chose Scissors and AI chose Paper"
    | playerMove == 1 && aiMove == 3 = putStrLn "YOU WIN! You chose Rock and AI chose Scissors"
    | otherwise = do
        -- If tie, ask user if they want to play again using user input.
        -- If yes, run checkInput function to play again
        -- If no, print thank you message
        putStrLn "Its a tie! Play again? (y/n)"
        playAgain <- getLine
        if playAgain == "y"
            then checkInput
        else 
            putStrLn "Thanks for playing!"

checkInput :: IO ()
checkInput = do
    -- Gets user input & converts it into an Int
    putStrLn "Choose a number! 1(Rock) 2(Paper) 3(Scissors)"
    playerMoveStr <- getLine
    let playerMove = read playerMoveStr::Int

    -- Generates random AI move from 1 to 3
    aiMove <- randomRIO (1, 3)

    -- Check if user input is not in range. If true, print error message and recursively call the function checkInput
    -- If false, call checkWinner function and pass playerMove and aiMove
    if not (elem playerMove [1, 2, 3])
        then do 
            putStrLn "INVALID NUMBER!"
            checkInput
    else 
        checkWinner playerMove aiMove

main :: IO ()
main = do
    checkInput