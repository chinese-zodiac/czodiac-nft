//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CZodiacNFT is ERC721("CZodiacNFT", "CZodiac"), Ownable {
    uint256 public totalSupply;
    mapping(uint256 => string) public tokenURIs;
    mapping(address => bool) public minters;

    modifier onlyMinter {
        require(minters[msg.sender], "not minter");
        _;
    }

    function mint(string memory tokenURI_) external onlyMinter {
        tokenURIs[totalSupply] = tokenURI_;
        _mint(msg.sender, totalSupply);
        totalSupply ++;
    }

    /**
     * @dev See {IERC721Metadata-tokenURI}.
     */
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        return tokenURIs[tokenId];
    }

    function addMinter(address minter) external onlyOwner {
        minters[minter] = true;
    }

    function removeMinter(address minter) external onlyOwner {
        minters[minter] = false;
    }
}
