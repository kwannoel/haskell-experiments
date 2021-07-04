{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE AllowAmbiguousTypes #-}

module Main where

class C a b where
    v :: a

-- | Does not succeed:
-- if c ~ b -> we will go in the endless loop :)
instance C a c => C a b where
    v = v

main :: IO ()
main = undefined
