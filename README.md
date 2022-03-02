# first Smart contract

A smart contract is a program that's stored inside a blockchain. Smart contracts extend blockchain from data to code. They represent an agreement between parties. The agreement is coded, and when an action happens, the code runs and provides a response.

All of the terms and conditions of the contracts are programmatically defined. A definition specifies the rules, requirements, and rewards for the participants in the blockchain. It also specifies how digital assets are transferred between parties. Each smart contract is assigned a 20-byte address that uniquely identifies it.

Smart contracts run on their own, send events which trigger state transitions, and call functions. They're perfect for blockchain technology because they allow people who don't know one another to do business in a securely specified way that requires no middleman.

Smart contracts are most commonly used with Ethereum. Ethereum is the world's first programmable blockchain. It allows smart contracts to be defined to help facilitate the transfer of digital assets, like ether.

The language you'll use to write contracts is Solidity. Solidity is Turing-complete, which means that you can write complicated contracts in a clearly defined and coded way.

Because every state transition is logged and immutable, you should thoroughly test the contract before you release it into a production environment. Bug fixes can be costly and can even cause critical system damage.

Smart contracts have these key properties and advantages:

- **Transparency**: Blockchain users can read smart contracts and can access them by using APIs.
- **Immutability**: Smart contract execution creates logs that can't be changed.
- **Distribution**: The output of the contract is validated and verified by nodes on the network. Contract states can be publicly visible. In some cases, even "private" variables are visible.

## Use cases
Smart contracts can benefit many industries and processes. Consider the following use cases.

**Insurance**: When certain events occur, smart contracts automatically triggers a claim which simplifies and streamlines the claims process. Then, to determine the amount of compensation that users receive, claim details can be recorded on the blockchain. This functionality can reduce processing times and human errors.

**Voting**: Smart contracts can help make voting automatic and transparent. Each contract serves as one ballot, which represents a voter's identity. Because a blockchain is immutable, meaning that it can't be changed, votes can't be tampered with.

**Supply chains**: As items move through the supply chain, smart contracts can record ownership and can confirm who's responsible for a product at any given time. At any stage, the smart contract can be used to find out exactly where the products should be. If any party in the supply chain fails to deliver on time, then every other party knows where the problem happened.

**Record keeping**: Many industries can use smart contracts to improve the speed and security of record keeping. Blockchain technology can be used to digitize records and to securely encrypt and store them. Plus, access can be gated so that only allowed individuals can access the records.

**Property ownership**: Smart contracts can record who owns property. They're a fast and cost-efficient way to record ownership. Smart contracts can also help facilitate the transfer of ownership in a timely and secure way.


