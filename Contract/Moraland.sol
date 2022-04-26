// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Moraland is ERC721URIStorage {
    event Assigned(
        bytes bytesId,
        uint256 indexed tokenId,
        address indexed assignee
    );

    constructor() ERC721("Moraland", "MLND") {}

    function exist(bytes calldata bytesId) public view returns (bool) {
        uint256 _tokenId = abi.decode(bytesId, (uint256));
        return _exists(_tokenId);
    }

    function assign(bytes calldata bytesId, string calldata tokenURI) public {
        uint256 _tokenId = abi.decode(bytesId, (uint256));
        _mint(msg.sender, _tokenId);
        _setTokenURI(_tokenId, tokenURI);
        emit Assigned(bytesId, _tokenId, msg.sender);
    }
}
