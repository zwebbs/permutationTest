-- File Name: Permute.hs
-- Created By: ZW
-- Created On: 2023-09-25
-- Purpose: define functions that generate list permutations 
--   for our permutation test.


-- module namespace statement
module Permute (
    randomSelect,
    shuffle,
    getShuffleSet) where

-- import basic utils for random number generation
import System.Random


{--
 define a function which takes a random generator G,
 a list A, and the length of the list L, and returns a
 3-tuple of: (1) a randomly selected list element,
 (2) the remainder of the list minus the selected element,
 and (3) the output random generator that randomR gives us after completion
--}
randomSelect :: RandomGen g => g -> [a] -> Int -> (a, [a], g)
randomSelect _ [] _ = error "Cannot Select on Empty List"
randomSelect g [x] _ = (x, [], g)
randomSelect g (x:xs) l = ((x:xs) !! i, (take i (x:xs)) ++ (drop (i+1) (x:xs)), g1) where 
    (i, g1) = randomR (0, l-1) g


{-- 
 define a function that takes a random generator g
 ,a list A, and the length of the list l and returns
 a shuffled list of A where the elements are rearranged.
--}
shuffle :: RandomGen g => g -> [a] -> Int -> [a]
shuffle _ [] _ = []
shuffle _ [x] _ = [x]
shuffle g (x:xs) l =  [v1] ++ v2 where
    (v1,r1,g1) = randomSelect g (x:xs) l
    v2 = shuffle g1 r1 (l-1)


{--
 define a function that takes a random generator g, a list A, the length
 of A, l, and the number of shuffles N and returns a list of lists where
 each element is a shuffled ordering of A. the number of these shuffled
 orderings is determined by N.
--}
getShuffleSet :: (RandomGen g) => g -> [a] -> Int -> Int -> [[a]]
getShuffleSet g a l n = map shuffleHelper seeds where
    seeds = map mkStdGen (take n $ randoms g)
    shuffleHelper seed = shuffle seed a l
