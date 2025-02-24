// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgTOUri() public view {
        string
            memory expectedURI = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/Pjxzdmcgdmlld0JveD0iMCAwIDIwMCAyMDAiIHdpZHRoPSI0MDAiICBoZWlnaHQ9IjQwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48Y2lyY2xlIGN4PSIxMDAiIGN5PSIxMDAiIGZpbGw9InllbGxvdyIgcj0iNzgiIHN0cm9rZT0iYmxhY2siIHN0cm9rZS13aWR0aD0iMyIvPjxnIGNsYXNzPSJleWVzIj48Y2lyY2xlIGN4PSI3MCIgY3k9IjgyIiByPSIxMiIvPjxjaXJjbGUgY3g9IjEyNyIgY3k9IjgyIiByPSIxMiIvPjwvZz4gPHBhdGggZD0ibTEzNi44MSAxMTYuNTNjLjY5IDI2LjE3LTY0LjExIDQyLTgxLjUyLS43MyIgc3R5bGU9ImZpbGw6bm9uZTsgc3Ryb2tlOiBibGFjazsgc3Ryb2tlLXdpZHRoOiAzOyIvPjwvc3ZnPg==";
        string
            memory svg = '<?xml version="1.0" standalone="no"?><svg viewBox="0 0 200 200" width="400"  height="400" xmlns="http://www.w3.org/2000/svg"><circle cx="100" cy="100" fill="yellow" r="78" stroke="black" stroke-width="3"/><g class="eyes"><circle cx="70" cy="82" r="12"/><circle cx="127" cy="82" r="12"/></g> <path d="m136.81 116.53c.69 26.17-64.11 42-81.52-.73" style="fill:none; stroke: black; stroke-width: 3;"/></svg>';
        string memory actualUri = deployer.svgToImageURI(svg);
        assertEq(
            keccak256(abi.encodePacked(actualUri)),
            keccak256(abi.encodePacked(expectedURI))
        );
    }
}
