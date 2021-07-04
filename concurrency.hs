module Main where

import Control.Concurrent

main :: IO ()
main = do
    channel <- newChan
    forkIO $ writer channel
    reader channel
    return ()

writer :: Chan Int -> IO ()
writer channel = do
    writeChan channel 1

reader :: Chan Int -> IO ()
reader channel = do
    v <- readChan channel
    print $ "Read value: " ++ show v
