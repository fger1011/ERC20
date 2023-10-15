# MY OWN ERC20 TOKEN
This is a Solidity program that creates a basic ERC20 contract token that also implements the basic use of error handling techniques in solidity with the functions of minting, burning and transferring.
## Getting Started
### Executing Program
Remix is an online Solidity IDE that you may use to run this application. To get started, go to https://remix.ethereum.org/.
When you are on the Remix website, click the "+" icon in the left sidebar to start a new file. The file should be saved with a.sol extension (such as MyToken.sol). The code below should be copied and pasted into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    address public owner;
    mapping(address => uint256) public balanceOf;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _initialSupply * 10 ** uint256(decimals);
        owner = msg.sender;
        balanceOf[msg.sender] = totalSupply;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Amount must be greater than zero");
        
        balanceOf[to] += amount;
        totalSupply += amount;
        emit Mint(to, amount);
    }

    function transfer(address to, uint256 amount) public {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");

        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }

    function burn(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");

        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Burn(msg.sender, amount);
    }
}

```


**Access Remix IDE:**

Go to the Remix website: https://remix.ethereum.org/

**Create a New Solidity File:**
Click the "+" button in the file explorer on the left-hand side to create a new Solidity file.
Name the file, for example, "MyToken.sol."

**Write or Paste Your Smart Contract:**
Write or paste the smart contract code into the newly created Solidity file.

**Compile the Smart Contract:**
Click the "Solidity Compiler" tab on the left sidebar.
Select the compiler version you want to use (e.g., 0.8.0).
Click the "Compile MyToken.sol" button to compile your smart contract. You should see the compiled output and any potential errors in the right panel.

**Deploy the Smart Contract:**
Click the "Deploy & Run Transactions" tab on the left sidebar.
Choose the appropriate environment under the "Environment" dropdown. For deployment on the Ethereum mainnet or testnets, you can use "Injected Web3" to connect your MetaMask wallet.
If you are deploying on a testnet, ensure that your wallet is connected to the desired network.
Click the "Deploy" button to deploy your contract. MetaMask (or your wallet) will prompt you to confirm the deployment. Confirm the transaction and pay any gas fees.

**Interact with the Contract:**
Once the contract is deployed, you can interact with it using the provided functions.
You can interact with your contract by using the "Read/Write Contract" section.
To call functions that don't modify the blockchain (read-only functions), you can select the function from the dropdown and click "Read."
To call functions that modify the blockchain, select the function, fill in the required parameters, and click "Transact."

## Authors
Metacrafter Franco
