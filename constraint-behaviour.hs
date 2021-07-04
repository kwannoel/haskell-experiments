module Main where

-- | We want to demonstrate what is possible or not with Constraints.
-- Constraints are declared in the form:
-- class ((Constraint a b ...), ...) => Constraint a b ...
--         Tail                         Head
--
-- 1. A Constraint is resolved in the following manner:
-- Head -> Tail
--
-- 2. So if we are unable to match on any "Head"
-- This denotes that the constraints are unable to be satisfied.
--
-- 3. In multi constraint parameter classes,
-- If we match on multiple "Heads", this fails.
-- Reason being
--
-- Declare indexed instances?
