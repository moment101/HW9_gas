// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/NFT.sol";

contract NFTTest is Test {
    // Contract
    EnumerableNTF eNFT;
    AzukiNFT aNFT;

    // User
    address alice = makeAddr("Alice");
    address bob = makeAddr("Bob");
    address alex = makeAddr("Alex");

    function setUp() public {
        vm.deal(alice, 100 ether);
        vm.deal(bob, 100 ether);
        vm.deal(alex, 100 ether);

        vm.startPrank(alice);
        eNFT = new EnumerableNTF();
        aNFT = new AzukiNFT();
        vm.stopPrank();
        // mintSetup();
        mint10Setup();
    }

    // Test Mint
    function test_mint_10_EumerableNFT() external {
        vm.startPrank(alice);
        for (uint i = 0; i < 10; i++) {
            eNFT.eMint(bob);
        }
    }

    function test_mint_10_721A() external {
        vm.startPrank(alice);
        aNFT.aMint(bob, 10);
    }

    // Test Transfer
    function mintSetup() internal {
        vm.startPrank(alice);
        eNFT.eMint(bob);
        aNFT.aMint(bob, 1);
        vm.stopPrank();
    }

    function test_transfer_1_EumerableNFT() external {
        vm.startPrank(bob);
        eNFT.eTransfer(bob, alex, 0);
    }

    function test_transfer_1_721A() external {
        vm.startPrank(bob);
        aNFT.aTransfer(bob, alex, 0);
    }

    // Test Transfer Between
    function mint10Setup() internal {
        vm.startPrank(alice);
        eNFT.eMint(bob);
        eNFT.eMint(bob);
        eNFT.eMint(bob);
        eNFT.eMint(bob);
        eNFT.eMint(bob);
        aNFT.aMint(bob, 5);
        vm.stopPrank();
    }

    function test_transfer_between_EumerableNFT() external {
        vm.startPrank(bob);
        eNFT.eTransfer(bob, alex, 2);
    }

    function test_transfer_between_721A() external {
        vm.startPrank(bob);
        aNFT.aTransfer(bob, alex, 2);
    }

    // Test Approve
    function test_approve_1_EumerableNFT() external {
        vm.startPrank(bob);
        eNFT.eApprove(alex, 0);
    }

    function test_approve_1_721A() external {
        vm.startPrank(bob);
        aNFT.aApprove(alex, 0);
    }

    // Burn
    function test_burn_1_EumerableNFT() external {
        vm.startPrank(bob);
        eNFT.eBurn(0);
    }

    function test_burn_1_721A() external {
        vm.startPrank(bob);
        aNFT.aBurn(0);
    }

    function test_burn_between_EumerableNFT() external {
        vm.startPrank(bob);
        eNFT.eBurn(3);
    }

    function test_burn_between_721A() external {
        vm.startPrank(bob);
        aNFT.aBurn(3);
    }
}
