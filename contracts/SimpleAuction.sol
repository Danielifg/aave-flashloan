// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleAuction{
    address admin;
    uint8 highestBid;
    struct Bidder{
        string  name;
        address bidder;
        uint32 bid;
    }
    Bidder[] public bidders;
    mapping(address => uint8) refunds;
    constructor(address _admin){
        _admin = payable(msg.sender);
    }
    modifier onlyOwner{
        require(msg.sender == admin,
        'Only owner allowed to run this tx');
        _;
    }
    
    function bid(address _bidder, uint8 _amount) public {
        require(_bidder != admin, 'admin not allowed to bid');
        if(_amount > highestBid){
            refunds[_bidder] = _amount;
            _amount = highestBid;
        }
        address(this).balance;
    }

    function withdrawRefund(address payable _bidder) public payable{
        uint256 _withdraw = refunds[_bidder];

        for(uint i =0;i< bidders.length;i++){
            
        }
         _bidder.transfer(_withdraw);

    }

    function storeLoosers(){
        
    }

    function withdraw() public onlyOwner returns(uint)  {

    }

}
