const truffleAssert = require('truffle-assertions');
import {assert, web3, artifacts} from "hardhat";

const HW04Exchange = artifacts.require("HW04Exchange");
const bn1e18 = web3.utils.toBN(1e18);

describe("HW04Exchange", function() {

    let accounts: string[];
    let owner: any;
    let payer: any;
    let HW04ExchangeContract: any;

    const paymentAmount = bn1e18.muln(1);

    beforeEach(async function () {
        accounts = await web3.eth.getAccounts();
        owner = accounts[0];
        payer = accounts[1];
        HW04ExchangeContract = await HW04Exchange.new();
    });


    describe("buySerhiiTokens", function() {

        it("Should buy SLTK2 successfully", async function() {

            let startContactEthBalance = await web3.eth.getBalance(HW04ExchangeContract.address);
            let startOwnerEthBalance = await web3.eth.getBalance(owner);
            let startPayerEthBalance = await web3.eth.getBalance(payer);

            console.log(startOwnerEthBalance);
            console.log(startPayerEthBalance);
            console.log(startContactEthBalance);

            // const result = await HW04ExchangeContract.buySerhiiTokens({from: payer, value: paymentAmount });
            //
            // let afterContactEthBalance = await web3.eth.getBalance(HW04ExchangeContract.address);
            // console.log(afterContactEthBalance);


        });


    });
});