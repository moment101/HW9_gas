// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";
import {ERC721Enumerable} from "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {ERC721A} from "erc721a/ERC721A.sol";

contract EnumerableNTF is ERC721Enumerable, Ownable {
    constructor() ERC721("EnumerableNFT", "ENFT") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://example.com/enumerableNFT/";
    }

    function eMint(address to) public onlyOwner {
        uint tokenId = totalSupply();
        _safeMint(to, tokenId);
    }

    function eTransfer(address from, address to, uint256 tokenId) public {
        _transfer(from, to, tokenId);
    }

    function eApprove(address to, uint256 tokenId) public {
        _approve(to, tokenId);
    }

    function eBurn(uint256 tokenId) public {
        _burn(tokenId);
    }
}

contract AzukiNFT is ERC721A, Ownable {
    constructor() ERC721A("Azuki", "ANFT") {}

    function aMint(address to, uint256 quantity) public onlyOwner {
        _mint(to, quantity);
    }

    function aTransfer(address from, address to, uint256 tokenId) public {
        transferFrom(from, to, tokenId);
    }

    function aApprove(address to, uint256 tokenId) public {
        approve(to, tokenId);
    }

    function aBurn(uint256 tokenId) public {
        _burn(tokenId);
    }
}
