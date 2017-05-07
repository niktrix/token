pragma solidity 0.4.11;
 

contract Bitpoint        
{
    address creator;      
    uint256 public totalSupply;
    mapping (address => uint256) balances;
    
    function Bitpoint() public   
    {
        creator = msg.sender;
        
    }
    
     function () payable {
        uint amount = msg.value;
        balances[msg.sender] = amount;
        totalSupply += amount;
     } 
     
     function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }
     function transfer(address _to, uint256 _value) returns (bool success) {
       
        if (balances[msg.sender] >= _value && _value > 0) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }
    
    
   function getTotalSupply() constant returns (uint) // this doesn't have anything to do with the act of greeting
    {													// just demonstrating return of some global variable
        return totalSupply;
    }
    
    
   
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

     
    
     /**********
     Standard kill() function to recover funds 
     **********/
    
    function kill()
    { 
        if (msg.sender == creator)
            suicide(creator);  // kills this contract and sends remaining funds back to creator
    }

}
