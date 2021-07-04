{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE UndecidableInstances #-}

module Main where

class C a b where
    v :: a

instance {-# OVERLAPPING #-} C Int String where
    v = 1

instance {-# OVERLAPPABLE #-} C Int b where
    v = 2

main :: IO ()
main = print (v :: Int)
