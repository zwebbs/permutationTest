
module Handle (
    getColumnLists,
    splitColumnLists,
    prepareData,
    DataSet
) where

import Data.List (transpose)

data DataSet = DataSet {
    datHead :: [String],
    datVals :: [Double],
    datMasks :: [[Bool]] 
}


stringsToDoubles :: [String] -> [Double]
stringsToDoubles [] = []
stringsToDoubles (x:xs) = map (\y -> read y :: Double) (x:xs)

stringToBool :: String -> Bool
stringToBool "1" = True
stringToBool "true" = True
stringToBool "True" = True
stringToBool "0" = False
stringToBool "false" = False
stringToBool "False" = False
stringToBool _ = error "Cannot Parse String To Bool"

stringsToBools :: [String] -> [Bool]
stringsToBools = map stringToBool


getColumnLists :: [String] -> ([String],[[String]])
getColumnLists x = (words (head x), transpose (map words (tail x)))


splitColumnLists :: ([String],[[String]]) -> ([String],[String],[[String]])
splitColumnLists (h,x)
    | l > 1 = (h, head x, tail x)
    | otherwise = error "Malformed Data Error. please check input file"
    where l = length x


prepareData :: ([String],[String],[[String]]) -> DataSet
prepareData (h,v,m) = DataSet h vals masks where
    vals = stringsToDoubles v
    masks = map stringsToBools m