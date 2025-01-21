import Data.Text.IO as Text
import Data.Text as Text
import Data.Map as Map
import System.Environment

main = do
  [file] <- getArgs
  words <- Text.readFile file
  let letters = toMultiset words
  mapM (Text.putStrLn . showEntry) (Map.toList letters)

showEntry :: (Char, Int) -> Text
showEntry (c, n) = pack [c] <> pack ":" <> pack (show n)

toMultiset :: Text -> Map Char Int
toMultiset = Text.foldr toMultiset' Map.empty

toMultiset' :: Ord key => key -> Map key Int -> Map key Int
toMultiset' k = insertWith (+) k 1
