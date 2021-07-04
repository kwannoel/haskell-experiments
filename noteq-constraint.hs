{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE AllowAmbiguousTypes #-}

module Main where

-- We want to establish a chain of trust

class Chain a b where
    trusted :: a -> b

-- Where if a is trusted, b is trusted

-- We want it to be composable also
instance () => Chain a c where
    trusted = trusted . trusted

class UniqueChain a b c d => Chain  where

-- The above fails to compile.
-- Suppose we call: Chain () String
-- matches Chain a c
--

instance Chain () Int where
    trusted _ = 1

instance Chain Int String where
    trusted = show

main :: IO ()
main = putStrLn $ (trusted () :: String)
