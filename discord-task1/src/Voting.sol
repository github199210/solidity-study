// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// ✅ 创建一个名为Voting的合约，包含以下功能：
// 一个mapping来存储候选人的得票数
// 一个vote函数，允许用户投票给某个候选人
// 一个getVotes函数，返回某个候选人的得票数
// 一个resetVotes函数，重置所有候选人的得票数
contract Voting{ 
    // 候选人得票数及当前这一轮投票版本
    struct Candidate {
        bytes32 name;
        uint value;
        uint version;
    }
    Candidate[] candidates;
    // 输入候选人姓名
    constructor(bytes32[] memory _candidateNames){
        for (uint i=0; i < _candidateNames.length; i++) {
            candidates.push(Candidate({
                name:_candidateNames[i],
                value:0,
                version:0
            }));
        }
    }
    // 投票人姓名、是否投过票
    struct Voter{
        bool voted;
    }
    mapping(bytes32=>Voter) public voters;
    uint public currentVersion;

    function vote(bytes32 _name) public {
        if(candidate[_name].version!=currentVersion){
            candidate[_name].version=currentVersion;
            candidate[_name].value=0;
        }
        voters.push(Voter({
                name:_name,
                voted:true
            }));
        candidate[_name].value++;
    } 
     function getVotes(bytes32 name) public view returns(uint){
        Candidate storage data=candidate[name];
        return data.version==currentVersion?data.value:0;
    }
    function resetVotes() public{
        currentVersion++;
    }

}