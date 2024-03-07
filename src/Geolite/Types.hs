module Geolite.Types where

import Data.Fixed
import Data.Text (Text)
import Net.Types (IPv4Range)

data E4

instance HasResolution E4 where
  resolution _ = 4

newtype GeonameId = GeonameId {getGeonameId :: Int}
  deriving (Show, Read, Eq, Ord)

data City = City
  { cityGeonameId :: GeonameId
  , cityLocaleCode :: Text
  , cityContinentCode :: Text
  , cityContinentName :: Text
  , cityCountryIsoCode :: Text
  , cityCountryName :: Text
  , citySubdivision1IsoCode :: Text
  , citySubdivision1Name :: Text
  , citySubdivision2IsoCode :: Text
  , citySubdivision2Name :: Text
  , cityName :: Text
  , cityMetroCode :: Maybe Int
  , cityTimeZone :: Text
  }
  deriving (Show, Read, Eq, Ord)

data Block = Block
  { blockNetwork :: IPv4Range
  , blockGeonameId :: Maybe GeonameId
  , blockRegisteredCountryGeonameId :: Maybe GeonameId
  , blockRepresentedCountryGeonameId :: Maybe GeonameId
  , blockIsAnonymousProxy :: Bool
  , blockIsSatelliteProvider :: Bool
  , blockPostalCode :: Text
  , blockLatitude :: Maybe (Fixed E4)
  , blockLongitude :: Maybe (Fixed E4)
  , blockAccuracyRadius :: Maybe Int
  }
  deriving (Show, Read, Eq, Ord)
