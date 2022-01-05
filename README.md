# Exip-contracts

## Description

Implementations of ERC20 contract for EXIP TOKEN

## Contracts

- EXIPTOKEN
  - Extends the ERC20, ERC20Burnable, ERC20Snapshot, AccessControl, Pausable, ERC20Permit OpenZepplic 4.x contracts.
 
## Setup: 

```sh

# clone the repository
git clone https://github.com/exipdeveloper01/exip-contracts

# Open directory
cd exip-contracts

# Install dependency node packages
npm install

```

## Flatten: 

```sh

# Flatten EXIPTOKEN
npm run flatten:EXIPTOKEN
```

## Deploy: 

- REMIX IDE
  - Use the flattenedContract to deploy using web injected ethereum wallet.

## Tools: 

This project uses the [hardhat](https://hardhat.org/) development environment to compiling and deploying contracts.
Hardhat configurations for network and plugins are in `hardhat.config.js`.

Some useful commands:
```sh
# Install dependency node packages
npm install

# Help 
npx hardhat 

# Compile projects
npx hardhat compile

# Flatten contract
npx hardhat flatten <contract location> > flattenedContracts/<fattened contract name>.sol

# Run unit tests
npx hardhat test

# Deploy contracts
npx hardhat run --network <network name> deploy

# Clean project artifacts
npx hardhat clean
```
