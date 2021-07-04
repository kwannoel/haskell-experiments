{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import Data.Void (Void)
import Data.Type.Equality
import Data.Kind

class Fail a where

class C a b where
    v :: a

instance (If (Not (b == c)) (C a c) (Fail Void)) => C a b where
    v = v

type family If p (x :: Constraint) (y :: Constraint) where
    If True x y = x
    If False x y = y

type family Not p where
    Not True = False
    Not False = True

main :: IO ()
main = undefined
