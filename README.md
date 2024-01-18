## ⭐️ Sponsor: Edit this `README.md` file

## ⭐️ Sponsor: Final touches

- [ ] Review and confirm the details in the section titled "Scoping details" and alert Code4rena staff of any changes.
- [ ] Review and confirm the list of in-scope files in the `scope.txt` file in this directory. Any files not listed as "in scope" will be considered out of scope for the purposes of judging, even if the file will be part of the deployed contracts.
- [ ] Check that images and other files used in this README have been uploaded to the repo as a file and then linked in the README using absolute path (e.g. `https://github.com/code-423n4/yourrepo-url/filepath.png`)
- [ ] Ensure that _all_ links and image/file paths in this README use absolute paths, not relative paths
- [ ] Check that all README information is in markdown format (HTML does not render on Code4rena.com)
- [ ] Remove any part of this template that's not relevant to the final version of the README (e.g. instructions in brackets and italic)
- [ ] Delete this checklist and all text above the line below when you're ready.

---

# Decent audit details

- Total Prize Pool: $36,500 USDC
  - HM awards: $24,750 USDC
  - Analysis awards: $1,500 USDC
  - QA awards: $750 USDC
  - Bot Race awards: $2,250 USDC
  - Gas awards: $750 USDC
  - Judge awards: $3,600 USDC
  - Lookout awards: $2,400 USDC
  - Scout awards: $500 USDC
