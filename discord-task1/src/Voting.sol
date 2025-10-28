// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// ✅ 创建一个名为Voting的合约，包含以下功能：
// 一个mapping来存储候选人的得票数
// 一个vote函数，允许用户投票给某个候选人
// 一个getVotes函数，返回某个候选人的得票数
// 一个resetVotes函数，重置所有候选人的得票数
contract Voting{ 
    // 候选人得票数、这一轮投票版本、给指定候选人投过票的人
    struct Candidate {
        uint value;
        uint version;
    }
    //当前投票版本
    uint public currentVersion;
    mapping (bytes32=>Candidate) public candidates;
    //当前地址是否投过票
    mapping(address=>bool) public voter;

    // 定义modifier
    modifier hasVoted {
        require(!voter[msg.sender],'The voter already voted.'); // 检查调用者是否投过票
        _; 
    }
    // 输入候选人姓名
    constructor(bytes32[] memory _candidateNames){
        require(_candidateNames.length > 0, "Empty candidate");
        for (uint i=0; i < _candidateNames.length; i++) {
            candidates[_candidateNames[i]]=Candidate({
                value:0,
                version:0
            });
        }
    }
  
    function vote(bytes32 _name) public hasVoted {
        if(candidates[_name].version!=currentVersion){
            candidates[_name].version=currentVersion;
            candidates[_name].value=0;
        }
        candidates[_name].value++;
    } 
     function getVotes(bytes32 _name) public view returns(uint){
        Candidate storage data=candidates[_name];
        return data.version==currentVersion?data.value:0;
    }
    function resetVotes() public{
        currentVersion++;
    }


}