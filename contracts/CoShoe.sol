pragma solidity^0.5.0;

contract CoShoe {

    struct Shoe {
        address payable owner; //address of the owner
        string name; //name of owner
        string image; //url of the image
        bool sold;
    }

    uint256 price = 5*10**17;
    uint256 shoesSold = 0;
    uint256 count = 0;

    Shoe[] public shoes;

    constructor() public {
        for (uint i = 1; i <= 100; i++) {
        shoes.push(Shoe(msg.sender, "","",false));
        count++;
        }
    }

    function getNumberofTokens() public view returns(uint counts) {
        return shoes.length;
    }

    function buyShoe(string memory _name, string memory _image) public payable { //used to be external payable

        require(shoesSold < shoes.length, "exceeded number of shoes");
        require(msg.value == price, "Value is not equal to price");
        uint256 ii = shoesSold + 1;
    
        shoes[ii].owner = msg.sender;
        shoes[ii].name = _name;
        shoes[ii].image = _image;
        shoes[ii].sold = true;
        //shoes.push(Shoe(shoes[ii].owner, shoes[ii].name,shoes[ii].image,shoes[ii].sold));
        shoesSold++;

    }

    function checkPurchases() external view returns (bool[] memory){
        bool[] memory checkPurchase;
        for (uint256 i = 0; i < shoes.length; i++){
            if (shoes[i].owner == msg.sender){
                checkPurchase[i] = true;
            }
        }
        return checkPurchase;
    }

}