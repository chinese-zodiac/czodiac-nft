require("@nomiclabs/hardhat-waffle");
require('hardhat-deploy');
const privateKey = require("./privatekey.js");


/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
  networks: {
    bsc: {
      url: `https://bsc-dataseed.binance.org`,
      accounts: [privateKey.primary]
    },
    bscTestnet: {
      url: `https://data-seed-prebsc-1-s2.binance.org:8545`,
      accounts: [privateKey.primary]
    }
  }
};
