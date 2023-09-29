-- File Name: Stats.hs
-- Created By: ZW
-- Created On: 2023-09-29
-- Purpose: define functions for statistical operations relevant to 
--  permuation testing. 


module Stats (
    differenceInMeans
) where


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