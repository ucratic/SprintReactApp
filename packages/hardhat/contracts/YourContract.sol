pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
//import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {

  //event SetPurpose(address sender, string purpose);

  string public purpose = "Building Unstoppable Apps!!!";

  constructor() {
    // what should we do on deploy?
  }

  function setPurpose(string memory newPurpose) public {
      purpose = newPurpose;
      console.log(msg.sender,"set purpose to",purpose);
      //emit SetPurpose(msg.sender, purpose);
  }

}

contract CreaterDAO{

    enum communityApplication{
      notApproved,
      approved
    }

    struct communityMember{
      string memberName;
      bool isVerified;
      address payable communityMemberAddress;
    }

    struct Creator{
      string creatorName;
      string creatorID;
      communityApplication application;
      bool isVerified;
      address payable creatorAddress;
      string[] communityMembers;
    } 


    mapping(address => Creator) public creatorByAddress;
    mapping(address => communityMember) public communityMemberByAddress;
    mapping(address=>bool) public isVerifiedCommunityMember;


    event communityApplicationCreated(
      uint256 applicationId,
      string creatorID
    );

    constructor() public {
        // setPublicChainlinkToken();
    }
    
    // function addressToString(address _address) public pure returns (string memory _uintAsString) {
    //       uint _i = uint256(_address);
    //       if (_i == 0) {
    //           return "0";
    //       }
    //       uint j = _i;
    //       uint len;
    //       while (j != 0) {
    //           len++;
    //           j /= 10;
    //       }
    //       bytes memory bstr = new bytes(len);
    //       uint k = len - 1;
    //       while (_i != 0) {
    //           bstr[k--] = byte(uint8(48 + _i % 10));
    //           _i /= 10;
    //       }
    //       return string(bstr);
    //  }


      function verifyCommunityMemberProfile(
        string memory _name,
       //verifying community members by a twitter post asking to join creators community.
        string memory _tweetUrl,
        string memory creatorID
      ) public returns (bool) {
        require(!isVerifiedCommunityMember[msg.sender], "already verified");
        // check if LINK was sent as gas
        // chainlinkVerifier(_tweetUrl, addressToString(msg.sender));
        // require(done.toString()== "true" , 'not verified');
        communityMember memory s = communityMember(
            payable(msg.sender),
            _name,
            true,
            
        );
        scholarByAddress[msg.sender] = s;
        isVerifiedScholar[msg.sender] = true;

        emit ScholarVerified(payable(msg.sender), _name, _fields, _subFields, _tweetUrl);

        return true;
    }



}

    

    