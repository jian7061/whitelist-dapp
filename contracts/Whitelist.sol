//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Whitelist {
    uint8 public maxWhitelistedAddresses;
    mapping(address=>bool) public whitelistAddressed;
    uint8 public numAddressedWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        //check if the user has already been whitelisted.
        require(!whitelistAddressed[msg.sender],"Sender has already been whitelisted.");
        //check if the numAddressedWhitelisted < maxWhitelistedAddresses;
        require(numAddressedWhitelisted<maxWhitelistedAddresses,"More addresses can not be added.");
        whitelistAddressed[msg.sender]= true;
        numAddressedWhitelisted +=1;
    }
}
