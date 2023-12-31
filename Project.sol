// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor() ERC20("My Token", "MYT") {
        _mint(msg.sender, 1000000 * (10**uint256(decimals())));
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
