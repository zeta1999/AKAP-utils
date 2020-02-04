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

library Uint256Lib {
    function asBytes(uint256 x) internal pure returns (bytes memory b) {
        b = new bytes(0x20);
        assembly {
            mstore(add(b, 0x20), x)
        }
    }
}