- Join [C4 Discord](https://discord.gg/code4rena) to register
- Submit findings [using the C4 form](https://code4rena.com/contests/2024-01-decent/submit)
- [Read our guidelines for more details](https://docs.code4rena.com/roles/wardens)
- Starts January 19th, 2024 20:00 UTC
- Ends January 22, 2024 20:00 UTC

## Automated Findings / Publicly Known Issues

The 4naly3er report can be found [here](https://github.com/code-423n4/2024-01-decent/blob/main/4naly3er-report.md).

Automated findings output for the audit can be found [here](https://github.com/code-423n4/2024-01-decent/blob/main/bot-report.md) within 24 hours of audit opening.

_Note for C4 wardens: Anything included in this `Automated Findings / Publicly Known Issues` section is considered a publicly known issue and is ineligible for awards._

[ ⭐️ SPONSORS: Are there any known issues or risks deemed acceptable that shouldn't lead to a valid finding? If so, list them here. ]

# Overview

Decent allows for single click transactions on any chain, paid for from any source chain / token.
i.e. suppose I want to mint an NFT on optimism, but only have funds on Base, I can send that transaction, paying with DAI on Base, to receive my funds on Optimism.

The two libraries Decent uses to do so are `UTB`, which handles the routing of cross chain transactions and passes them through a selected bridge, and `decent-bridge`, which is decent's custom bridge built on top of layerzero's OFT standard.

`UTB` calls one of two functions, `swapAndExecute`, or `bridgeAndExecute`. As their names suggest, `swapAndExecute` performs same-chain txs for a user (from potentially diff payment tokens), and `bridgeAndExecute` performs cross-chain txs for a user.
In efforts of being generalizable, different `swappers` and `bridgeAdapters` can be added to UTB.

All `swappers` must implement `ISwapper`, as can be seen in `UniSwapper.sol`. Similarly, all `bridgeAdapters` must implement `IBridgeAdapter`, and examples can be seen with `DecentBridgeAdapter` and `StargateBridgeAdapter`.

`UTBExecutor` executes any additional logic for `UTB` (i.e. minting an nft)

The `DecentBridge` is built on top of layer zero's OFT contract, and additional implementation information can be found in the `decent-bridge` README.

- [ ] [This checklist in Notion](https://code4rena.notion.site/Key-info-for-Code4rena-sponsors-f60764c4c4574bbf8e7a6dbd72cc49b4#0cafa01e6201462e9f78677a39e09746) provides some best practices for Code4rena audits.

## Links

- **Documentation: [docs.decent.xyz](https://docs.decent.xyz)**
- **decent.xyz: [decent.xyz](https://decent.xyz)**
- **Twitter: [decentxyz](https://twitter.com/decentxyz)**

# Scope

| Contract                                                                                           | SLOC | Purpose                                         | Libraries used |
| -------------------------------------------------------------------------------------------------- | ---- | ----------------------------------------------- | -------------- |
| [src/UTB.sol](./src/UTB.sol)                                                                       | 232  | Calls `swapAndExeucte` and `bridgeAndExecute`   |                |
| [src/UTBExecutor.sol](./src/UTBExecutor.sol)                                                       | 52   | Calls the executor for esxternal contract calls |                |
| [src/UTBFeeCollector.sol](./src/UTBFeeCollector.sol)                                               | 50   | Collects fees on UTB contract calls             |
| [src/bridge_adapters/BaseAdapter.sol](./src/bridge_adapters/BaseAdapter.sol)                       | 16   | Standard functionality for each bridge adapter  |
| [src/bridge_adapters/DecentBridgeAdapter.sol](./src/bridge_adapters/DecentBridgeAdapter.sol)       | 137  | adapter impl for decent bridge                  |
| [src/bridge_adapters/StargateBridgeAdapter.sol](./src/bridge_adapters/StargateBridgeAdapter.sol)   | 190  | adapter impl for stargate bridge                |
| [src/swappers/SwapParams.sol](./src/swappers/SwapParams.sol)                                       | 13   | params for swapper files                        |
| [src/swappers/UniSwapper.sol](./src/swappers/UniSwapper.sol)                                       | 145  | implementation of ISwapper for UniV3            |
| [lib/decent-bridge/src/DcntEth.sol](./lib/decent-bridge/src/DcntEth.sol)                           | 27   | OFTV2 implementation for DcntEth                | `OFTV2`        |
| [lib/decent-bridge/src/DecentEthRouter.sol](./lib/decent-bridge/src/DecentEthRouter.sol)           | 290  | Core bridge logic                               |                |
| [lib/decent-bridge/src/DecentBridgeExecutor.sol](./lib/decent-bridge/src/DecentBridgeExecutor.sol) | 57   | makes external contract calls                   |                |

## Out of scope

_List any files/contracts that are out of scope for this audit._

# Additional Context

- Protocol is expected to interact with any erc20 with dex liquidity, as a potentially payment token for `swapAndExecute` or `bridgeAndExecute`
- Protocol is theoretically expected to interact with any erc721s, such as through minting them in `swapAndExecute` or `bridgeAndExecute`
- Will be deployed to most blockchains, can consider scope of blockchains to those supported by layerzero for now (listed on website)
- [ ] In the event of a DOS, could you outline a minimum duration after which you would consider a finding to be valid? This question is asked in the context of most systems' capacity to handle DoS attacks gracefully for a certain period.
- [ ] Is any part of your implementation intended to conform to any EIP's? Yes:
  - `DecentEth.sol`: Should comply with the `ERC-20` standard

## Attack ideas (Where to look for bugs)

_List specific areas to address - see [this blog post](https://medium.com/code4rena/the-security-council-elections-within-the-arbitrum-dao-a-comprehensive-guide-aa6d001aae60#9adb) for an example_

## Main invariants

_Describe the project's main invariants (properties that should NEVER EVER be broken)._

## Scoping Details

[ ⭐️ SPONSORS: please confirm/edit the information below. ]

```
- If you have a public code repo, please share it here:
- How many contracts are in scope?:
- Total SLoC for these contracts?:
- How many external imports are there?:
- How many separate interfaces and struct definitions are there for the contracts within scope?:
- Does most of your code generally use composition or inheritance?:
- How many external calls?:
- What is the overall line coverage percentage provided by your tests?: 75
- Is this an upgrade of an existing system?:
- Check all that apply (e.g. timelock, NFT, AMM, ERC20, rollups, etc.): Multi-Chain, Uses L2
- Is there a need to understand a separate part of the codebase / get context in order to audit this part of the protocol?:
- Please describe required context:
- Does it use an oracle?:
- Describe any novel or unique curve logic or mathematical models your code uses:
- Is this either a fork of or an alternate implementation of another project?:
- Does it use a side-chain?:
- Describe any specific areas you would like addressed:
```

# Tests

_Provide every step required to build the project from a fresh git clone, as well as steps to run the tests with a gas report._

_Note: Many wardens run Slither as a first pass for testing. Please document any known errors with no workaround._

## Miscellaneous

Employees of Decent.xyz and employees' family members are ineligible to participate in this audit.
