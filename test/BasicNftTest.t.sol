// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "script/DeployBasicNft.s.sol";
import {BasicNft} from "src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deplyer;
    BasicNft public basicNft;
    address public USER = makeAddr("USER");
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deplyer = new DeployBasicNft();
        basicNft = deplyer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "CatNft";
        string memory acutalName = basicNft.name();
        assertEq(acutalName, expectedName);
    }

    function testSymbolIsCorrect() public view {
        string memory expectedSymbol = "Cat";
        string memory acutalSymbol = basicNft.symbol();
        assertEq(acutalSymbol, expectedSymbol);
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNft(PUG_URI);
        assert(basicNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(PUG_URI)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}
