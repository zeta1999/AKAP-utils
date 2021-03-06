// Copyright (C) 2020  Christian Felde

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

pragma solidity ^0.5.0;

import "akap/contracts/IAKAP.sol";
import "../domain/DomainManager.sol";
import "../types/StringLib.sol";
import "../types/Uint256Lib.sol";

contract ForTestB {
    using StringLib for string;
    using Uint256Lib for uint;

    // These are set in the proxy and are
    // only here to maintain contract storage structure
    DomainManager public dm;
    IAKAP public akap;
    uint public rootPtr;

    constructor() public {}

    function value1() external pure returns (uint) {
        return 2;
    }

    function value2() external view returns (bytes memory) {
        string memory key = "k1";
        uint valuePtr = akap.hashOf(rootPtr, key.asBytes());
        return akap.nodeBody(valuePtr);
    }

    function action1() external {
        string memory key = "k2";
        uint valuePtr = akap.hashOf(rootPtr, key.asBytes());

        if (!akap.exists(valuePtr)) {
            require(dm.claim(rootPtr, key.asBytes()) > 0, "ForTestB: Unable to claim");
        }

        uint value = 222;
        akap.setNodeBody(valuePtr, value.asBytes());
    }
}
