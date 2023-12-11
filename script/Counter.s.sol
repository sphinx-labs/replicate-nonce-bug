// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import { Counter } from "../src/Counter.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        address broadcastingAddress = 0x4e59b44847b379578588920cA78FbF26c0B4956C;
        vm.startBroadcast(broadcastingAddress);
        Counter counter = new Counter(0);
        counter.increment();
        counter.increment();
    }
}