# Truffle Suite 
Use the Truffle tool suite to test Ethereum contracts before you deploy them to public ledgers and incur real costs. To make your work as a developer easier, develop locally. The tool suite includes Truffle, Ganache, and Drizzle. In this module, we'll use Truffle. Truffle is the most popular development framework for Ethereum. You can install it by using the node package manager (NPM).
[Truffle_command](https://trufflesuite.com/docs/truffle/reference/truffle-commands.html)

Truffle provides the following benefits:

- Smart contract building, compilation, deployment, and testing
- Network management for deploying to public and private networks
- Package management for project dependencies
- Interactive console for direct contract communication and management
- Configurable build pipeline to automatically run checks and configure projects

# Ganache

The most popular local Ethereum blockchain is Ganache. We'll use the CLI version so that we can interact with it directly from the terminal. Ganache CLI is commonly used for development and testing.

To install Ganache CLI in your project, go to the terminal. Right-click and then select New Terminal. When the new terminal window opens, run: ```bash  npm install -g ganache-cli  ```


Afeter run ```bash  ganache-cli  ```. Notice that the blockchain has 10 generated accounts, and each receives 100 test ether to use. Each account also has a corresponding private key. Every account also has a mnemonic. A mnemonic is a unique 12-word phrase that provides access to the wallet and allows transactions to be made from the account.

The output also displays the blockchain's address. We'll use this address to connect to the blockchain. By default, the address is 127.0.0.1:8545.

# Shipping Contracts
The smart contract that you'll create tracks the status of items purchased from an online marketplace. When the contract is created, the shipping status is set to Pending. When an item is shipped, the shipping status is set to Shipped and an event is emitted. Upon delivery, the item's shipping status is set to Delivered and another event is emitted.

## stages
 - build contracts
 - migarte 
 - deploy 



## Using async/await
The .deployed() function returns a promise. So we use await in front of the function, and we use async in front of the test code. This setup means that after the contract is deployed, we won't move forward with our test until the promise is fulfilled.

This pattern is commonly used in tests because almost all smart contract transactions are asynchronous. They're asynchronous because transactions need to be validated or mined before they're added to the blockchain ledger.

Overall, you should aim for 100 percent test coverage for your contract, especially if you plan to deploy to the main Ethereum network, or Main Net.



# Ethereum Virtual Machine
Solidity contracts are executed on the Ethereum Virtual Machine or EVM (Ethereum Virtual Machine). It is a completely isolated sandbox environment. Nothing on the network is accessed outside of executed contracts. You don't need to know much more about the Ethereum virtual machine for now, but keep in mind that Solidity smart contracts will be deployed and executed in a virtual environment.























# Solidity base notion
 All Solidity contracts sometimes include:

- **Direttive pragma** Pragma è la parola chiave usata per chiedere al compilatore di controllare se la versione di Solidity corrisponde a quella richiesta ```sol  pragma solidity >=0.5.12<=0.9.0;  ```. 

- **Variabili di stato** Le variabili di stato sono fondamentali per qualsiasi file di origine Solidity. I valori delle variabili di stato vengono archiviati in modo permanente nell'archivio dei contratti. ```sol  contract Marketplace { uint price; // State variable```


È anche possibile specificare la visibilità di una variabile di stato come segue:

  **public**: fa parte dell'interfaccia del contratto ed è possibile accedervi da altri contratti.
 **internal**: l'accesso è possibile solo internamente dal contratto corrente.
 **private**: visibile solo per il contratto in cui la variabile è definita.

- **Funzioni** All'interno di un contratto, le unità di codice eseguibili sono note come funzioni. Le funzioni descrivono una singola azione per svolgere un'attività. Possono essere riutilizzate, nonché chiamate da altri file di origine, come le librerie. Le funzioni in Solidity si comportano in modo analogo alle funzioni in altri linguaggi di programmazione.  Le funzioni possono usare uno degli identificatori di visibilità seguenti: **public**, **private**, **internal** e **external**

**I modificatori di funzione** consentono di modificare il comportamento delle funzioni. Funzionano controllando una condizione prima dell'esecuzione della funzione. Una funzione può, ad esempio, controllare che solo un utente designato come venditore possa mettere in vendita un articolo.



```sol
pragma solidity >0.7.0 <0.8.0;

contract Marketplace {
    address public seller;

    modifier onlySeller() {
        require(
            msg.sender == seller,
            "Only seller can put an item up for sale."
        );
        _;
    }

    function listItem() public view onlySeller {
        // ...
    }
}
```

Ecco altri modificatori di funzione che è possibile usare nella definizione di funzione:

**pure** per descrivere le funzioni che non consentono modifiche o l'accesso allo stato.
**view** per descrivere le funzioni che non consentono modifiche dello stato.
**payable** per descrivere le funzioni che possono ricevere Ether.

- **Events** Gli eventi descrivono le azioni eseguite nel contratto. Analogamente alle funzioni, gli eventi hanno parametri che devono essere specificati quando l'evento viene chiamato.

Per chiamare un evento, è necessario usare la parola chiave **emit** con il nome dell'evento e i relativi parametri.


```sol
function buy(address seller, address buyer, uint price) public payable {
        require(price <= balances[buyer], "Insufficient balance");
        State = StateType.ItemPurchased;
        balances[buyer] -= price;
        balances[seller] += price;

        emit PurchasedItem(seller, buyer, msg.value);
    }
```


## Tipi Di valore


- Integer ( uint , int ) 

- Boolean (bool)

- Stringa ( String)

- Address (address)  Un indirizzo è un tipo con un valore a 20 byte che rappresenta un account utente Ethereum. Questo tipo può essere indicato come **address** o **address payable**. La differenza tra i due è che un tipo address payable è un indirizzo a cui è possibile inviare Ether e contiene i membri aggiuntivi transfer e send.

```sol
address payable public seller; // account for the seller
address payable public buyer; // account for the user

function transfer(address buyer, uint price) {
    buyer.transfer(price); // the transfer member transfers the price of the item
}
```

- Enumerazione 
In Solidity è possibile usare le enumerazioni per creare un tipo definito dall'utente. Si usa il termine definito dall'utente perché la persona che crea il contratto decide quali valori includere. Le enumerazioni possono essere usate per presentare molte scelte selezionabili, una delle quali è obbligatoria.

È possibile, ad esempio, usare un'enumerazione per presentare stati diversi per un elemento. È possibile paragonare le enumerazioni alle risposte a scelta multipla, in cui tutti i valori sono predefiniti ed è necessario selezionarne uno. Le enumerazioni possono essere dichiarate nelle definizioni di contratto o di libreria.

```sol
enum Status { 
    Pending,
    Shipped,
    Delivered 
}

Status public status;

constructor() public {
    status = Status.Pending;
}
```

## Tipi di riferimento 


- **Struct** Gli struct sono tipi personalizzati che un utente può definire per rappresentare oggetti reali. Gli struct vengono in genere usati come schema o per rappresentare i record.

Esempio di dichiarazione di struttura:
```sol
struct Items_Schema {
    uint256 _id;
    uint256 _price;
    string _name;
    string _description;
}
```

- **Mapping**
I mapping sono coppie chiave-valore incapsulate o inserite in un pacchetto. I mapping sono più simili a dizionari o a oggetti in JavaScript. In genere si usano i mapping per modellare oggetti reali ed eseguire ricerche di dati più velocemente. I valori possono includere tipi complessi come struct, che rendono il tipo di mapping flessibile e leggibile.

L'esempio di codice seguente usa lo struct Items_Schema e salva un elenco di elementi rappresentati da Items_Schema come dizionario. In questo modo, il mapping simula un database.

```sol
contract Items {
    uint256 item_id = 0;

    mapping(uint256 => Items_Schema) public items;

    struct Items_Schema {
      uint256 _id:
      uint256 _price:
      string _name;
    }

    function listItem(uint 256 memory _price, string memory _name) public {
      item_id += 1;
      item[vehicle_id] = Items_Schema(item_id, _price, _name);
    }
}
```





# Visual Studio Code shell developmet routin
```bash
Set-ExecutionPolicy -ExecutionPolicy ByPass -Scope Process
ganache-cli
truffle compile
truffle migrate
truffle test
truffle create test Shipping
```



# folder and file structure
```bash
+---build
|   \---contracts
|   |    \--- HelloBlockchain.json
|   |    \--- Migrations.json   
|   |    \--- Shipping.json    
+---contracts
|   \--- HelloBlockchain.sol
|   \--- Migrations.sol   
|   \--- Shipping.sol 
+---migrations
|   \--- 1_initial_migration.js
|   \--- 2_deploy_contracts.js  
+---test
|   \--- HelloBlockchain.js
|   \--- shipping.js  
```

# Azure Development kit


