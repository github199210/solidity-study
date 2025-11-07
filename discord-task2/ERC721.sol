// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract MyNFT is ERC721{

    using Strings for uint256;

    uint256 public counter = 0;

    constructor (string memory _name, string memory _symbol) ERC721(_name, _symbol){}
    
    function tokenURI(uint256 tokenId) public pure override returns (string memory) {
        return string(abi.encodePacked("https://blush-biological-takin-468.mypinata.cloud/ipfs/bafybeia6w73czr2n63mq3lmbeirah57h3oorw3ku4lgel2bdiakxq64ojy/", (tokenId+1).toString(), ".json")); 
    }

    function mint (uint256 amount) external{
        for(uint256 i=0; i < amount ; i++){
                _mint(msg.sender, counter);
                counter ++ ;
        }
    }
}
