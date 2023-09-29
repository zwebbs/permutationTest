-- File Name: Stats.hs
-- Created By: ZW
-- Created On: 2023-09-29
-- Purpose: define functions for statistical operations relevant to 
--  permuation testing. 


module Stats (
    differenceInMeans
) where

import System.Random (RandomGen)
import Permute

{--
 define a function that takes the difference in means using a list
 of observed values and a binary mask encoding the two groups.
--}
differenceInMeans :: [Bool] -> [Double] -> Double
differenceInMeans mask vals = group1 - group0 where
    num_mask = map (fromIntegral.fromEnum) mask
    inv_num_mask = map (fromIntegral.fromEnum.not) mask
    group1 = sum (zipWith (*) vals num_mask) / sum num_mask
    group0 = sum (zipWith (*) vals inv_num_mask) / sum inv_num_mask


{--
 define a function that takes a list of values and determines the
 empirical p-value from 
--}
--computePHat ::

{--
 define permutation test routine which inputs:
 (1) a random generator
  ()
 (5) a number of iterations to perform

 and returns:
 (1) a name of the test
 (2) a point estimate and confidence interval of the difference
 a list representing an experimental mask. the output is then the name of the 
 test, pvalues and estimated differences for each of the
 experiment masks provided 
--}
permutationTest :: RandomGen -> String -> [Double] -> [Bool] -> Int -> ([String], [Double], [Double])
permutationTest 