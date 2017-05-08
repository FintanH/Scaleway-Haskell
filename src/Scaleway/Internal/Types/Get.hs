{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE GADTs                 #-}
{-# LANGUAGE KindSignatures        #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PolyKinds             #-}

module Scaleway.Internal.Types.Get
    ( HasResourceName(..)
    , HasResourceId (..)
    , GetServer
    , GetVolume
    , GetImage
    , GetOrganization
    , GetUser
    , GetSnapshot
    , GetSecurityGroup
    , GetSecurityRule
    , GetToken
    , getServer
    , listServer
    , getVolume
    , listVolume
    , getImage
    , listImage
    , getOrganization
    , listOrganization
    , getUser
    , listUser
    , getSnapshot
    , listSnapshot
    , getSecurityGroup
    , listSecurityGroup
    , getSecurityRule
    , listSecurityRule
    , getToken
    , listToken
    ) where

import           Data.Text                          (Text)
import           Scaleway.Internal.Types.ResourceId (HasResourceId (..),
                                                     ImageId, OrganizationId,
                                                     ResourceId (..),
                                                     SecurityGroupId,
                                                     SecurityRuleId, ServerId,
                                                     SnapshotId, TokenId,
                                                     UserId, VolumeId)

data ResourceType = ServerResource
                  | VolumeResource
                  | ImageResource
                  | OrganizationResource
                  | UserResource
                  | SnapshotResource
                  | SecurityGroupResource
                  | SecurityRuleResource
                  | TokenResource

class HasResourceName f a where
  getResourceNamePlural   :: f -> a
  getResourceNameSingular :: f -> a

data ScalewayGET i = ListResource
                   | GetResource i

data GET :: ScalewayGET i -> ResourceType -> * where
  GetServerR :: ServerId -> GET (GetResource ServerId) ServerResource
  ListServerR :: GET ListResource ServerResource
  GetVolumeR :: VolumeId -> GET (GetResource VolumeId) VolumeResource
  ListVolumeR :: GET ListResource VolumeResource
  GetImageR :: ImageId -> GET (GetResource ImageId) ImageResource
  ListImageR :: GET ListResource ImageResource
  GetOrganizationR :: OrganizationId -> GET (GetResource OrganizationId) OrganizationResource
  ListOrganizationR :: GET ListResource OrganizationResource
  GetUserR :: UserId -> GET (GetResource UserId) UserResource
  ListUserR :: GET ListResource UserResource
  GetSnapshotR :: SnapshotId -> GET (GetResource SnapshotId) SnapshotResource
  ListSnapshotR :: GET ListResource SnapshotResource
  GetSecurityGroupR :: SecurityGroupId -> GET (GetResource SecurityGroupId) SecurityGroupResource
  ListSecurityGroupR :: GET ListResource SecurityGroupResource
  GetSecurityRuleR :: SecurityRuleId -> GET (GetResource SecurityRuleId) SecurityRuleResource
  ListSecurityRuleR :: GET ListResource SecurityRuleResource
  GetTokenR :: TokenId -> GET (GetResource TokenId) TokenResource
  ListTokenR :: GET ListResource TokenResource

-- | Aliases for our GADT GetResource result types
type GetServer = GET (GetResource ServerId) ServerResource
type GetVolume = GET (GetResource VolumeId) VolumeResource
type GetImage = GET (GetResource ImageId) ImageResource
type GetOrganization = GET (GetResource OrganizationId) OrganizationResource
type GetUser = GET (GetResource UserId) UserResource
type GetSnapshot = GET (GetResource SnapshotId) SnapshotResource
type GetSecurityGroup = GET (GetResource SecurityGroupId) SecurityGroupResource
type GetSecurityRule = GET (GetResource SecurityRuleId) SecurityRuleResource
type GetToken = GET (GetResource TokenId) TokenResource

getServer :: Text -> GetServer
getServer = GetServerR . ResourceId

listServer :: GET ListResource ServerResource
listServer = ListServerR

getVolume :: Text -> GetVolume
getVolume = GetVolumeR . ResourceId

listVolume :: GET ListResource VolumeResource
listVolume = ListVolumeR

getImage :: Text -> GetImage
getImage = GetImageR . ResourceId

listImage :: GET ListResource ImageResource
listImage = ListImageR

getOrganization :: Text -> GetOrganization
getOrganization = GetOrganizationR . ResourceId

listOrganization :: GET ListResource OrganizationResource
listOrganization = ListOrganizationR

getUser :: Text -> GetUser
getUser = GetUserR . ResourceId

listUser :: GET ListResource UserResource
listUser = ListUserR

getSnapshot :: Text -> GetSnapshot
getSnapshot = GetSnapshotR . ResourceId

listSnapshot :: GET ListResource SnapshotResource
listSnapshot = ListSnapshotR

getSecurityGroup :: Text -> GetSecurityGroup
getSecurityGroup = GetSecurityGroupR . ResourceId

listSecurityGroup :: GET ListResource SecurityGroupResource
listSecurityGroup = ListSecurityGroupR

getSecurityRule :: Text -> GetSecurityRule
getSecurityRule = GetSecurityRuleR . ResourceId

listSecurityRule :: GET ListResource SecurityRuleResource
listSecurityRule = ListSecurityRuleR

getToken :: Text -> GetToken
getToken = GetTokenR . ResourceId

listToken :: GET ListResource TokenResource
listToken = ListTokenR

instance HasResourceId GetServer Text where
  getResourceId (GetServerR serverId) = getResourceId serverId

instance HasResourceName GetServer String where
  getResourceNamePlural   _ = "servers"
  getResourceNameSingular _ = "server"

instance HasResourceName (GET ListResource ServerResource) String where
  getResourceNamePlural   _ = "servers"
  getResourceNameSingular _ = "server"

instance HasResourceId GetVolume Text where
  getResourceId (GetVolumeR volumeId) = getResourceId volumeId

instance HasResourceName GetVolume String where
  getResourceNamePlural   _ = "volumes"
  getResourceNameSingular _ = "volume"

instance HasResourceName (GET ListResource VolumeResource) String where
  getResourceNamePlural   _ = "volumes"
  getResourceNameSingular _ = "volumes"

instance HasResourceId GetImage Text where
  getResourceId (GetImageR imageId) = getResourceId imageId

instance HasResourceName GetImage String where
  getResourceNamePlural   _ = "images"
  getResourceNameSingular _ = "image"

instance HasResourceName (GET ListResource ImageResource) String where
  getResourceNamePlural   _ = "images"
  getResourceNameSingular _ = "image"

instance HasResourceId GetOrganization Text where
  getResourceId (GetOrganizationR organizationId) = getResourceId organizationId

instance HasResourceName GetOrganization String where
  getResourceNamePlural   _ = "organizations"
  getResourceNameSingular _ = "organization"

instance HasResourceName (GET ListResource OrganizationResource) String where
  getResourceNamePlural   _ = "organizations"
  getResourceNameSingular _ = "organization"

instance HasResourceId GetUser Text where
  getResourceId (GetUserR userId) = getResourceId userId

instance HasResourceName GetUser String where
  getResourceNamePlural   _ = "users"
  getResourceNameSingular _ = "user"

instance HasResourceName (GET ListResource UserResource) String where
  getResourceNamePlural   _ = "users"
  getResourceNameSingular _ = "user"

instance HasResourceId GetSnapshot Text where
  getResourceId (GetSnapshotR snapshotId) = getResourceId snapshotId

instance HasResourceName GetSnapshot String where
  getResourceNamePlural   _ = "snapshots"
  getResourceNameSingular _ = "snapshot"

instance HasResourceName (GET ListResource SnapshotResource) String where
  getResourceNamePlural   _ = "snapshots"
  getResourceNameSingular _ = "snapshot"

instance HasResourceId GetSecurityGroup Text where
  getResourceId (GetSecurityGroupR securityGroupId) = getResourceId securityGroupId

instance HasResourceName GetSecurityGroup String where
  getResourceNamePlural   _ = "security_groups"
  getResourceNameSingular _ = "security_group"

instance HasResourceName (GET ListResource SecurityGroupResource) String where
  getResourceNamePlural   _ = "security_groups"
  getResourceNameSingular _ = "security_group"

instance HasResourceId GetSecurityRule Text where
  getResourceId (GetSecurityRuleR securityRuleId) = getResourceId securityRuleId

instance HasResourceName GetSecurityRule String where
  getResourceNamePlural   _ = "security_rules"
  getResourceNameSingular _ = "security_rule"

instance HasResourceName (GET ListResource SecurityRuleResource) String where
  getResourceNamePlural   _ = "security_rules"
  getResourceNameSingular _ = "security_rule"

instance HasResourceId GetToken Text where
  getResourceId (GetTokenR tokenId) = getResourceId tokenId

instance HasResourceName GetToken String where
  getResourceNamePlural   _ = "tokens"
  getResourceNameSingular _ = "token"

instance HasResourceName (GET ListResource TokenResource) String where
  getResourceNamePlural   _ = "tokens"
  getResourceNameSingular _ = "token"