// DONT USE THIS FILE CANT FIND THE ERROR //




pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

// import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

// TODO: error with "identifier not found VRFConsumerBase, can't figure it out when adding randomness"
// contract NFTContract is ERC1155, Ownable, VRFConsumerBase { 
contract NFTContract is ERC1155, Ownable { 

    uint256 public constant ILLUSTRATION = 0;
    uint256 public constant REAL = 1;

    address internal ownerAddr = msg.sender;

    // use VRF when minting make it a coin flip chance of which tree to get.
    /* TODO
    address _linkToken = 0x01BE23585060835E02B77ef475b0Cc51aA1e0709;
    address _vrfCoordinator = 0xb3dCcb4Cf7a26f6cf6B120Cf5A73875B7BBc655B;
    bytes32 _keyHash =  0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311;
    uint256 _chainlinkFee = 0.1 * 10 ** 18; // 0.1 LINK
    */
    // temp use index number;
    uint256 public random_number = 0;

    // list all qualified non profits
    string[] public nonProfits;

    // store deposits for nft
    // TODO: find a way to attach deposit funds to specific NFT
    // for now just store with map accounts

    mapping( address => uint ) public balances;

    constructor() ERC1155("https://47dphsm4sfpy.usemoralis.com/{id}.json") {}

    function  mint() public payable {
        _mint(msg.sender, random_number, 1, "");
        balances[msg.sender] = msg.value;
    }

    function addNonProfit(string memory nonProfit) public {
        require(msg.sender == ownerAddr, "Only owner can add non-profits.");
        nonProfits.push(nonProfit);
    }

    
    function withdrawDeposit(uint amount) public {
        require( amount <= balances[msg.sender], "You can not withdraw more then you have deposited." );
        // todo: send funds to user;
    }

    // todo: reload balance
    // code...

}

