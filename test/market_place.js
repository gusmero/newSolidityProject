const MarketPlace = artifacts.require("MarketPlace");
const truffleAssert = require('truffle-assertions');

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("MarketPlace", function ( accounts ) {
  it("should assert true", async () => {
    await MarketPlace.deployed();
    assert.isTrue(true);
  });
  it("should return the status Pending", async ()=> {
    // Instance of our deployed contract
    const instance = await MarketPlace.deployed();
    // Checking the initial status in our contract
    const status = await instance.State();
    // Checking if the status is initially Pending as set in the constructor
    assert.equal(status, "ItemAvailable");
  });

  it("should return balance 10", async ()=> {
    // Instance of our deployed contract
    const instance = await MarketPlace.deployed();
    // Checking the initial status in our contract
    const status = await instance.State();
    await instance.initializeBalance(accounts[1],10);
    const amount=instance.getBalance(accounts[1]);
    // Checking if the status is initially Pending as set in the constructor
    assert.equal(amount, 10);
  });
});
