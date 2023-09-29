-- File Name: Parse.hs
-- Created By: ZW
-- Created On: 2023-09-29
-- Purpose: defines commandline parsers for use in the main permutationTest program


module Parse(
    userInput,
    numIters,
    seed,
    opts
            ) where


import Options.Applicative

{--
 define data types to handle input from the commandline
--}

data Args = Args {
    userInput :: FilePath,
    numIters :: Int,
    seed :: Int
}

{--
 Define commandline parsers for file input. 
 (either stdin or a text file)
--}
fileInput :: Parser FilePath
fileInput = strOption
    (long "file"
    <> short 'f'
    <> metavar "FILENAME"
    <> help "Input file")

numItersP :: Parser Int
numItersP = option auto
    (long "ntests"
    <> help "number of iterations for each permutation test"
    <> showDefault
    <> value 1000
    <> metavar "INT")  

seedP :: Parser Int
seedP = option auto
    (long "random-seed"
    <> help "random seed for reproducibility"
    <> metavar "INT")  

args :: Parser Args
args = Args <$> fileInput <*> numItersP <*> seedP


{--
 Define the ParserInfo object which collects the parsers
 defined above and binds it to a description/ help message
 for the end user. 
--}
opts :: ParserInfo Args
opts = info (args <**> helper)
    (fullDesc
    <> progDesc "Run statistical permutation tests on data passed by text files"
    <> header "")




