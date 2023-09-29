
cabal build && cabal install \
    --installdir='.' \
    --install-method=copy \
    --overwrite-policy=always

./permutationTest --file test/smalltest.tsv --ntests 1000 --random-seed 9248373