// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";

contract EXIPTLD is
    ERC721,
    ERC721Enumerable,
    ERC721URIStorage,
    Pausable,
    AccessControl,
    ERC721Burnable
{
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant DELEGATE_ROLE = keccak256("DELEGATE_ROLE");
    uint256 public nextTokenId = 0;

    constructor() ERC721("EXIPTLD", "EXIPT") {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(PAUSER_ROLE, msg.sender);
        _setupRole(MINTER_ROLE, msg.sender);
    }

    function pause() public {
        require(hasRole(PAUSER_ROLE, msg.sender));
        _pause();
    }

    function unpause() public {
        require(hasRole(PAUSER_ROLE, msg.sender));
        _unpause();
    }

    function safeMint(address to, uint256 tokenId) public {
        require(hasRole(MINTER_ROLE, msg.sender));
        _safeMint(to, tokenId);
        nextTokenId = tokenId + 1;
    }

    function safeMint(
        address to,
        uint256 tokenId,
        string memory _tokenURI
    ) public {
        require(hasRole(MINTER_ROLE, msg.sender));
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, _tokenURI);
        nextTokenId = tokenId + 1;
    }

    function mint(address to) public {
        require(hasRole(MINTER_ROLE, msg.sender));
        _safeMint(to, nextTokenId);
        nextTokenId = nextTokenId + 1;
    }

    function mint(address to, string memory _tokenURI) public {
        require(hasRole(MINTER_ROLE, msg.sender));
        _safeMint(to, nextTokenId);
        _setTokenURI(nextTokenId, _tokenURI);
        nextTokenId = nextTokenId + 1;
    }

    function delegateMint(address to) public onlyRole(DELEGATE_ROLE) {
        _safeMint(to, nextTokenId);
        nextTokenId = nextTokenId + 1;
    }

    function delegateMint(address to, string memory _tokenURI)
        public
        onlyRole(DELEGATE_ROLE)
    {
        _safeMint(to, nextTokenId);
        _setTokenURI(nextTokenId, _tokenURI);
        nextTokenId = nextTokenId + 1;
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal override(ERC721, ERC721Enumerable) whenNotPaused {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(tokenId);
    }

    function setTokenURI(uint256 tokenId, string memory _tokenURI) public {
        require(hasRole(MINTER_ROLE, msg.sender));
        _setTokenURI(tokenId, _tokenURI);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
