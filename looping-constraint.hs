{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE UndecidableSuperClasses #-}


module Main where

import Data.Kind (Constraint)

type family Clsish u a :: Constraint
type instance Clsish () a = Cls a
class Clsish () a => Cls a where

-- Cls a -> Clsish () a
--  ↑          |
--  |___________|

main :: IO ()
main = undefined
