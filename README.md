# NFT Projects: MoodNft & BasicNft

This repository contains two Solidity smart contracts that demonstrate basic NFT implementations on Ethereum using the OpenZeppelin library with unit tests and integration tests.

- **MoodNft**: An ERC-721 token that reflects the owner’s mood. Each minted NFT starts as "Happy" and can have its mood toggled (flipped) between "Happy" and "Sad". The tokenURI dynamically returns metadata based on the current mood, encoded in Base64.
- **BasicNft**: A simple ERC-721 NFT contract that allows minting NFTs with a custom token URI.

---

## Contracts Overview

### MoodNft
- **Contract Name**: `MoodNft`
- **Key Features**:
  - Mints NFTs that start with a default mood ("Happy").
  - Allows the owner (or approved operator) to flip the NFT's mood between "Happy" and "Sad".
  - Dynamically generates token metadata (including an image URI) using Base64 encoding.
- **Key Functions**:
  - `mintNft()`: Mints a new NFT with an initial mood of "Happy".
  - `flipMood(uint256 tokenId)`: Flips the mood of the specified NFT. Only the owner or approved address can flip the mood.
  - `tokenURI(uint256 tokenId)`: Returns the metadata for the NFT based on its current mood.

### BasicNft
- **Contract Name**: `BasicNft`
- **Key Features**:
  - Mints NFTs with a user-defined token URI.
  - Maintains a mapping from token IDs to their corresponding URIs.
- **Key Functions**:
  - `mintNft(string memory tokenUri)`: Mints a new NFT with the provided token URI.
  - `tokenURI(uint256 tokenId)`: Returns the stored token URI for the NFT.

---


