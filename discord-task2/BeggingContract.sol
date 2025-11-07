// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.20;

contract BeggingContract {
    mapping(address => uint256) public donor;
    address owner;
    address[] public donors;
    uint256 public startTime;

    event Donate(address indexed sender, uint256 amount);

    constructor() {
        owner = msg.sender;
        startTime=block.timestamp;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "not contract owner");
        _;
    }

    modifier donateTimeRange(){
       require( block.timestamp <=startTime + 7 days,"donations closed");
         _;
    }

    modifier donorNumber(){
        require(donors.length>0,"no donors yet");
        _;
    }

    function donate() public payable donateTimeRange{
        require(msg.value>0,'amount must > 0');
        donor[msg.sender] = msg.value;
        donors.push(msg.sender);
        emit Donate(msg.sender,msg.value);

    }

    function withdraw() public payable onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }


    function getDonation(address donorAddress) public view returns (uint256) {
        return donor[donorAddress];
    }

    function top3() public view donorNumber returns (address[3] memory) {
         address[] memory tempDonors=donors;
         for (uint i=0; i<tempDonors.length; i++) 
         {
            uint256 temp=donor[tempDonors[i]];
            uint256 j=i;
            while ((j>=1)&&temp>donor[tempDonors[j-1]]) {
                tempDonors[j]=tempDonors[j-1];
                j--;
            }
         }
        return [tempDonors[0],tempDonors[1],tempDonors[2]];
         
    }
}
