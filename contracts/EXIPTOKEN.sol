// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "./SafeOwn.sol";


contract EXIPTOKEN is ERC20, Pausable, SafeOwn {
    constructor() ERC20("EXIP", "EXIP") SafeOwn(0) {
        _mint(msg.sender, 2100000 * 10**decimals());
    }

    function getOwner() public view virtual returns (address) {
        return Owner();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override whenNotPaused {
        super._beforeTokenTransfer(from, to, amount);
    }
}
