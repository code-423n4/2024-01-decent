
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
- Ends January 23, 2024 20:00 UTC

## Automated Findings / Publicly Known Issues

The 4naly3er report can be found [here](https://github.com/code-423n4/2024-01-decent/blob/main/4naly3er-report.md).

Automated findings output for the audit can be found [here](https://github.com/code-423n4/2024-01-decent/blob/main/bot-report.md) within 24 hours of audit opening.

_Note for C4 wardens: Anything included in this `Automated Findings / Publicly Known Issues` section is considered a publicly known issue and is ineligible for awards._

# Overview

Decent allows for single click transactions on any chain, paid for from any source chain / token.
i.e. suppose I want to mint an NFT on optimism, but only have funds on Base, I can send that transaction, paying with DAI on Base, to receive my funds on Optimism.

The two libraries Decent uses to do so are `UTB`, which handles the routing of cross chain transactions and passes them through a selected bridge, and `decent-bridge`, which is decent's custom bridge built on top of layerzero's OFT standard.

`UTB` calls one of two functions, `swapAndExecute`, or `bridgeAndExecute`. As their names suggest, `swapAndExecute` performs same-chain txs for a user (from potentially diff payment tokens), and `bridgeAndExecute` performs cross-chain txs for a user.
In efforts of being generalizable, different `swappers` and `bridgeAdapters` can be added to UTB.

All `swappers` must implement `ISwapper`, as can be seen in `UniSwapper.sol`. Similarly, all `bridgeAdapters` must implement `IBridgeAdapter`, and examples can be seen with `DecentBridgeAdapter` and `StargateBridgeAdapter`.

`UTBExecutor` executes any additional logic for `UTB` (i.e. minting an nft)

The `DecentBridge` is built on top of layer zero's OFT contract, and additional implementation information can be found in the `decent-bridge` README.

[This checklist in Notion](https://code4rena.notion.site/Key-info-for-Code4rena-sponsors-f60764c4c4574bbf8e7a6dbd72cc49b4#0cafa01e6201462e9f78677a39e09746) provides some best practices for Code4rena audits.

## Links

- **Documentation: [docs.decent.xyz](https://docs.decent.xyz)**
- **decent.xyz: [decent.xyz](https://decent.xyz)**
- **Twitter: [decentxyz](https://twitter.com/decentxyz)**

# Scope

| Contract                                                                                                                                      | SLOC | Purpose                                         | Libraries used |
| --------------------------------------------------------------------------------------------------------------------------------------------- | ---- | ----------------------------------------------- | -------------- |
| [src/UTB.sol](https://github.com/code-423n4/2024-01-decent/blob/main/src/UTB.sol)                                                                       | 232  | Calls `swapAndExeucte` and `bridgeAndExecute`   |                |
| [src/UTBExecutor.sol](https://github.com/code-423n4/2024-01-decent/blob/main/src/UTBExecutor.sol)                                                       | 52   | Calls the executor for esxternal contract calls |                |
| [src/UTBFeeCollector.sol](https://github.com/code-423n4/2024-01-decent/blob/main/src/UTBFeeCollector.sol)                                               | 50   | Collects fees on UTB contract calls             |
| [src/bridge_adapters/BaseAdapter.sol](https://github.com/code-423n4/2024-01-decent/blob/main/src/bridge_adapters/BaseAdapter.sol)                       | 16   | Standard functionality for each bridge adapter  |
| [src/bridge_adapters/DecentBridgeAdapter.sol](https://github.com/code-423n4/2024-01-decent/blob/main/src/bridge_adapters/DecentBridgeAdapter.sol)       | 137  | adapter impl for decent bridge                  |
| [src/bridge_adapters/StargateBridgeAdapter.sol](https://github.com/code-423n4/2024-01-decent/blob/main/src/bridge_adapters/StargateBridgeAdapter.sol)   | 190  | adapter impl for stargate bridge                |
| [src/swappers/SwapParams.sol](https://github.com/code-423n4/2024-01-decent/blob/main/src/swappers/SwapParams.sol)                                       | 13   | params for swapper files                        |
| [src/swappers/UniSwapper.sol](https://github.com/code-423n4/2024-01-decent/blob/main/src/swappers/UniSwapper.sol)                                       | 145  | implementation of ISwapper for UniV3            |
| [lib/decent-bridge/src/DcntEth.sol](https://github.com/decentxyz/decent-bridge/blob/7f90fd4489551b69c20d11eeecb17a3f564afb18/src/DcntEth.sol)                           | 27   | OFTV2 implementation for DcntEth                | `OFTV2`        |
| [lib/decent-bridge/src/DecentEthRouter.sol](https://github.com/decentxyz/decent-bridge/blob/7f90fd4489551b69c20d11eeecb17a3f564afb18/src/DecentEthRouter.sol)           | 290  | Core bridge logic                               |                |
| [lib/decent-bridge/src/DecentBridgeExecutor.sol](https://github.com/decentxyz/decent-bridge/blob/7f90fd4489551b69c20d11eeecb17a3f564afb18/src/DecentBridgeExecutor.sol) | 57   | makes external contract calls                   |                |

## Out of scope

- All libs besides `decent-bridge` are out of scope

# Additional Context

- Protocol is expected to interact with any erc20 with dex liquidity, as it can be potential payment token for `swapAndExecute` or `bridgeAndExecute`
- Protocol is theoretically expected to interact with any erc721, such as through minting them in `swapAndExecute` or `bridgeAndExecute`
- Will be deployed to most blockchains, can consider scope of blockchains to those supported by layerzero for now (listed on website)
- `DecentEth.sol`: Should comply with the `ERC-20` standard

## Attack ideas (Where to look for bugs)

- Arbitrary Calldata: The ability to send arbitrary calldata through the protocol is one area to focus on. Namely a user should not be able to interact with the protocol to perform a swap or transfer of funds on their behalf, unless they have sent or approved those funds for use.
- Fund Accumulation: Other than the UTBFeeCollector, and DcntEth, the contracts are not intended to hold on to any funds or unnecessary approvals. Any native value or erc20 flowing through the protocol should either get delivered or refunded.
- Destination Chain Failures: Transactions that revert on the destination chain can potentially place user’s funds at risk of being lost. Any edge cases should be properly handled such that the user is issued a refund on the destination chain.


## Scoping Details

```
- If you have a public code repo, please share it here: github.com/decentxyz/UTB, github.com/decentxyz/decent-bridge note that the UTB branch is `develop`
- How many contracts are in scope?: 11
- Total SLoC for these contracts?: 1193
- How many separate interfaces and struct definitions are there for the contracts within scope?: 11 interfaces
- What is the overall line coverage percentage provided by your tests?: 75
- Check all that apply: ERC20, Multi-Chain, Uses L2
- Is there a need to understand a separate part of the codebase / get context in order to audit this part of the protocol?: knowledge of lz would be helpful
- Is this either a fork of or an alternate implementation of another project?: no
- Does it use a side-chain?: can be deployed to polygon
```

# Tests

To setup the repo, first run `forge install` + `pnpm i`
To run the tests, simply add the relevant files to your `.env`, referencing `.env.example`, then run `forge test`.

_Note: Many wardens run Slither as a first pass for testing. Please document any known errors with no workaround._

## Miscellaneous

Employees of Decent.xyz and employees' family members are ineligible to participate in this audit.
