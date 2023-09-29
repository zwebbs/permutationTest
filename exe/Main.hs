-- File Name: Main.hs
-- Created By: ZW
-- Created On: 2023-09-29
-- Purpose: Defines the main execution routine of the permutationTest
--  program. the program takes as input a TSV file with the first
--  column representing some observed values, and every subsequent
--  column representing a binary grouping on which the permutation test 
--  groupings are calculated.


module Main where

import Options.Applicative (execParser)
import Handle (getColumnLists, splitColumnLists, prepareData)
import CmdLine (userInput, opts, seed)
import System.Random (mkStdGen)


{-- define main execution routine for the executable--}
main :: IO ()
main = do
    options <- execParser opts
    let rgen = mkStdGen (seed options)
    dset <- prepareData . splitColumnLists . getColumnLists . lines
                 <$> readFile (userInput options)

    --run tokens (seed options) (numIters options)
    putStrLn "Goodbye"