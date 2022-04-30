// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract MyErc1155 is ERC1155, Ownable {
    constructor() ERC1155("ipfs://bafybeig5w3hluoqbotpdfhienw26m5wjshnb37gb2b7gahhslujriq5pk4/") {}

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }

    function tokenURI(uint256 _tokenId) external view returns (string memory) {
        return string(abi.encodePacked(
            uri(), Strings.toString(_tokenId)
        ));
    }

    function uri(uint256 _tokenId) public view virtual override returns (string memory) {
        return string(abi.encodePacked(
            uri(), Strings.toString(_tokenId)
        ));
    }

    function uri() public view returns (string memory) {
        return super.uri(0);
    }
}
