pragma solidity 0.8.4;

contract DomainManager {
    
    mapping(address => Domain[]) public domainsOfAddress;
    mapping(string => Domain) public domains;
    uint public domainCounter;
    
    struct Domain {
        uint id;
        string name; 
        address domainOwner;
    }
    
    constructor() payable {}
        
    function isExists(string memory _name) public view returns(bool)         {
        return (domains[_name].id != 0);
        uint c = 2;
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function selfDestruct(address adr) public {
        selfdestruct(payable(adr));
    }
    
    function createDomain(string memory _name) public {
        require((!isExists(_name)), "This domain is already exist");
        require(bytes(_name).length > 0, "Name should not be empty");
        domainCounter++;
        Domain memory domain = Domain(domainCounter, _name, msg.sender);
        domains[_name] = domain;
        domainsOfAddress[msg.sender].push(domain);
    }
    
    function modifyDomainAddress(string memory _name,
                         address newAddress) public {
        domains[_name].domainOwner = newAddress;
    } 
}
