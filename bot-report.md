# Winning bot race submission
This is the top-ranked automated findings report, from vuln-detector bot. All findings in this report will be considered known issues for the purposes of your C4 audit.

## Summary

| |Issue|Instances| Gas Savings
|-|:-|:-:|:-:|
| [[M-01](#m-01)] | Large approvals may not work with some `ERC20` tokens | 4| 0|
| [[M-02](#m-02)] | Large transfers may not work with some `ERC20` tokens | 2| 0|
| [[M-03](#m-03)] | Use call instead of transfer on payable addresses | 4| 0|
| [[M-04](#m-04)] | Contracts are vulnerable to fee-on-transfer accounting-related issues | 6| 0|
| [[M-05](#m-05)] | Privileged functions can create points of failure | 23| 0|
| [[M-06](#m-06)] | Return values of `transfer()`/`transferFrom()` not checked | 7| 0|
| [[M-07](#m-07)] | Some tokens may revert when zero value transfers are made | 2| 0|
| [[M-08](#m-08)] | Unsafe use of `transfer()`/`transferFrom()` with `IERC20` | 7| 0|
| [[M-09](#m-09)] | Return values of `approve()` not checked | 7| 0|
| [[L-01](#l-01)] | Vulnerable versions of packages are being used | 1| 0|
| [[L-02](#l-02)] | Missing checks for `address(0)` when assigning values to address state variables | 4| 0|
| [[L-03](#l-03)] | `approve` can revert if the current approval is not zero | 7| 0|
| [[L-04](#l-04)] | Missing checks in constructor | 3| 0|
| [[L-05](#l-05)] | increase/decrease or forceApprove allowance should be used instead of approve | 13| 0|
| [[L-06](#l-06)] | Governance operations should be behind a timelock | 26| 0|
| [[L-07](#l-07)] | Setters should have initial value check | 9| 0|
| [[L-08](#l-08)] | Unsafe ERC20 operation `approve()` | 13| 0|
| [[L-09](#l-09)] | Unused/empty `receive()`/`fallback()` function | 12| 0|
| [[L-10](#l-10)] | Consider implementing two-step procedure for updating protocol addresses | 4| 0|
| [[L-11](#l-11)] | Functions calling contracts/addresses with transfer hooks are missing reentrancy guards | 8| 0|
| [[L-12](#l-12)] | Some function should not be marked as payable | 22| 0|
| [[L-13](#l-13)] | prevent re-setting a state variable with the same value | 10| 0|
| [[L-14](#l-14)] | Function can return unassigned variable | 1| 0|
| [[L-15](#l-15)] | Low Level Calls to Custom Addresses | 7| 0|
| [[L-16](#l-16)] | Empty receive functions can cause gas issues | 6| 0|
| [[G-01](#g-01)] | Multiple accesses of a mapping/array should use a local variable cache | 1| 42|
| [[G-02](#g-02)] | Use assembly to check for `address(0)` | 12| 72|
| [[G-03](#g-03)] | Use assembly in place of `abi.decode` to extract `calldata` values more efficiently | 9| 0|
| [[G-04](#g-04)] | Optimize Address Storage Value Management with `assembly` | 8| 0|
| [[G-05](#g-05)] | Use assembly to emit events | 1| 38|
| [[G-06](#g-06)] | Using bools for storage incurs overhead | 3| 300|
| [[G-07](#g-07)] | State variables should be cached in stack variables rather than re-reading them from storage | 4| 388|
| [[G-08](#g-08)] | Use calldata instead of memory for function arguments that do not get mutated | 3| 0|
| [[G-09](#g-09)] | With assembly, `.call (bool success)` transfer can be done gas-optimized | 5| 0|
| [[G-10](#g-10)] | Use custom errors rather than `revert()`/`require()` strings to save gas | 9| 0|
| [[G-11](#g-11)] | Divisions which do not divide by -X cannot overflow or overflow so such operations can be unchecked to save gas | 2| 0|
| [[G-12](#g-12)] | `require()`/`revert()` strings longer than 32 bytes cost extra gas | 2| 36|
| [[G-13](#g-13)] | Reduce gas usage by moving to Solidity 0.8.19 or later | 9| 0|
| [[G-14](#g-14)] | Optimize names to save gas | 5| 110|
| [[G-15](#g-15)] | Not using the named return variables anywhere in the function is confusing | 6| 0|
| [[G-16](#g-16)] | Enable Solidity's optimizer | 1| 0|
| [[G-17](#g-17)] | Constructors can be marked `payable` | 8| 168|
| [[G-18](#g-18)] | Using `private` rather than `public` for constants, saves gas | 7| 0|
| [[G-19](#g-19)] | `private` functions only called once can be inlined to save gas | 11| 0|
| [[G-20](#g-20)] | Functions guaranteed to revert when called by normal users can be marked `payable` | 24| 504|
| [[G-21](#g-21)] | Avoid updating storage when the value hasn't changed to save gas | 10| 8000|
| [[G-22](#g-22)] | Usage of `uints`/`ints` smaller than 32 bytes (256 bits) incurs overhead | 28| 0|
| [[G-23](#g-23)] | State variables only set in the constructor should be declared `immutable` | 3| 6291|
| [[G-24](#g-24)] | `>=`/`<=` costs less gas than `>`/`<` | 3| 9|
| [[G-25](#g-25)] | Use assembly to validate `msg.sender` | 2| 24|
| [[G-26](#g-26)] | Consider activating via-ir for deploying | 1| 250|
| [[G-27](#g-27)] | State variables can be packed into fewer storage slots | 1| 2000|
| [[G-28](#g-28)] | Avoid transferring amounts of zero in order to save gas | 15| 0|
| [[G-29](#g-29)] | When no `addresses` are used `abi.encodepacked()` Outperforms `abi.encode()` in Efficiency | 2| 122|
| [[G-30](#g-30)] | A `modifier` used only once and not being inherited should be inlined to save gas | 1| 0|
| [[G-31](#g-31)] | Simple checks for zero `uint` can be done using assembly to save gas | 2| 12|
| [[G-32](#g-32)] | Using `private` for constants saves gas | 7| 0|
| [[G-33](#g-33)] | Redundant state variable getters | 3| 0|
| [[G-34](#g-34)] | Gas savings can be achieved by changing the model for assigning value to the structure ***123 gas*** | 3| 369|
| [[G-35](#g-35)] | Refactor modifiers to call a local function | 1| 1000|
| [[G-36](#g-36)] | Consider using solady's 'FixedPointMathLib' | 4| 0|
| [[N-01](#n-01)] | State variables declarations should have NatSpec descriptions | 36| 0|
| [[N-02](#n-02)] | Large or complicated code bases should implement invariant tests | 1| 0|
| [[N-03](#n-03)] | [NatSpec] Natspec `@author` is missing from `contract` | 8| 0|
| [[N-04](#n-04)] | Variable names that consist of all capital letters should be reserved for `constant`/`immutable` variables | 1| 0|
| [[N-05](#n-05)] | Common functions should be refactored to a common base contract | 3| 0|
| [[N-06](#n-06)] | Constant redefined elsewhere | 1| 0|
| [[N-07](#n-07)] | Constants in comparisons should appear on the left side | 6| 0|
| [[N-08](#n-08)] | [NatSpec] Natspec description is missing from `contract` | 9| 0|
| [[N-09](#n-09)] | Contract does not follow the Solidity style guide's suggested layout ordering | 1| 0|
| [[N-10](#n-10)] | Control structures do not follow the Solidity Style Guide | 50| 0|
| [[N-11](#n-11)] | Default address(0) can be returned | 1| 0|
| [[N-12](#n-12)] | Dependence on external protocols | 1| 0|
| [[N-13](#n-13)] | Consider adding emergency-stop functionality | 9| 0|
| [[N-14](#n-14)] | Empty bytes check is missing | 28| 0|
| [[N-15](#n-15)] | Events are missing sender information | 1| 0|
| [[N-16](#n-16)] | Explicitly define visibility of state variables to prevent misconceptions on what can access the variable | 12| 0|
| [[N-17](#n-17)] | Defining All External/Public Functions in Contract Interfaces | 8| 0|
| [[N-18](#n-18)] | Fixed Compiler Version Required for Non-Library/Interface Files | 8| 0|
| [[N-19](#n-19)] | Floating pragma should be avoided | 8| 0|
| [[N-20](#n-20)] | [NatSpec] Natspec description is missing from `function` | 38| 0|
| [[N-21](#n-21)] | Function ordering does not follow the Solidity style guide | 6| 0|
| [[N-22](#n-22)] | Some if-statement can be converted to a ternary | 1| 0|
| [[N-23](#n-23)] | Imports could be organized more systematically | 4| 0|
| [[N-24](#n-24)] | Inconsistent spacing in comments | 5| 0|
| [[N-25](#n-25)] | Large numeric literals should use underscores for readability | 3| 0|
| [[N-26](#n-26)] | Long functions should be refactored into multiple, smaller, functions | 3| 0|
| [[N-27](#n-27)] | Long lines of code | 1| 0|
| [[N-28](#n-28)] | Missing event and or timelock for critical parameter change | 10| 0|
| [[N-29](#n-29)] | File is missing NatSpec | 5| 0|
| [[N-30](#n-30)] | Mixed usage of `int`/`uint` with `int256`/`uint256` | 22| 0|
| [[N-31](#n-31)] | Consider using named mappings | 10| 0|
| [[N-32](#n-32)] | Consider using later versions of solidity for more cappabilities | 9| 0|
| [[N-33](#n-33)] | Some error strings are not descriptive | 1| 0|
| [[N-34](#n-34)] | Use of `override` is unnecessary | 2| 0|
| [[N-35](#n-35)] | Functions which are either private or internal should have a preceding _ in their name | 12| 0|
| [[N-36](#n-36)] | Private and internal state variables should have a preceding _ in their name unless they are constants | 10| 0|
| [[N-37](#n-37)] | `public` functions not called by the contract should be declared `external` instead | 35| 0|
| [[N-38](#n-38)] | Remove `forge-std` import | 5| 0|
| [[N-39](#n-39)] | Setters should prevent re-setting of the same value | 4| 0|
| [[N-40](#n-40)] | NatSpec `@return` argument is missing | 6| 0|
| [[N-41](#n-41)] | Consider using `SafeTransferLib.safeTransferETH()` or `Address.sendValue()` for clearer semantic meaning | 7| 0|
| [[N-42](#n-42)] | Polymorphic functions make security audits more time-consuming and error-prone | 1| 0|
| [[N-43](#n-43)] | Large multiples of ten should use scientific notation (e.g. `1e6`) rather than decimal literals (e.g. `1000000`), for readability | 3| 0|
| [[N-44](#n-44)] | Empty `receive()`/`payable fallback()` function does not authorize requests | 12| 0|
| [[N-45](#n-45)] | State variables should have `Natspec` comments | 36| 0|
| [[N-46](#n-46)] | Contracts should have full test coverage | 1| 0|
| [[N-47](#n-47)] | [NatSpec] Natspec `@title` is missing from `contract` | 9| 0|
| [[N-48](#n-48)] | Top level pragma declarations should be separated by two blank lines | 15| 0|
| [[N-49](#n-49)] | Critical functions should be a two step procedure | 12| 0|
| [[N-50](#n-50)] | uint variables should have the bit size defined explicitly | 22| 0|
| [[N-51](#n-51)] | Uncommented fields in a struct | 1| 0|
| [[N-52](#n-52)] | Unused Import | 1| 0|
| [[N-53](#n-53)] | Missing upgradability functionality | 1| 0|
| [[N-54](#n-54)] | Cast to `bytes` or `bytes32` for clearer semantic meaning | 1| 0|
| [[N-55](#n-55)] | Constants should be defined rather than using magic numbers | 3| 0|
| [[N-56](#n-56)] | Use the latest solidity (prior to 0.8.20 if on L2s) for deployment | 9| 0|
| [[N-57](#n-57)] | Use a single file for system wide constants | 5| 0|
| [[N-58](#n-58)] | Consider using SMTChecker | 9| 0|
| [[N-59](#n-59)] | Variable name must be in mixedCase | 2| 0|
| [[N-60](#n-60)] | Whitespace in Expressions | 10| 0|
| [[N-61](#n-61)] | A function which defines named returns in it's declaration doesn't need to use return | 2| 0|
| [[N-62](#n-62)] | [NatSpec] Natspec `@dev` is missing from `contract` | 9| 0|
| [[N-63](#n-63)] | Add inline comments for unnamed variables | 2| 0|
| [[N-64](#n-64)] | Contract should expose an `interface` | 8| 0|
| [[N-65](#n-65)] | [NatSpec] Natspec `@notice` is missing from `contract` | 8| 0|
| [[N-66](#n-66)] | Do not use UNDERSCORE in `struct` elements names | 21| 0|
| [[N-67](#n-67)] | `private`/`public` function name should start with underscore | 12| 0|
| [[N-68](#n-68)] | [NatSpec] Natspec description is missing from `modifier` declaration | 7| 0|
| [[N-69](#n-69)] | Add inline comments for unnamed parameters | 2| 0|
| [[N-70](#n-70)] | Use the latest Solidity version for better security | 9| 0|
| [[N-71](#n-71)] | Consider adding formal verification proofs | 1| 0|
| [[N-72](#n-72)] | Missing zero address check in functions with address parameters | 8| 0|
| [[N-73](#n-73)] | Use a struct to encapsulate multiple function parameters | 17| 0|
| [[N-74](#n-74)] | [NatSpec] Natspec `@notice` is missing from `function` | 68| 0|
| [[N-75](#n-75)] | [NatSpec] Natspec `@dev` is missing from `function` | 50| 0|
| [[N-76](#n-76)] | Missing NatSpec `@dev` from `modifier` declaration | 7| 0|
| [[N-77](#n-77)] | [NatSpec] Natspec `@notice` is missing from `modifier` | 8| 0|
| [[N-78](#n-78)] | Use custom errors rather than `revert()`/`require()` strings for better readability | 7| 0|
| [[N-79](#n-79)] | Use `@inheritdoc` for overridden functions | 1| 0|
| [[N-80](#n-80)] | constructor should emit an event | 8| 0|
| [[N-81](#n-81)] | Complex functions should include comments | 11| 0|
| [[N-82](#n-82)] | Use a `struct` instead of returning multiple values | 1| 0|
| [[N-83](#n-83)] | Make use of Solidiy's `using` keyword | 3| 0|
| [[N-84](#n-84)] | [Solidity]: Bug in Legacy Code Generation When Accessing the .selector Member on Expressions with Side Effects | 9| 0|
| [[N-85](#n-85)] | [Solidity]: All `verbatim` blocks are considered identical by deduplicator and can incorrectly be unified | 1| 0|
| [[N-86](#n-86)] | [NatSpec] Natspec `@author` is missing from `library` | 1| 0|
| [[N-87](#n-87)] | [NatSpec] Natspec `@dev` is missing from `library` | 1| 0|
| [[N-88](#n-88)] | [NatSpec] Natspec `@notice` is missing from `library` | 1| 0|
| [[N-89](#n-89)] | [NatSpec] Natspec `@title` is missing from `library` | 1| 0|
| [[N-90](#n-90)] | [NatSpec] Natspec `@dev` is missing from `constractor` | 8| 0|
| [[N-91](#n-91)] | [NatSpec] Natspec `@notice` is missing from `constractor` | 8| 0|
| [[N-92](#n-92)] | [NatSpec] Natspec `@param` is missing from `constractor` | 3| 0|
| [[N-93](#n-93)] | [NatSpec] Natspec `@dev` is missing from `receive` function | 6| 0|
| [[N-94](#n-94)] | [NatSpec] Natspec `@notice` is missing from `constractor` | 8| 0|
| [[N-95](#n-95)] | [NatSpec] Natspec `@dev` is missing from `struct` | 1| 0|
| [[N-96](#n-96)] | [NatSpec] Natspec `@notice` is missing from `struct` | 1| 0|
| [[N-97](#n-97)] | [NatSpec] Natspec `@param` is missing from `struct` | 1| 0|
| [[N-98](#n-98)] | [NatSpec] Natspec `@param` is missing from `modifier` | 3| 0|
| [[N-99](#n-99)] | [NatSpec] Natspec `@param` is missing from `function` | 46| 0|
| [[N-100](#n-100)] | Not using the latest version of `prb-math` from dependencies | 1| 0|
| [[N-101](#n-101)] | Establishing Best Practices for Initial Version in package.json | 1| 0|
| [[N-102](#n-102)] | Enforcing Lowercase and Underscores Only in the `name` Field of package.json | 1| 0|
| [[N-103](#n-103)] | Non constant/immutable state variables are missing a setter post deployment | 5| 0|
| [[N-104](#n-104)] | [NatSpec] Empty constructor body without NatSpec comments | 5| 0|
| [[N-105](#n-105)] | Using Low-Level Call for Transfers | 5| 0|
| [[N-106](#n-106)] | Lack of space near the operator | 3| 0|
| [[N-107](#n-107)] | Avoid mutating function parameters | 4| 0|
| [[N-108](#n-108)] | A event should be emitted if a non immutable state variable is set in a constructor | 7| 0|
| [[N-109](#n-109)] | [Solidity]: Order of Argument Evaluation Disrupted in Non-Expression-Split Code by Optimizer Sequences with FullInliner | 9| 0|

### Medium Risk Issues

### [M-01]<a name="m-01"></a> Large approvals may not work with some `ERC20` tokens

Not all `IERC20` implementations are totally compliant, and some (e.g `UNI`, `COMP`) may fail if the valued passed is larger than `uint96`. [Source](https://github.com/d-xo/weird-erc20#revert-on-large-approvals--transfers)

*There are 4 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

145:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L145-L145



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

207:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L207-L207



```solidity

File: src/swappers/UniSwapper.sol

137:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L137-L137



```solidity

File: src/swappers/UniSwapper.sol

158:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L158-L158

### [M-02]<a name="m-02"></a> Large transfers may not work with some `ERC20` tokens

Some `IERC20` implementations (e.g `UNI`, `COMP`) may fail if the valued transferred is larger than `uint96`. [Source](https://github.com/d-xo/weird-erc20#revert-on-large-approvals--transfers)

*There are 2 instance(s) of this issue:*



```solidity

File: src/swappers/UniSwapper.sol

44:         IERC20(token).transfer(user, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L44-L44



```solidity

File: src/swappers/UniSwapper.sol

55:         IERC20(token).transfer(recipient, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L55-L55

### [M-03]<a name="m-03"></a> Use call instead of transfer on payable addresses

In Solidity, when transferring Ether, `.transfer()` and `.send()` are commonly used. However, they have a limitation: they forward only a stipend of 2300 gas, which isn't enough to execute any code in the recipient contract beyond a simple event emission. Thus, if the recipient is a contract, the transfer may fail unexpectedly.

To overcome this, Solidity introduced the `.call{value: _amount}("")` method, which forwards all available gas and can invoke more complex functionality.It's also safer in that it does not revert on failure but instead returns a boolean value to indicate success or failure. Therefore, it is generally a better choice to use `.call` when transferring Ether to a payable address, with the necessary safety checks implemented to handle potential errors.

*There are 4 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

63:             payable(from).transfer(amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L63-L63



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

276:                 payable(_to).transfer(_amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L276-L276



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

290:         payable(msg.sender).transfer(amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L290-L290



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

318:         payable(msg.sender).transfer(amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L318-L318

### [M-04]<a name="m-04"></a> Contracts are vulnerable to fee-on-transfer accounting-related issues

The functions below transfer funds from the caller to the receiver via `transferFrom()`, but do not ensure that the actual number of tokens received is the same as the input amount to the transfer. If the token is a fee-on-transfer token, the balance after the transfer will be smaller than expected, leading to accounting issues. Even if there are checks later, related to a secondary transfer, an attacker may be able to use latent funds (e.g. mistakenly sent by another user) in order to get a free credit. One way to solve this problem is to measure the balance before and after the transfer, and use the difference as the amount, rather than the stated amount.

*There are 6 instance(s) of this issue:*



```solidity

File: src/UTB.sol

83:             IERC20(swapParams.tokenIn).transferFrom(
84:                 msg.sender,
85:                 address(this),
86:                 swapParams.amountIn
87:             );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L83-L87



```solidity

File: src/UTBExecutor.sol

61:         IERC20(token).transferFrom(msg.sender, address(this), amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L61-L61



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

109:             IERC20(bridgeToken).transferFrom(
110:                 msg.sender,
111:                 address(this),
112:                 amt2Bridge
113:             );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L109-L113



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

139:         IERC20(swapParams.tokenIn).transferFrom(
140:             msg.sender,
141:             address(this),
142:             swapParams.amountIn
143:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L139-L143



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

88:         IERC20(bridgeToken).transferFrom(msg.sender, address(this), amt2Bridge);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L88-L88



```solidity

File: src/swappers/UniSwapper.sol

83:             IERC20(swapParams.tokenIn).transferFrom(
84:                 msg.sender,
85:                 address(this),
86:                 swapParams.amountIn
87:             );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L83-L87

### [M-05]<a name="m-05"></a> Privileged functions can create points of failure

Ensure such accounts are protected and consider implementing multi sig to prevent a single point of failure 

*There are 23 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

68:     function execute(
69:         address from,
70:         address target,
71:         bool deliverEth,
72:         uint256 amount,
73:         bytes memory callPayload
74:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L68-L74



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

68:     function registerDcntEth(address _addr) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L68-L68



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

73:     function addDestinationBridge(
74:         uint16 _dstChainId,
75:         address _routerAddress
76:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L73-L76



```solidity

File: src/UTB.sol

28:     function setExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L28-L28



```solidity

File: src/UTB.sol

36:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L36-L36



```solidity

File: src/UTB.sol

44:     function setFeeCollector(address payable _feeCollector) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L44-L44



```solidity

File: src/UTB.sol

325:     function registerSwapper(address swapper) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L325-L325



```solidity

File: src/UTB.sol

334:     function registerBridge(address bridge) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L334-L334



```solidity

File: src/UTBExecutor.sol

19:     function execute(
20:         address target,
21:         address paymentOperator,
22:         bytes memory payload,
23:         address token,
24:         uint amount,
25:         address payable refund
26:     ) public payable onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L19-L26



```solidity

File: src/UTBExecutor.sol

41:     function execute(
42:         address target,
43:         address paymentOperator,
44:         bytes memory payload,
45:         address token,
46:         uint amount,
47:         address payable refund,
48:         uint extraNative
49:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L41-L49



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

26:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

34:     function registerRemoteBridgeAdapter(
35:         uint256 dstChainId,
36:         uint16 dstLzId,
37:         address decentBridgeAdapter
38:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L34-L38



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

81:     function bridge(
82:         uint256 amt2Bridge,
83:         SwapInstructions memory postBridge,
84:         uint256 dstChainId,
85:         address target,
86:         address paymentOperator,
87:         bytes memory payload,
88:         bytes calldata additionalArgs,
89:         address payable refund
90:     ) public payable onlyUtb returns (bytes memory bridgePayload) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L81-L90



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

127:     function receiveFromBridge(
128:         SwapInstructions memory postBridge,
129:         address target,
130:         address paymentOperator,
131:         bytes memory payload,
132:         address payable refund
133:     ) public onlyExecutor {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L127-L133



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

33:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L33-L33



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L37



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

45:     function registerRemoteBridgeAdapter(
46:         uint256 dstChainId,
47:         uint16 dstLzId,
48:         address decentBridgeAdapter
49:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L45-L49



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

69:     function bridge(
70:         uint256 amt2Bridge,
71:         SwapInstructions memory postBridge,
72:         uint256 dstChainId,
73:         address target,
74:         address paymentOperator,
75:         bytes memory payload,
76:         bytes calldata additionalArgs,
77:         address payable refund
78:     ) public payable onlyUtb returns (bytes memory bridgePayload) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L69-L78



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

183:     function sgReceive(
184:         uint16, // _srcChainid
185:         bytes memory, // _srcAddress
186:         uint256, // _nonce
187:         address, // _token
188:         uint256, // amountLD
189:         bytes memory payload
190:     ) external override onlyExecutor {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L183-L190



```solidity

File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L20



```solidity

File: src/swappers/UniSwapper.sol

24:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L24



```solidity

File: src/swappers/UniSwapper.sol

58:     function swap(
59:         bytes memory swapPayload
60:     )
61:         external
62:         onlyUtb


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L58-L62

### [M-06]<a name="m-06"></a> Return values of `transfer()`/`transferFrom()` not checked

Not all `IERC20` implementations `revert()` when there's a failure in `transfer()`/`transferFrom()`. The function signature has a `boolean` return value and they indicate errors that way instead. By not checking the return value, operations that should have marked as failed, may potentially go through without actually making a payment

*There are 7 instance(s) of this issue:*



```solidity

File: src/UTB.sol

83:             IERC20(swapParams.tokenIn).transferFrom(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L83-L83



```solidity

File: src/UTBExecutor.sol

61:         IERC20(token).transferFrom(msg.sender, address(this), amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L61-L61



```solidity

File: src/UTBExecutor.sol

80:         IERC20(token).transfer(refund, remainingBalance);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L80-L80



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

139:         IERC20(swapParams.tokenIn).transferFrom(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L139-L139



```solidity

File: src/swappers/UniSwapper.sol

44:         IERC20(token).transfer(user, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L44-L44



```solidity

File: src/swappers/UniSwapper.sol

55:         IERC20(token).transfer(recipient, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L55-L55



```solidity

File: src/swappers/UniSwapper.sol

83:             IERC20(swapParams.tokenIn).transferFrom(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L83-L83

### [M-07]<a name="m-07"></a> Some tokens may revert when zero value transfers are made

In spite of the fact that EIP-20 [states](https://github.com/ethereum/EIPs/blob/46b9b698815abbfa628cd1097311deee77dd45c5/EIPS/eip-20.md?plain=1#L116) that zero-valued transfers must be accepted, some tokens, such as LEND will revert if this is attempted, which may cause transactions that involve other tokens (such as batch operations) to fully revert. Consider skipping the transfer if the amount is zero, which will also save gas.

*There are 2 instance(s) of this issue:*



```solidity

File: src/swappers/UniSwapper.sol

44:         IERC20(token).transfer(user, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L44-L44



```solidity

File: src/swappers/UniSwapper.sol

55:         IERC20(token).transfer(recipient, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L55-L55

### [M-08]<a name="m-08"></a> Unsafe use of `transfer()`/`transferFrom()` with `IERC20`

Some tokens do not implement the ERC20 standard properly but are still accepted by most code that accepts ERC20 tokens.  For example Tether (USDT)'s `transfer()` and `transferFrom()` functions on L1 do not return booleans as the specification requires, and instead have no return value. When these sorts of tokens are cast to `IERC20`, their [function signatures](https://medium.com/coinmonks/missing-return-value-bug-at-least-130-tokens-affected-d67bf08521ca) do not match and therefore the calls made, revert (see [this](https://gist.github.com/IllIllI000/2b00a32e8f0559e8f386ea4f1800abc5) link for a test case). Use OpenZeppelin's `SafeERC20`'s `safeTransfer()`/`safeTransferFrom()` instead

*There are 7 instance(s) of this issue:*



```solidity

File: src/UTB.sol

83:             IERC20(swapParams.tokenIn).transferFrom(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L83-L83



```solidity

File: src/UTBExecutor.sol

61:         IERC20(token).transferFrom(msg.sender, address(this), amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L61-L61



```solidity

File: src/UTBExecutor.sol

80:         IERC20(token).transfer(refund, remainingBalance);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L80-L80



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

139:         IERC20(swapParams.tokenIn).transferFrom(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L139-L139



```solidity

File: src/swappers/UniSwapper.sol

44:         IERC20(token).transfer(user, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L44-L44



```solidity

File: src/swappers/UniSwapper.sol

55:         IERC20(token).transfer(recipient, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L55-L55



```solidity

File: src/swappers/UniSwapper.sol

83:             IERC20(swapParams.tokenIn).transferFrom(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L83-L83

### [M-09]<a name="m-09"></a> Return values of `approve()` not checked

Not all IERC20 implementations `revert()` when there's a failure in `approve()`. The function signature has a boolean return value and they indicate errors that way instead. By not checking the return value, operations that should have marked as failed, may potentially go through without actually approving anything

*There are 7 instance(s) of this issue:*



```solidity

File: src/UTB.sol

90:         IERC20(swapParams.tokenIn).approve(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L90-L90



```solidity

File: src/UTB.sol

152:             IERC20(tokenOut).approve(address(executor), amountOut);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L152-L152



```solidity

File: src/UTBExecutor.sol

62:         IERC20(token).approve(paymentOperator, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L62-L62



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

145:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L145-L145



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

207:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L207-L207



```solidity

File: src/swappers/UniSwapper.sol

137:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L137-L137



```solidity

File: src/swappers/UniSwapper.sol

158:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L158-L158

### Low Risk Issues

### [L-01]<a name="l-01"></a> Vulnerable versions of packages are being used

This project's specific package versions are vulnerable to the specific CVEs listed below. Consider switching to more recent versions of these packages that don't have these vulnerabilities

*There are 1 instance(s) of this issue:*



```solidity

File: package.json


<details><summary>Vulnerabilities related to `@openzeppelin/contracts`:</summary>


- [CVE-2022-35915](https://github.com/OpenZeppelin/openzeppelin-contracts/security/advisories/GHSA-7grf-83vw-6f5x) :This issue concerns instances of Governor that use the module GovernorVotesQuorumFraction, a mechanism that determines quorum requirements as a percentage of the voting token's total supply. In affected instances, when a proposal is passed to lower the quorum requirement, past proposals may become executable if they had been defeated only due to lack of quorum, and the number of votes it received meets the new quorum requirement.

Analysis of instances on chain found only one proposal that met this condition, and we are actively monitoring for new occurrences of this particular issue.


- [CVE-2021-46320](https://github.com/OpenZeppelin/openzeppelin-contracts/security/advisories/GHSA-9c22-pwxw-p6hx) :Initializer functions that are invoked separate from contract creation (the most prominent example being minimal proxies) may be reentered if they make an untrusted non-view external call.

Once an initializer has finished running it can never be re-executed. However, an exception put in place to support multiple inheritance made reentrancy possible in the scenario described above, breaking the expectation that there is a single execution.

Note that upgradeable proxies are commonly initialized together with contract creation, where reentrancy is not feasible, so the impact of this issue is believed to be minor.


- [CVE-2023-30541](https://github.com/OpenZeppelin/openzeppelin-contracts/security/advisories/GHSA-mx2q-35m2-x2rh) :A function in the implementation contract may be inaccessible if its selector clashes with one of the proxy's own selectors. Specifically, if the clashing function has a different signature with incompatible ABI encoding, the proxy could revert while attempting to decode the arguments from calldata.
The probability of an accidental clash is negligible, but one could be caused deliberately.
</details>

<details><summary>Vulnerabilities related to `@openzeppelin/contracts-upgradeable`:</summary>


- [CVE-2022-35915](https://github.com/OpenZeppelin/openzeppelin-contracts/security/advisories/GHSA-7grf-83vw-6f5x) :This issue concerns instances of Governor that use the module GovernorVotesQuorumFraction, a mechanism that determines quorum requirements as a percentage of the voting token's total supply. In affected instances, when a proposal is passed to lower the quorum requirement, past proposals may become executable if they had been defeated only due to lack of quorum, and the number of votes it received meets the new quorum requirement.

Analysis of instances on chain found only one proposal that met this condition, and we are actively monitoring for new occurrences of this particular issue.


- [CVE-2021-46320](https://github.com/OpenZeppelin/openzeppelin-contracts/security/advisories/GHSA-9c22-pwxw-p6hx) :Initializer functions that are invoked separate from contract creation (the most prominent example being minimal proxies) may be reentered if they make an untrusted non-view external call.

Once an initializer has finished running it can never be re-executed. However, an exception put in place to support multiple inheritance made reentrancy possible in the scenario described above, breaking the expectation that there is a single execution.

Note that upgradeable proxies are commonly initialized together with contract creation, where reentrancy is not feasible, so the impact of this issue is believed to be minor.


- [CVE-2023-30541](https://github.com/OpenZeppelin/openzeppelin-contracts/security/advisories/GHSA-mx2q-35m2-x2rh) :A function in the implementation contract may be inaccessible if its selector clashes with one of the proxy's own selectors. Specifically, if the clashing function has a different signature with incompatible ABI encoding, the proxy could revert while attempting to decode the arguments from calldata.
The probability of an accidental clash is negligible, but one could be caused deliberately.
</details>1: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//package.json#L1-L1

### [L-02]<a name="l-02"></a> Missing checks for `address(0)` when assigning values to address state variables

 

*There are 4 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/BaseAdapter.sol

20:         bridgeExecutor = _executor;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L20-L20



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

23:         bridgeToken = _bridgeToken;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L23-L23



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

38:         stargateEth = _sgEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L38-L38



```solidity

File: src/swappers/UniSwapper.sol

21:         uniswap_router = _router;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L21-L21

### [L-03]<a name="l-03"></a> `approve` can revert if the current approval is not zero

Some tokens like USDT check for the current approval, and they revert if it's not zero. While Tether is known to do this, it applies to other tokens as well, which are trying to protect against [this](https://docs.google.com/document/d/1YLPtQxZu1UAvO9cZ1O2RPXBbT0mooh4DYKjA_jp-RLM/edit) attack vector.
Consider always calling `token.safeApprove(addr, 0)` before changing the approval, or better yet, use `safeIncreaseAllowance`/`safeDecreaseAllowance`.

*There are 7 instance(s) of this issue:*



```solidity

File: src/UTB.sol

90:         IERC20(swapParams.tokenIn).approve(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L90-L90



```solidity

File: src/UTB.sol

152:             IERC20(tokenOut).approve(address(executor), amountOut);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L152-L152



```solidity

File: src/UTBExecutor.sol

62:         IERC20(token).approve(paymentOperator, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L62-L62



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

145:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L145-L145



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

207:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L207-L207



```solidity

File: src/swappers/UniSwapper.sol

137:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L137-L137



```solidity

File: src/swappers/UniSwapper.sol

158:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L158-L158

### [L-04]<a name="l-04"></a> Missing checks in constructor

There are some missing checks in these functions, and this could lead to unexpected scenarios. Consider always adding a sanity check for state variables.

*There are 3 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

//@audit gasIsEth,  are not checked
12:     constructor(address _weth, bool gasIsEth) Owned(msg.sender) {
13:         weth = IWETH(payable(_weth));


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L12-L13



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit gasIsEth,  are not checked
27:     constructor(
28:         address payable _wethAddress,
29:         bool gasIsEth,
30:         address _executor
31:     ) Owned(msg.sender) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L27-L31



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit _gasIsEth,  are not checked
21:     constructor(bool _gasIsEth, address _bridgeToken) BaseAdapter() {
22:         gasIsEth = _gasIsEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L21-L22

### [L-05]<a name="l-05"></a> increase/decrease or forceApprove allowance should be used instead of approve

In order to prevent front running, increase/decrease or forceApprove allowance should be used in place of approve where possible 

*There are 13 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

31:         weth.approve(target, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L31-L31



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

279:             weth.approve(address(executor), _amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L279-L279



```solidity

File: src/UTB.sol

90:         IERC20(swapParams.tokenIn).approve(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L90-L90



```solidity

File: src/UTB.sol

152:             IERC20(tokenOut).approve(address(executor), amountOut);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L152-L152



```solidity

File: src/UTB.sol

216:             IERC20(bridgeToken).approve(address(bridgeAdapter), amt2Bridge);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L216-L216



```solidity

File: src/UTB.sol

241:                 IERC20(fees.feeToken).approve(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L241-L241



```solidity

File: src/UTBExecutor.sol

62:         IERC20(token).approve(paymentOperator, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L62-L62



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

114:             IERC20(bridgeToken).approve(address(router), amt2Bridge);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L114-L114



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

145:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L145-L145



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

89:         IERC20(bridgeToken).approve(address(router), amt2Bridge);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L89-L89



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

207:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L207-L207



```solidity

File: src/swappers/UniSwapper.sol

137:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L137-L137



```solidity

File: src/swappers/UniSwapper.sol

158:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L158-L158

### [L-06]<a name="l-06"></a> Governance operations should be behind a timelock

All critical and governance operations should be protected by a timelock. For example from the point of view of a user, the changing of the owner of a contract is a high risk operation that may have outcomes ranging from an attacker gaining control over the protocol, to the function no longer functioning due to a typo in the destination address. To give users plenty of warning so that they can validate any ownership changes, changes of ownership should be behind a timelock.

*There are 26 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

68:     function registerDcntEth(address _addr) public onlyOwner {
69:         dcntEth = IDcntEth(_addr);
70:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L68-L70



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

73:     function addDestinationBridge(
74:         uint16 _dstChainId,
75:         address _routerAddress
76:     ) public onlyOwner {
77:         destinationBridges[_dstChainId] = _routerAddress;
78:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L73-L78



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

285:     function redeemEth(
286:         uint256 amount
287:     ) public onlyIfWeHaveEnoughReserves(amount) {
288:         dcntEth.transferFrom(msg.sender, address(this), amount);
289:         weth.withdraw(amount);
290:         payable(msg.sender).transfer(amount);
291:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L285-L291



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

294:     function redeemWeth(
295:         uint256 amount
296:     ) public onlyIfWeHaveEnoughReserves(amount) {
297:         dcntEth.transferFrom(msg.sender, address(this), amount);
298:         weth.transfer(msg.sender, amount);
299:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L294-L299



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

302:     function addLiquidityEth()
303:         public
304:         payable
305:         onlyEthChain
306:         userDepositing(msg.value)
307:     {
308:         weth.deposit{value: msg.value}();
309:         dcntEth.mint(address(this), msg.value);
310:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L302-L310



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

313:     function removeLiquidityEth(
314:         uint256 amount
315:     ) public onlyEthChain userIsWithdrawing(amount) {
316:         dcntEth.burn(address(this), amount);
317:         weth.withdraw(amount);
318:         payable(msg.sender).transfer(amount);
319:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L313-L319



```solidity

File: src/UTB.sol

28:     function setExecutor(address _executor) public onlyOwner {
29:         executor = IUTBExecutor(_executor);
30:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L28-L30



```solidity

File: src/UTB.sol

36:     function setWrapped(address payable _wrapped) public onlyOwner {
37:         wrapped = IWETH(_wrapped);
38:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L36-L38



```solidity

File: src/UTB.sol

44:     function setFeeCollector(address payable _feeCollector) public onlyOwner {
45:         feeCollector = IUTBFeeCollector(_feeCollector);
46:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L44-L46



```solidity

File: src/UTB.sol

325:     function registerSwapper(address swapper) public onlyOwner {
326:         ISwapper s = ISwapper(swapper);
327:         swappers[s.getId()] = swapper;
328:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L325-L328



```solidity

File: src/UTB.sol

334:     function registerBridge(address bridge) public onlyOwner {
335:         IBridgeAdapter b = IBridgeAdapter(bridge);
336:         bridgeAdapters[b.getId()] = bridge;
337:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L334-L337



```solidity

File: src/UTBExecutor.sol

19:     function execute(
20:         address target,
21:         address paymentOperator,
22:         bytes memory payload,
23:         address token,
24:         uint amount,
25:         address payable refund
26:     ) public payable onlyOwner {
27:         return
28:             execute(target, paymentOperator, payload, token, amount, refund, 0);
29:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L19-L29



```solidity

File: src/UTBExecutor.sol

41:     function execute(
42:         address target,
43:         address paymentOperator,
44:         bytes memory payload,
45:         address token,
46:         uint amount,
47:         address payable refund,
48:         uint extraNative
49:     ) public onlyOwner {
50:         bool success;
51:         if (token == address(0)) {
52:             (success, ) = target.call{value: amount}(payload);
53:             if (!success) {
54:                 (refund.call{value: amount}(""));
55:             }
56:             return;
57:         }
58: 
59:         uint initBalance = IERC20(token).balanceOf(address(this));
60: 
61:         IERC20(token).transferFrom(msg.sender, address(this), amount);
62:         IERC20(token).approve(paymentOperator, amount);
63: 
64:         if (extraNative > 0) {
65:             (success, ) = target.call{value: extraNative}(payload);
66:             if (!success) {
67:                 (refund.call{value: extraNative}(""));
68:             }
69:         } else {
70:             (success, ) = target.call(payload);
71:         }
72: 
73:         uint remainingBalance = IERC20(token).balanceOf(address(this)) -
74:             initBalance;
75: 
76:         if (remainingBalance == 0) {
77:             return;
78:         }
79: 
80:         IERC20(token).transfer(refund, remainingBalance);
81:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L41-L81



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {
20:         bridgeExecutor = _executor;
21:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L21



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

26:     function setRouter(address _router) public onlyOwner {
27:         router = IDecentEthRouter(payable(_router));
28:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L26-L28



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

34:     function registerRemoteBridgeAdapter(
35:         uint256 dstChainId,
36:         uint16 dstLzId,
37:         address decentBridgeAdapter
38:     ) public onlyOwner {
39:         lzIdLookup[dstChainId] = dstLzId;
40:         chainIdLookup[dstLzId] = dstChainId;
41:         destinationBridgeAdapter[dstChainId] = decentBridgeAdapter;
42:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L34-L42



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

081:     function bridge(
082:         uint256 amt2Bridge,
083:         SwapInstructions memory postBridge,
084:         uint256 dstChainId,
085:         address target,
086:         address paymentOperator,
087:         bytes memory payload,
088:         bytes calldata additionalArgs,
089:         address payable refund
090:     ) public payable onlyUtb returns (bytes memory bridgePayload) {
091:         require(
092:             destinationBridgeAdapter[dstChainId] != address(0),
093:             string.concat("dst chain address not set ")
094:         );
095: 
096:         uint64 dstGas = abi.decode(additionalArgs, (uint64));
097: 
098:         bridgePayload = abi.encodeCall(
099:             this.receiveFromBridge,
100:             (postBridge, target, paymentOperator, payload, refund)
101:         );
102: 
103:         SwapParams memory swapParams = abi.decode(
104:             postBridge.swapPayload,
105:             (SwapParams)
106:         );
107: 
108:         if (!gasIsEth) {
109:             IERC20(bridgeToken).transferFrom(
110:                 msg.sender,
111:                 address(this),
112:                 amt2Bridge
113:             );
114:             IERC20(bridgeToken).approve(address(router), amt2Bridge);
115:         }
116: 
117:         router.bridgeWithPayload{value: msg.value}(
118:             lzIdLookup[dstChainId],
119:             destinationBridgeAdapter[dstChainId],
120:             swapParams.amountIn,
121:             false,
122:             dstGas,
123:             bridgePayload
124:         );
125:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L81-L125



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

127:     function receiveFromBridge(
128:         SwapInstructions memory postBridge,
129:         address target,
130:         address paymentOperator,
131:         bytes memory payload,
132:         address payable refund
133:     ) public onlyExecutor {
134:         SwapParams memory swapParams = abi.decode(
135:             postBridge.swapPayload,
136:             (SwapParams)
137:         );
138: 
139:         IERC20(swapParams.tokenIn).transferFrom(
140:             msg.sender,
141:             address(this),
142:             swapParams.amountIn
143:         );
144: 
145:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);
146: 
147:         IUTB(utb).receiveFromBridge(
148:             postBridge,
149:             target,
150:             paymentOperator,
151:             payload,
152:             refund
153:         );
154:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L127-L154



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

33:     function setRouter(address _router) public onlyOwner {
34:         router = IStargateRouter(_router);
35:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L33-L35



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {
38:         stargateEth = _sgEth;
39:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L39



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

45:     function registerRemoteBridgeAdapter(
46:         uint256 dstChainId,
47:         uint16 dstLzId,
48:         address decentBridgeAdapter
49:     ) public onlyOwner {
50:         lzIdLookup[dstChainId] = dstLzId;
51:         chainIdLookup[dstLzId] = dstChainId;
52:         destinationBridgeAdapter[dstChainId] = decentBridgeAdapter;
53:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L45-L53



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

69:     function bridge(
70:         uint256 amt2Bridge,
71:         SwapInstructions memory postBridge,
72:         uint256 dstChainId,
73:         address target,
74:         address paymentOperator,
75:         bytes memory payload,
76:         bytes calldata additionalArgs,
77:         address payable refund
78:     ) public payable onlyUtb returns (bytes memory bridgePayload) {
79:         address bridgeToken = abi.decode(additionalArgs, (address));
80: 
81:         bridgePayload = abi.encode(
82:             postBridge,
83:             target,
84:             paymentOperator,
85:             payload,
86:             refund
87:         );
88:         IERC20(bridgeToken).transferFrom(msg.sender, address(this), amt2Bridge);
89:         IERC20(bridgeToken).approve(address(router), amt2Bridge);
90: 
91:         callBridge(
92:             amt2Bridge,
93:             dstChainId,
94:             bridgePayload,
95:             additionalArgs,
96:             refund
97:         );
98:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L69-L98



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

183:     function sgReceive(
184:         uint16, // _srcChainid
185:         bytes memory, // _srcAddress
186:         uint256, // _nonce
187:         address, // _token
188:         uint256, // amountLD
189:         bytes memory payload
190:     ) external override onlyExecutor {
191:         (
192:             SwapInstructions memory postBridge,
193:             address target,
194:             address paymentOperator,
195:             bytes memory utbPayload,
196:             address payable refund
197:         ) = abi.decode(
198:                 payload,
199:                 (SwapInstructions, address, address, bytes, address)
200:             );
201: 
202:         SwapParams memory swapParams = abi.decode(
203:             postBridge.swapPayload,
204:             (SwapParams)
205:         );
206: 
207:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);
208: 
209:         IUTB(utb).receiveFromBridge(
210:             postBridge,
211:             target,
212:             paymentOperator,
213:             utbPayload,
214:             refund
215:         );
216:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L183-L216



```solidity

File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {
21:         uniswap_router = _router;
22:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L22



```solidity

File: src/swappers/UniSwapper.sol

24:     function setWrapped(address payable _wrapped) public onlyOwner {
25:         wrapped = _wrapped;
26:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L26



```solidity

File: src/swappers/UniSwapper.sol

58:     function swap(
59:         bytes memory swapPayload
60:     )
61:         external
62:         onlyUtb
63:         returns (address tokenOut, uint256 amountOut)
64:     {
65:         (SwapParams memory swapParams, address receiver, address refund) = abi
66:             .decode(swapPayload, (SwapParams, address, address));
67:         tokenOut = swapParams.tokenOut;
68:         if (swapParams.path.length == 0) {
69:             return swapNoPath(swapParams, receiver, refund);
70:         }
71:         if (swapParams.direction == SwapDirection.EXACT_IN) {
72:             amountOut = swapExactIn(swapParams, receiver);
73:         } else {
74:             swapExactOut(swapParams, receiver, refund);
75:             amountOut = swapParams.amountOut;
76:         }
77:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L58-L77

### [L-07]<a name="l-07"></a> Setters should have initial value check

Setters should have initial value check to prevent assigning wrong value to the variable. Assginment of wrong value can lead to unexpected behavior of the contract.

*There are 9 instance(s) of this issue:*



```solidity

File: src/UTB.sol

28:     function setExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L28-L28



```solidity

File: src/UTB.sol

36:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L36-L36



```solidity

File: src/UTB.sol

44:     function setFeeCollector(address payable _feeCollector) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L44-L44



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

26:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

33:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L33-L33



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L37



```solidity

File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L20



```solidity

File: src/swappers/UniSwapper.sol

24:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L24

### [L-08]<a name="l-08"></a> Unsafe ERC20 operation `approve()`

Approve call do not handle non-standard erc20 behavior.
- Some token contracts do not return any value.
- Some token contracts revert the transaction when the allowance is not zero.
Use `safeApprove` instead of `approve`

*There are 13 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

31:         weth.approve(target, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L31-L31



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

279:             weth.approve(address(executor), _amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L279-L279



```solidity

File: src/UTB.sol

90:         IERC20(swapParams.tokenIn).approve(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L90-L90



```solidity

File: src/UTB.sol

152:             IERC20(tokenOut).approve(address(executor), amountOut);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L152-L152



```solidity

File: src/UTB.sol

216:             IERC20(bridgeToken).approve(address(bridgeAdapter), amt2Bridge);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L216-L216



```solidity

File: src/UTB.sol

241:                 IERC20(fees.feeToken).approve(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L241-L241



```solidity

File: src/UTBExecutor.sol

62:         IERC20(token).approve(paymentOperator, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L62-L62



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

114:             IERC20(bridgeToken).approve(address(router), amt2Bridge);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L114-L114



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

145:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L145-L145



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

89:         IERC20(bridgeToken).approve(address(router), amt2Bridge);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L89-L89



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

207:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L207-L207



```solidity

File: src/swappers/UniSwapper.sol

137:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L137-L137



```solidity

File: src/swappers/UniSwapper.sol

158:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L158-L158

### [L-09]<a name="l-09"></a> Unused/empty `receive()`/`fallback()` function

If the intention is for the Ether to be used, the function should call another function or emit an event, otherwise it should revert.

*There are 12 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

85:     receive() external payable {}
86: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L85-L86



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

88:     fallback() external payable {}
89: }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L88-L89



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

337:     receive() external payable {}
338: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L337-L338



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

339:     fallback() external payable {}
340: }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L339-L340



```solidity

File: src/UTB.sol

339:     receive() external payable {}
340: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L339-L340



```solidity

File: src/UTB.sol

341:     fallback() external payable {}
342: }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L341-L342



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

156:     receive() external payable {}
157: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L156-L157



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

158:     fallback() external payable {}
159: }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L158-L159



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

218:     receive() external payable {}
219: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L218-L219



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

220:     fallback() external payable {}
221: }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L220-L221



```solidity

File: src/swappers/UniSwapper.sol

171:     receive() external payable {}
172: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L171-L172



```solidity

File: src/swappers/UniSwapper.sol

173:     fallback() external payable {}
174: }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L173-L174

### [L-10]<a name="l-10"></a> Consider implementing two-step procedure for updating protocol addresses

A copy-paste error or a typo may end up bricking protocol functionality, or sending tokens to an address with no known private key. Consider implementing a two-step procedure for updating protocol addresses, where the recipient is set as pending, and must 'accept' the assignment by making an affirmative call. A straight forward way of doing this would be to have the target contracts implement [EIP-165](https://eips.ethereum.org/EIPS/eip-165), and to have the 'set' functions ensure that the recipient is of the right interface type.

*There are 4 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {
20:         bridgeExecutor = _executor;
21:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L21



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {
38:         stargateEth = _sgEth;
39:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L39



```solidity

File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {
21:         uniswap_router = _router;
22:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L22



```solidity

File: src/swappers/UniSwapper.sol

24:     function setWrapped(address payable _wrapped) public onlyOwner {
25:         wrapped = _wrapped;
26:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L26

### [L-11]<a name="l-11"></a> Functions calling contracts/addresses with transfer hooks are missing reentrancy guards

Even if the function follows the best practice of check-effects-interaction, not using a reentrancy guard when there may be transfer hooks will open the users of this protocol up to [read-only reentrancies](https://chainsecurity.com/curve-lp-oracle-manipulation-post-mortem/) with no way to protect against it, except by block-listing the whole protocol.

*There are 8 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

//@audit function `_executeWeth()` is not protected against reentrancy
44:         weth.transfer(from, remainingAfterCall);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L44-L44



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit function `_bridgeWithPayload()` is not protected against reentrancy
181:             weth.transferFrom(msg.sender, address(this), _amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L181-L181



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit function `addLiquidityWeth()` is not protected against reentrancy
325:         weth.transferFrom(msg.sender, address(this), amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L325-L325



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit function `removeLiquidityWeth()` is not protected against reentrancy
334:         weth.transfer(msg.sender, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L334-L334



```solidity

File: src/UTB.sol

//@audit function `performSwap()` is not protected against reentrancy
83:             IERC20(swapParams.tokenIn).transferFrom(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L83-L83



```solidity

File: src/swappers/UniSwapper.sol

//@audit function `_refundUser()` is not protected against reentrancy
44:         IERC20(token).transfer(user, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L44-L44



```solidity

File: src/swappers/UniSwapper.sol

//@audit function `_sendToRecipient()` is not protected against reentrancy
55:         IERC20(token).transfer(recipient, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L55-L55



```solidity

File: src/swappers/UniSwapper.sol

//@audit function `_receiveAndWrapIfNeeded()` is not protected against reentrancy
83:             IERC20(swapParams.tokenIn).transferFrom(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L83-L83

### [L-12]<a name="l-12"></a> Some function should not be marked as payable

Some function should not be marked as payable, otherwise the ETH that mistakenly sent along with the function call is locked in the contract

*There are 22 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

85:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L85-L85



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

88:     fallback() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L88-L88



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

197:     function bridgeWithPayload(
198:         uint16 _dstChainId,
199:         address _toAddress,
200:         uint _amount,
201:         bool deliverEth,
202:         uint64 _dstGasForCall,
203:         bytes memory additionalPayload
204:     ) public payable {
205:         return
206:             _bridgeWithPayload(
207:                 MT_ETH_TRANSFER_WITH_PAYLOAD,
208:                 _dstChainId,
209:                 _toAddress,
210:                 _amount,
211:                 _dstGasForCall,
212:                 additionalPayload,
213:                 deliverEth
214:             );
215:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L197-L215



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

218:     function bridge(
219:         uint16 _dstChainId,
220:         address _toAddress,
221:         uint _amount,
222:         uint64 _dstGasForCall,
223:         bool deliverEth // if false, delivers WETH
224:     ) public payable {
225:         _bridgeWithPayload(
226:             MT_ETH_TRANSFER,
227:             _dstChainId,
228:             _toAddress,
229:             _amount,
230:             _dstGasForCall,
231:             bytes(""),
232:             deliverEth
233:         );
234:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L218-L234



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

322:     function addLiquidityWeth(
323:         uint256 amount
324:     ) public payable userDepositing(amount) {
325:         weth.transferFrom(msg.sender, address(this), amount);
326:         dcntEth.mint(address(this), amount);
327:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L322-L327



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

337:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L337-L337



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

339:     fallback() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L339-L339



```solidity

File: src/UTB.sol

108:     function swapAndExecute(
109:         SwapAndExecuteInstructions calldata instructions,
110:         FeeStructure calldata fees,
111:         bytes calldata signature
112:     )
113:         public
114:         payable
115:         retrieveAndCollectFees(fees, abi.encode(instructions, fees), signature)
116:     {
117:         _swapAndExecute(
118:             instructions.swapInstructions,
119:             instructions.target,
120:             instructions.paymentOperator,
121:             instructions.payload,
122:             instructions.refund
123:         );
124:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L108-L124



```solidity

File: src/UTB.sol

259:     function bridgeAndExecute(
260:         BridgeInstructions calldata instructions,
261:         FeeStructure calldata fees,
262:         bytes calldata signature
263:     )
264:         public
265:         payable
266:         retrieveAndCollectFees(fees, abi.encode(instructions, fees), signature)
267:         returns (bytes memory)
268:     {
269:         (
270:             uint256 amt2Bridge,
271:             BridgeInstructions memory updatedInstructions
272:         ) = swapAndModifyPostBridge(instructions);
273:         return callBridge(amt2Bridge, fees.bridgeFee, updatedInstructions);
274:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L259-L274



```solidity

File: src/UTB.sol

339:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L339-L339



```solidity

File: src/UTB.sol

341:     fallback() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L341-L341



```solidity

File: src/UTBExecutor.sol

19:     function execute(
20:         address target,
21:         address paymentOperator,
22:         bytes memory payload,
23:         address token,
24:         uint amount,
25:         address payable refund
26:     ) public payable onlyOwner {
27:         return
28:             execute(target, paymentOperator, payload, token, amount, refund, 0);
29:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L19-L29



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

156:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L156-L156



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

158:     fallback() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L158-L158



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

69:     function bridge(
70:         uint256 amt2Bridge,
71:         SwapInstructions memory postBridge,
72:         uint256 dstChainId,
73:         address target,
74:         address paymentOperator,
75:         bytes memory payload,
76:         bytes calldata additionalArgs,
77:         address payable refund
78:     ) public payable onlyUtb returns (bytes memory bridgePayload) {
79:         address bridgeToken = abi.decode(additionalArgs, (address));
80: 
81:         bridgePayload = abi.encode(
82:             postBridge,
83:             target,
84:             paymentOperator,
85:             payload,
86:             refund
87:         );
88:         IERC20(bridgeToken).transferFrom(msg.sender, address(this), amt2Bridge);
89:         IERC20(bridgeToken).approve(address(router), amt2Bridge);
90: 
91:         callBridge(
92:             amt2Bridge,
93:             dstChainId,
94:             bridgePayload,
95:             additionalArgs,
96:             refund
97:         );
98:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L69-L98



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

218:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L218-L218



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

220:     fallback() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L220-L220



```solidity

File: src/swappers/UniSwapper.sol

100:     function swapNoPath(
101:         SwapParams memory swapParams,
102:         address receiver,
103:         address refund
104:     ) public payable returns (address tokenOut, uint256 amountOut) {
105:         swapParams = _receiveAndWrapIfNeeded(swapParams);
106: 
107:         if (swapParams.direction == SwapDirection.EXACT_OUT) {
108:             _refundUser(
109:                 refund,
110:                 swapParams.tokenIn,
111:                 swapParams.amountIn - swapParams.amountOut
112:             );
113:         }
114: 
115:         uint amt2Recipient = swapParams.direction == SwapDirection.EXACT_OUT
116:             ? swapParams.amountOut
117:             : swapParams.amountIn;
118: 
119:         _sendToRecipient(receiver, swapParams.tokenOut, amt2Recipient);
120:         return (swapParams.tokenOut, amt2Recipient);
121:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L100-L121



```solidity

File: src/swappers/UniSwapper.sol

123:     function swapExactIn(
124:         SwapParams memory swapParams, // SwapParams is a struct
125:         address receiver
126:     ) public payable routerIsSet returns (uint256 amountOut) {
127:         swapParams = _receiveAndWrapIfNeeded(swapParams);
128: 
129:         IV3SwapRouter.ExactInputParams memory params = IV3SwapRouter
130:             .ExactInputParams({
131:                 path: swapParams.path,
132:                 recipient: address(this),
133:                 amountIn: swapParams.amountIn,
134:                 amountOutMinimum: swapParams.amountOut
135:             });
136: 
137:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);
138:         amountOut = IV3SwapRouter(uniswap_router).exactInput(params);
139: 
140:         _sendToRecipient(receiver, swapParams.tokenOut, amountOut);
141:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L123-L141



```solidity

File: src/swappers/UniSwapper.sol

143:     function swapExactOut(
144:         SwapParams memory swapParams,
145:         address receiver,
146:         address refundAddress
147:     ) public payable routerIsSet returns (uint256 amountIn) {
148:         swapParams = _receiveAndWrapIfNeeded(swapParams);
149:         IV3SwapRouter.ExactOutputParams memory params = IV3SwapRouter
150:             .ExactOutputParams({
151:                 path: swapParams.path,
152:                 recipient: address(this),
153:                 //deadline: block.timestamp,
154:                 amountOut: swapParams.amountOut,
155:                 amountInMaximum: swapParams.amountIn
156:             });
157: 
158:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);
159:         amountIn = IV3SwapRouter(uniswap_router).exactOutput(params);
160: 
161:         // refund sender
162:         _refundUser(
163:             refundAddress,
164:             swapParams.tokenIn,
165:             params.amountInMaximum - amountIn
166:         );
167: 
168:         _sendToRecipient(receiver, swapParams.tokenOut, swapParams.amountOut);
169:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L143-L169



```solidity

File: src/swappers/UniSwapper.sol

171:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L171-L171



```solidity

File: src/swappers/UniSwapper.sol

173:     fallback() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L173-L173

### [L-13]<a name="l-13"></a> prevent re-setting a state variable with the same value

Not only is wasteful in terms of gas, but this is especially problematic when an event is emitted and the old and new values set are the same, as listeners might not expect this kind of scenario.

*There are 10 instance(s) of this issue:*



```solidity

File: src/UTB.sol

28:     function setExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L28-L28



```solidity

File: src/UTB.sol

36:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L36-L36



```solidity

File: src/UTB.sol

44:     function setFeeCollector(address payable _feeCollector) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L44-L44



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

26:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

33:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L33-L33



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L37



```solidity

File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L20



```solidity

File: src/swappers/UniSwapper.sol

24:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L24



```solidity

File: src/swappers/UniSwapper.sol

32:     function updateSwapParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L32-L32

### [L-14]<a name="l-14"></a> Function can return unassigned variable

Make sure that functions with a return value always return a valid and assigned value. Even if the default value is as expected, it should be assigned with the default value for code clarity and to reduce confusion.

*There are 1 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

121:         return lzTxObj;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L121-L121

### [L-15]<a name="l-15"></a> Low Level Calls to Custom Addresses

Low-level calls (such as `.call()`, `.delegatecall()`, or `.callcode()`) in Solidity provide a way to interact with other contracts or addresses. However, when these calls are made to addresses that are provided as parameters or are not well-validated, they pose a significant security risk. Untrusted addresses might contain malicious code leading to unexpected behavior, loss of funds, or vulnerabilities.\n\n** Resolution **: Prefer using high- level Solidity function calls or interface - based interactions with known contracts to ensure security.If low - level calls are necessary, rigorously validate the addresses and test all possible interactions.Implementing additional checks and fail - safes can help mitigate potential risks associated with low - level calls.

*There are 7 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

33:         (bool success, ) = target.call(callPayload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L33-L33



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

61:         (bool success, ) = target.call{value: amount}(callPayload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L61-L61



```solidity

File: src/UTBExecutor.sol

52:             (success, ) = target.call{value: amount}(payload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L52-L52



```solidity

File: src/UTBExecutor.sol

54:                 (refund.call{value: amount}(""));


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L54-L54



```solidity

File: src/UTBExecutor.sol

65:             (success, ) = target.call{value: extraNative}(payload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L65-L65



```solidity

File: src/UTBExecutor.sol

67:                 (refund.call{value: extraNative}(""));


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L67-L67



```solidity

File: src/UTBExecutor.sol

70:             (success, ) = target.call(payload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L70-L70

### [L-16]<a name="l-16"></a> Empty receive functions can cause gas issues

In Solidity, functions that receive Ether without corresponding functionality to utilize or withdraw these funds can inadvertently lead to a permanent loss of value. This is because if someone sends Ether to the contract, they may be unable to retrieve it. To avoid this, functions receiving Ether should be accompanied by additional methods that process or allow the withdrawal of these funds. If the intent is to use the received Ether, it should trigger a separate function; if not, it should revert the transaction (for instance, via `require(msg.sender == address(weth))`). Access control checks can also prevent unintended Ether transfers, despite the slight gas cost they entail. If concerns over gas costs persist, at minimum, include a rescue function to recover unused Ether. Missteps in handling Ether in smart contracts can lead to irreversible financial losses, hence these precautions are crucial.

*There are 6 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

85:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L85-L85



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

337:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L337-L337



```solidity

File: src/UTB.sol

339:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L339-L339



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

156:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L156-L156



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

218:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L218-L218



```solidity

File: src/swappers/UniSwapper.sol

171:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L171-L171

### Gas Risk Issues

### [G-01]<a name="g-01"></a> Multiple accesses of a mapping/array should use a local variable cache

The instances below point to the second+ access of a value inside a mapping/array, within a function. Caching a mapping's value in a local `storage` or `calldata` variable when the value is accessed [multiple times](https://gist.github.com/IllIllI000/ec23a57daa30a8f8ca8b9681c8ccefb0), saves **~42 gas per access** due to not having to recalculate the key's keccak256 hash (Gkeccak256 - **30 gas**) and that calculation's associated stack operations. Caching an array's struct avoids recalculating the array offsets into memory/calldata

*There are 1 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

92:             destinationBridgeAdapter[dstChainId] != address(0),


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L92-L92

### [G-02]<a name="g-02"></a> Use assembly to check for `address(0)`

*Saves 6 gas per instance*

*There are 12 instance(s) of this issue:*



```solidity

File: src/UTB.sol

74:         if (swapParams.tokenIn == address(0)) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L74-L74



```solidity

File: src/UTB.sol

97:         if (tokenOut == address(0)) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L97-L97



```solidity

File: src/UTB.sol

142:         if (tokenOut == address(0)) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L142-L142



```solidity

File: src/UTB.sol

215:         if (bridgeToken != address(0)) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L215-L215



```solidity

File: src/UTB.sol

233:         if (address(feeCollector) != address(0)) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L233-L233



```solidity

File: src/UTB.sol

235:             if (fees.feeToken != address(0)) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L235-L235



```solidity

File: src/UTBExecutor.sol

51:         if (token == address(0)) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L51-L51



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

92:             destinationBridgeAdapter[dstChainId] != address(0),


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L92-L92



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

158:             dstAddr != address(0),


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L158-L158



```solidity

File: src/swappers/UniSwapper.sol

52:         if (token == address(0)) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L52-L52



```solidity

File: src/swappers/UniSwapper.sol

82:         if (swapParams.tokenIn != address(0)) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L82-L82



```solidity

File: src/swappers/UniSwapper.sol

96:         require(uniswap_router != address(0), "router not set");


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L96-L96

### [G-03]<a name="g-03"></a> Use assembly in place of `abi.decode` to extract `calldata` values more efficiently

Instead of using abi.decode, we can use assembly to decode our desired calldata values directly. This will allow us to avoid decoding calldata values that we will not use.
For more details on how to implement this, check the following [report](https://code4rena.com/reports/2023-05-juicebox#g-04-use-assembly-in-place-of-abidecode-to-extract-calldata-values-more-efficiently)

*There are 9 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

117:         (, , IStargateRouter.lzTxObj memory lzTxObj) = abi.decode(
118:             additionalArgs,
119:             (address, LzBridgeData, IStargateRouter.lzTxObj)
120:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L117-L120



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

117:         (, , IStargateRouter.lzTxObj memory lzTxObj) = abi.decode(
118:             additionalArgs,
119:             (address, LzBridgeData, IStargateRouter.lzTxObj)
120:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L117-L120



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

127:         (, LzBridgeData memory lzBridgeData, ) = abi.decode(
128:             additionalArgs,
129:             (address, LzBridgeData, IStargateRouter.lzTxObj)
130:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L127-L130



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

127:         (, LzBridgeData memory lzBridgeData, ) = abi.decode(
128:             additionalArgs,
129:             (address, LzBridgeData, IStargateRouter.lzTxObj)
130:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L127-L130



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

137:         (, LzBridgeData memory lzBridgeData, ) = abi.decode(
138:             additionalArgs,
139:             (address, LzBridgeData, IStargateRouter.lzTxObj)
140:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L137-L140



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

137:         (, LzBridgeData memory lzBridgeData, ) = abi.decode(
138:             additionalArgs,
139:             (address, LzBridgeData, IStargateRouter.lzTxObj)
140:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L137-L140



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

147:         (, LzBridgeData memory lzBridgeData, ) = abi.decode(
148:             additionalArgs,
149:             (address, LzBridgeData, IStargateRouter.lzTxObj)
150:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L147-L150



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

147:         (, LzBridgeData memory lzBridgeData, ) = abi.decode(
148:             additionalArgs,
149:             (address, LzBridgeData, IStargateRouter.lzTxObj)
150:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L147-L150



```solidity

File: src/swappers/UniSwapper.sol

36:         (, address receiver, address refund) = abi.decode(
37:             payload,
38:             (SwapParams, address, address)
39:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L36-L39

### [G-04]<a name="g-04"></a> Optimize Address Storage Value Management with `assembly`

 

*There are 8 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

77:         destinationBridges[_dstChainId] = _routerAddress;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L77-L77



```solidity

File: src/UTB.sol

327:         swappers[s.getId()] = swapper;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L327-L327



```solidity

File: src/UTB.sol

336:         bridgeAdapters[b.getId()] = bridge;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L336-L336



```solidity

File: src/bridge_adapters/BaseAdapter.sol

20:         bridgeExecutor = _executor;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L20-L20



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

41:         destinationBridgeAdapter[dstChainId] = decentBridgeAdapter;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L41-L41



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

52:         destinationBridgeAdapter[dstChainId] = decentBridgeAdapter;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L52-L52



```solidity

File: src/swappers/UniSwapper.sol

21:         uniswap_router = _router;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L21-L21



```solidity

File: src/swappers/UniSwapper.sol

25:         wrapped = _wrapped;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L25-L25

### [G-05]<a name="g-05"></a> Use assembly to emit events

We can use assembly to emit events efficiently by utilizing `scratch space` and the `free memory pointer`. This will allow us to potentially avoid memory expansion costs. Note: In order to do this optimization safely, we will need to cache and restore the free memory pointer.

*There are 1 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

257:         emit ReceivedDecentEth(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L257-L257

### [G-06]<a name="g-06"></a> Using bools for storage incurs overhead

Use uint256(1) and uint256(2) for true/false to avoid a Gwarmaccess (100 gas), and to avoid Gsset (20000 gas) when changing from 'false' to 'true', after having been 'true' in the past. See [source](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/58f635312aa21f947cae5f8578638a85aa2519f5/contracts/security/ReentrancyGuard.sol#L23-L27).

*There are 3 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

//@audit avoid using `bool` type for gasCurrencyIsEth
10:     bool public gasCurrencyIsEth; // for chains that use ETH as gas currency


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L10-L10



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit avoid using `bool` type for gasCurrencyIsEth
22:     bool public gasCurrencyIsEth; // for chains that use ETH as gas currency


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L22-L22



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit avoid using `bool` type for gasIsEth
18:     bool gasIsEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L18-L18

### [G-07]<a name="g-07"></a> State variables should be cached in stack variables rather than re-reading them from storage

The instances below point to the second+ access of a state variable within a function. Caching of a state variable replaces each Gwarmaccess (100 gas) with a much cheaper stack read. Other less obvious fixes/optimizations include having local memory caches of state variable structs, or having local caches of state variable contracts/addresses.

*Saves 100 gas per instance*

*There are 4 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

114:             IERC20(bridgeToken).approve(address(router), amt2Bridge);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L114-L114



```solidity

File: src/swappers/UniSwapper.sol

91:         IWETH(wrapped).deposit{value: swapParams.amountIn}();


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L91-L91



```solidity

File: src/swappers/UniSwapper.sol

138:         amountOut = IV3SwapRouter(uniswap_router).exactInput(params);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L138-L138



```solidity

File: src/swappers/UniSwapper.sol

159:         amountIn = IV3SwapRouter(uniswap_router).exactOutput(params);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L159-L159

### [G-08]<a name="g-08"></a> Use calldata instead of memory for function arguments that do not get mutated

Mark data types as `calldata` instead of `memory` where possible. This makes it so that the data is not automatically loaded into memory. If the data passed into the function does not need to be changed (like updating values in an array), it can be passed in as `calldata`. The one exception to this is if the argument must later be passed into another function that takes an argument that specifies `memory` storage.

*There are 3 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit Make `postBridge` as a calldata
45:         SwapInstructions memory postBridge,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L45-L45



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit Make `postBridge` as a calldata
83:         SwapInstructions memory postBridge,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L83-L83



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit Make `payload` as a calldata
87:         bytes memory payload,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L87-L87

### [G-09]<a name="g-09"></a> With assembly, `.call (bool success)` transfer can be done gas-optimized

`return` data `(bool success,)` has to be stored due to EVM architecture, but in a usage like below, `out` and `outsize` values are given (0,0), this storage disappears and gas optimization is provided.

*There are 5 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

61:         (bool success, ) = target.call{value: amount}(callPayload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L61-L61



```solidity

File: src/UTBExecutor.sol

52:             (success, ) = target.call{value: amount}(payload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L52-L52



```solidity

File: src/UTBExecutor.sol

54:                 (refund.call{value: amount}(""));


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L54-L54



```solidity

File: src/UTBExecutor.sol

65:             (success, ) = target.call{value: extraNative}(payload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L65-L65



```solidity

File: src/UTBExecutor.sol

67:                 (refund.call{value: extraNative}(""));


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L67-L67

### [G-10]<a name="g-10"></a> Use custom errors rather than `revert()`/`require()` strings to save gas

Custom errors are available from solidity version 0.8.4. Custom errors save [**~50 gas**](https://gist.github.com/IllIllI000/ad1bd0d29a0101b25e57c293b4b0c746) each time they're hit by [avoiding having to allocate and store the revert string](https://blog.soliditylang.org/2021/04/21/custom-errors/#errors-in-depth). Not defining the strings also save deployment gas

*There are 9 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

38:         require(gasCurrencyIsEth, "Gas currency is not ETH");


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L38-L38



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

43:         require(
44:             address(dcntEth) == msg.sender,
45:             "DecentEthRouter: only lz App can call"
46:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L43-L46



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

51:         require(weth.balanceOf(address(this)) > amount, "not enough reserves");


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L51-L51



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

62:         require(balance >= amount, "not enough balance");


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L62-L62



```solidity

File: src/UTB.sol

75:             require(msg.value >= swapParams.amountIn, "not enough native");


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L75-L75



```solidity

File: src/bridge_adapters/BaseAdapter.sol

12:         require(
13:             msg.sender == address(bridgeExecutor),
14:             "Only bridge executor can call this"
15:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L12-L15



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

91:         require(
92:             destinationBridgeAdapter[dstChainId] != address(0),
93:             string.concat("dst chain address not set ")
94:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L91-L94



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

157:         require(
158:             dstAddr != address(0),
159:             string.concat("dst chain address not set ")
160:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L157-L160



```solidity

File: src/swappers/UniSwapper.sol

96:         require(uniswap_router != address(0), "router not set");


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L96-L96

### [G-11]<a name="g-11"></a> Divisions which do not divide by -X cannot overflow or overflow so such operations can be unchecked to save gas

Make such found divisions are unchecked when ensured it is safe to do so

*There are 2 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

66:         return (amt2Bridge * (1e4 - SG_FEE_BPS)) / 1e4;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L66-L66



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L176-L176

### [G-12]<a name="g-12"></a> `require()`/`revert()` strings longer than 32 bytes cost extra gas

Each extra memory word of bytes past the original 32 [incurs an MSTORE](https://gist.github.com/hrkrshnn/ee8fabd532058307229d65dcd5836ddc#consider-having-short-revert-strings) which costs **3 gas**

*There are 2 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

43:         require(
44:             address(dcntEth) == msg.sender,
45:             "DecentEthRouter: only lz App can call"
46:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L43-L46



```solidity

File: src/bridge_adapters/BaseAdapter.sol

12:         require(
13:             msg.sender == address(bridgeExecutor),
14:             "Only bridge executor can call this"
15:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L12-L15

### [G-13]<a name="g-13"></a> Reduce gas usage by moving to Solidity 0.8.19 or later

See [this](https://blog.soliditylang.org/2023/02/22/solidity-0.8.19-release-announcement/#preventing-dead-code-in-runtime-bytecode) link for the full details

*There are 9 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

2: pragma solidity ^0.8.13;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L2-L2



```solidity

File: src/UTB.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L2-L2



```solidity

File: src/UTBExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L2-L2



```solidity

File: src/bridge_adapters/BaseAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L2-L2



```solidity

File: src/swappers/SwapParams.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L2-L2



```solidity

File: src/swappers/UniSwapper.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L2-L2

### [G-14]<a name="g-14"></a> Optimize names to save gas

`public`/`external` function names and `public` member variable names can be optimized to save gas. See [this](https://gist.github.com/IllIllI000/a5d8b486a8259f9f77891a919febd1a9) link for an example of how it works. Below are the interfaces/abstract contracts that can be optimized so that the most frequently-called functions use the least amount of gas possible during method lookup. Method IDs that have two leading zero bytes can save **128 gas** each during deployment, and renaming functions to have lower method IDs will save **22 gas** per call, [per sorted position shifted](https://medium.com/joyso/solidity-how-does-function-name-affect-gas-consumption-in-smart-contract-47d270d8ac92)

*There are 5 instance(s) of this issue:*



```solidity

File: src/UTB.sol

// @audit setExecutor(address) ==> setExecutor_1ow(address),0000d9ab
// @audit registerSwapper(address) ==> registerSwapper_O2B(address),0000e1f1
// @audit registerBridge(address) ==> registerBridge_uav(address),00005881
15: contract UTB is Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L15-L15



```solidity

File: src/bridge_adapters/BaseAdapter.sol

// @audit setBridgeExecutor(address) ==> setBridgeExecutor_yR(address),0000aae0
6: contract BaseAdapter is UTBOwned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L6-L6



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

// @audit setRouter(address) ==> setRouter_Pkc(address),00004a73
// @audit registerRemoteBridgeAdapter(uint256,uint16,address) ==> registerRemoteBridgeAdapter_SxA(uint256,uint16,address),000061da
12: contract DecentBridgeAdapter is BaseAdapter, IBridgeAdapter {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L12-L12



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

// @audit setRouter(address) ==> setRouter_Pkc(address),00004a73
// @audit setStargateEth(address) ==> setStargateEth_wm8(address),00003c5b
// @audit registerRemoteBridgeAdapter(uint256,uint16,address) ==> registerRemoteBridgeAdapter_SxA(uint256,uint16,address),000061da
17: contract StargateBridgeAdapter is


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L17-L17



```solidity

File: src/swappers/UniSwapper.sol

// @audit setRouter(address) ==> setRouter_Pkc(address),00004a73
13: contract UniSwapper is UTBOwned, ISwapper {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L13-L13

### [G-15]<a name="g-15"></a> Not using the named return variables anywhere in the function is confusing

Consider changing the variable to be an unnamed one, since the variable is never assigned, nor is it returned by name. If the optimizer is not turned on, leaving the code as it is will also waste gas for the stack variable.

*There are 6 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

// @audit nativeFee
// @audit zroFee
113:     function estimateSendAndCallFee(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L113-L113



```solidity

File: src/UTB.sol

// @audit tokenOut
// @audit amountOut
52:     function performSwap(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L52-L52



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

// @audit nativeFee
// @audit zroFee
44:     function estimateFees(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L44-L44



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

// @audit value
100:     function getValue(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L100-L100



```solidity

File: src/swappers/UniSwapper.sol

// @audit _swapParams
79:     function _receiveAndWrapIfNeeded(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L79-L79



```solidity

File: src/swappers/UniSwapper.sol

// @audit tokenOut
// @audit amountOut
100:     function swapNoPath(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L100-L100

### [G-16]<a name="g-16"></a> Enable Solidity's optimizer

Make sure Solidity's optimizer is enabled. It reduces gas costs. If you want to gas optimize for contract deployment (costs less to deploy a contract) then set the Solidity optimizer at a low number. If you want to optimize for run-time gas costs (when functions are called on a contract) then set the optimizer to a high number.
Set the optimization value higher than 800 in your hardhat.config.ts file.

*There are 1 instance(s) of this issue:*



```solidity

File: hardhat.config.ts

//@audit /home/oualid/c4/competitions/2024-01-decent/hardhat.config.ts
1: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//hardhat.config.ts#L1-L1

### [G-17]<a name="g-17"></a> Constructors can be marked `payable`

Payable functions cost less gas to execute, since the compiler does not have to add extra checks to ensure that a payment wasn't provided.A constructor can safely be marked as payable, since only the deployer would be able to pass funds, and the project itself would not pass any funds.

*There are 8 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

12:     constructor(address _weth, bool gasIsEth) Owned(msg.sender) {
13:         weth = IWETH(payable(_weth));
14:         gasCurrencyIsEth = gasIsEth;
15:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L12-L15



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

27:     constructor(
28:         address payable _wethAddress,
29:         bool gasIsEth,
30:         address _executor
31:     ) Owned(msg.sender) {
32:         weth = IWETH(_wethAddress);
33:         gasCurrencyIsEth = gasIsEth;
34:         executor = IDecentBridgeExecutor(payable(_executor));
35:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L27-L35



```solidity

File: src/UTB.sol

16:     constructor() Owned(msg.sender) {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L16-L16



```solidity

File: src/UTBExecutor.sol

8:     constructor() Owned(msg.sender) {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L8-L8



```solidity

File: src/bridge_adapters/BaseAdapter.sol

9:     constructor() UTBOwned() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L9-L9



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

21:     constructor(bool _gasIsEth, address _bridgeToken) BaseAdapter() {
22:         gasIsEth = _gasIsEth;
23:         bridgeToken = _bridgeToken;
24:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L21-L24



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

29:     constructor() BaseAdapter() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L29-L29



```solidity

File: src/swappers/UniSwapper.sol

14:     constructor() UTBOwned() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L14-L14

### [G-18]<a name="g-18"></a> Using `private` rather than `public` for constants, saves gas

If needed, the values can be read from the verified contract source code, or if there are multiple values there can be a single getter function that [returns a tuple](https://github.com/code-423n4/2022-08-frax/blob/90f55a9ce4e25bceed3a74290b854341d8de6afa/src/contracts/FraxlendPair.sol#L156-L178) of the values of all currently-public constants. Saves **3406-3606 gas** in deployment gas due to the compiler not having to create non-payable getter functions for deployment calldata, not having to store the bytes of the value outside of where it's used, and not adding another entry to the method ID table

*There are 7 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

17:     uint8 public constant MT_ETH_TRANSFER = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L17-L17



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

18:     uint8 public constant MT_ETH_TRANSFER_WITH_PAYLOAD = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L18-L18



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

20:     uint16 public constant PT_SEND_AND_CALL = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L20-L20



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

13:     uint8 public constant BRIDGE_ID = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L13-L13



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

22:     uint8 public constant BRIDGE_ID = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L22-L22



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

23:     uint8 public constant SG_FEE_BPS = 6;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L23-L23



```solidity

File: src/swappers/UniSwapper.sol

16:     uint8 public constant SWAPPER_ID = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L16-L16

### [G-19]<a name="g-19"></a> `private` functions only called once can be inlined to save gas

Not inlining costs 20 to 40 gas because of two extra JUMP instructions and additional stack operations needed for function calls.

*There are 11 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

24:     function _executeWeth(
25:         address from,
26:         address target,
27:         uint256 amount,
28:         bytes memory callPayload
29:     ) private {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L24-L29



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

54:     function _executeEth(
55:         address from,
56:         address target,
57:         uint256 amount,
58:         bytes memory callPayload
59:     ) private {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L54-L59



```solidity

File: src/UTB.sol

168:     function swapAndModifyPostBridge(
169:         BridgeInstructions memory instructions
170:     )
171:         private
172:         returns (
173:             uint256 amount2Bridge,
174:             BridgeInstructions memory updatedInstructions
175:         )
176:     {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L168-L176



```solidity

File: src/UTB.sol

207:     function approveAndCheckIfNative(
208:         BridgeInstructions memory instructions,
209:         uint256 amt2Bridge
210:     ) private returns (bool) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L207-L210



```solidity

File: src/UTB.sol

282:     function callBridge(
283:         uint256 amt2Bridge,
284:         uint bridgeFee,
285:         BridgeInstructions memory instructions
286:     ) private returns (bytes memory) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L282-L286



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

114:     function getLzTxObj(
115:         bytes calldata additionalArgs
116:     ) private pure returns (IStargateRouter.lzTxObj memory) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L114-L116



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

124:     function getDstChainId(
125:         bytes calldata additionalArgs
126:     ) private pure returns (uint16) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L124-L126



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

134:     function getSrcPoolId(
135:         bytes calldata additionalArgs
136:     ) private pure returns (uint120) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L134-L136



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

144:     function getDstPoolId(
145:         bytes calldata additionalArgs
146:     ) private pure returns (uint120) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L144-L146



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

154:     function getDestAdapter(uint chainId) private view returns (address dstAddr) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L154-L154



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

163:     function callBridge(
164:         uint256 amt2Bridge,
165:         uint256 dstChainId,
166:         bytes memory bridgePayload,
167:         bytes calldata additionalArgs,
168:         address payable refund
169:     ) private {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L163-L169

### [G-20]<a name="g-20"></a> Functions guaranteed to revert when called by normal users can be marked `payable`

If a function modifier such as `onlyOwner` is used, the function will revert if a normal user tries to pay the function. Marking the function as `payable` will lower the gas cost for legitimate callers because the compiler will not include checks for whether a payment was provided.The extra opcodes avoided are `CALLVALUE`(2), `DUP1`(3), `ISZERO`(3), `PUSH2`(3), `JUMPI`(10), `PUSH1`(3), `DUP1`(3), `REVERT`(0), `JUMPDEST`(1), `POP`(2), which costs an average of about ** 21 gas per call ** to the function, in addition to the extra deployment cost

*There are 24 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

68:     function execute(
69:         address from,
70:         address target,
71:         bool deliverEth,
72:         uint256 amount,
73:         bytes memory callPayload
74:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L68-L74



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

68:     function registerDcntEth(address _addr) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L68-L68



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

73:     function addDestinationBridge(
74:         uint16 _dstChainId,
75:         address _routerAddress
76:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L73-L76



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

237:     function onOFTReceived(
238:         uint16 _srcChainId,
239:         bytes calldata,
240:         uint64,
241:         bytes32,
242:         uint _amount,
243:         bytes memory _payload
244:     ) external override onlyLzApp {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L237-L244



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

285:     function redeemEth(
286:         uint256 amount
287:     ) public onlyIfWeHaveEnoughReserves(amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L285-L287



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

294:     function redeemWeth(
295:         uint256 amount
296:     ) public onlyIfWeHaveEnoughReserves(amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L294-L296



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

313:     function removeLiquidityEth(
314:         uint256 amount
315:     ) public onlyEthChain userIsWithdrawing(amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L313-L315



```solidity

File: src/UTB.sol

28:     function setExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L28-L28



```solidity

File: src/UTB.sol

36:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L36-L36



```solidity

File: src/UTB.sol

44:     function setFeeCollector(address payable _feeCollector) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L44-L44



```solidity

File: src/UTB.sol

325:     function registerSwapper(address swapper) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L325-L325



```solidity

File: src/UTB.sol

334:     function registerBridge(address bridge) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L334-L334



```solidity

File: src/UTBExecutor.sol

41:     function execute(
42:         address target,
43:         address paymentOperator,
44:         bytes memory payload,
45:         address token,
46:         uint amount,
47:         address payable refund,
48:         uint extraNative
49:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L41-L49



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

26:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

34:     function registerRemoteBridgeAdapter(
35:         uint256 dstChainId,
36:         uint16 dstLzId,
37:         address decentBridgeAdapter
38:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L34-L38



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

127:     function receiveFromBridge(
128:         SwapInstructions memory postBridge,
129:         address target,
130:         address paymentOperator,
131:         bytes memory payload,
132:         address payable refund
133:     ) public onlyExecutor {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L127-L133



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

33:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L33-L33



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L37



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

45:     function registerRemoteBridgeAdapter(
46:         uint256 dstChainId,
47:         uint16 dstLzId,
48:         address decentBridgeAdapter
49:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L45-L49



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

183:     function sgReceive(
184:         uint16, // _srcChainid
185:         bytes memory, // _srcAddress
186:         uint256, // _nonce
187:         address, // _token
188:         uint256, // amountLD
189:         bytes memory payload
190:     ) external override onlyExecutor {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L183-L190



```solidity

File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L20



```solidity

File: src/swappers/UniSwapper.sol

24:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L24



```solidity

File: src/swappers/UniSwapper.sol

58:     function swap(
59:         bytes memory swapPayload
60:     )
61:         external
62:         onlyUtb
63:         returns (address tokenOut, uint256 amountOut)
64:     {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L58-L64

### [G-21]<a name="g-21"></a> Avoid updating storage when the value hasn't changed to save gas

If the old value is equal to the new value, not re-storing the value will avoid a Gsreset (**2900 gas**), potentially at the expense of a Gcoldsload (**2100 gas**) or a Gwarmaccess (**100 gas**)

*There are 10 instance(s) of this issue:*



```solidity

File: src/UTB.sol

28:     function setExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L28-L28



```solidity

File: src/UTB.sol

36:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L36-L36



```solidity

File: src/UTB.sol

44:     function setFeeCollector(address payable _feeCollector) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L44-L44



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

26:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

33:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L33-L33



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L37



```solidity

File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L20



```solidity

File: src/swappers/UniSwapper.sol

24:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L24



```solidity

File: src/swappers/UniSwapper.sol

32:     function updateSwapParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L32-L32

### [G-22]<a name="g-22"></a> Usage of `uints`/`ints` smaller than 32 bytes (256 bits) incurs overhead

> When using elements that are smaller than 32 bytes, your contract's gas usage may be higher. This is because the EVM operates on 32 bytes at a time. Therefore, if the element is smaller than that, the EVM must use more operations in order to reduce the size of the element from 32 bytes to the desired size.
https://docs.soliditylang.org/en/v0.8.11/internals/layout_in_storage.html
Each operation involving a `uint8` costs an extra [** 22 - 28 gas **](https://gist.github.com/IllIllI000/9388d20c70f9a4632eb3ca7836f54977) (depending on whether the other operand is also a variable of type `uint8`) as compared to ones involving `uint256`, due to the compiler having to clear the higher bits of the memory word before operating on the `uint8`, as well as the associated stack operations of doing so. Use a larger size then downcast where needed

*There are 28 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_dstChainId` is `uint16`
74:         uint16 _dstChainId,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L74-L74



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `msgType` is `uint8`
81:         uint8 msgType,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L81-L81



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_dstChainId` is `uint16`
83:         uint16 _dstChainId,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L83-L83



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_dstGasForCall` is `uint64`
84:         uint64 _dstGasForCall,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L84-L84



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `msgType` is `uint8`
114:         uint8 msgType,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L114-L114



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_dstChainId` is `uint16`
115:         uint16 _dstChainId,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L115-L115



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_dstGasForCall` is `uint64`
118:         uint64 _dstGasForCall,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L118-L118



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `msgType` is `uint8`
149:         uint8 msgType,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L149-L149



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_dstChainId` is `uint16`
150:         uint16 _dstChainId,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L150-L150



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_dstGasForCall` is `uint64`
153:         uint64 _dstGasForCall,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L153-L153



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_dstChainId` is `uint16`
198:         uint16 _dstChainId,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L198-L198



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_dstGasForCall` is `uint64`
202:         uint64 _dstGasForCall,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L202-L202



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_dstChainId` is `uint16`
219:         uint16 _dstChainId,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L219-L219



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_dstGasForCall` is `uint64`
222:         uint64 _dstGasForCall,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L222-L222



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_srcChainId` is `uint16`
238:         uint16 _srcChainId,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L238-L238



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `` is `uint64`
240:         uint64,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L240-L240



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `msgType` is `uint8`
245:         (uint8 msgType, address _from, address _to, bool deliverEth) = abi


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L245-L245



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit `` is `uint8`
30:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L30-L30



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit `dstLzId` is `uint16`
36:         uint16 dstLzId,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L36-L36



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit `dstGas` is `uint64`
48:         uint64 dstGas,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L48-L48



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit `dstGas` is `uint64`
96:         uint64 dstGas = abi.decode(additionalArgs, (uint64));


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L96-L96



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `` is `uint8`
41:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L41-L41



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `dstLzId` is `uint16`
47:         uint16 dstLzId,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L47-L47



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `` is `uint16`
126:     ) private pure returns (uint16) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L126-L126



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `` is `uint120`
136:     ) private pure returns (uint120) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L136-L136



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `` is `uint120`
146:     ) private pure returns (uint120) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L146-L146



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `` is `uint16`
184:         uint16, // _srcChainid


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L184-L184



```solidity

File: src/swappers/UniSwapper.sol

//@audit `` is `uint8`
28:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L28-L28

### [G-23]<a name="g-23"></a> State variables only set in the constructor should be declared `immutable`

Avoids a Gsset(** 20000 gas**) in the constructor, and replaces the first access in each transaction(Gcoldsload - ** 2100 gas **) and each access thereafter(Gwarmacces - ** 100 gas **) with a`PUSH32`(** 3 gas **).

While`string`s are not value types, and therefore cannot be`immutable` / `constant` if not hard - coded outside of the constructor, the same behavior can be achieved by making the current contract `abstract` with `virtual` functions for the`string` accessors, and having a child contract override the functions with the hard - coded implementation - specific values.

*There are 3 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

32:         weth = IWETH(_wethAddress);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L32-L32



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

33:         gasCurrencyIsEth = gasIsEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L33-L33



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

22:         gasIsEth = _gasIsEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L22-L22

### [G-24]<a name="g-24"></a> `>=`/`<=` costs less gas than `>`/`<`

The compiler uses opcodes `GT` and `ISZERO` for solidity code that uses `>`, but only requires `LT` for `>=`, [which saves **3 gas**](https://gist.github.com/IllIllI000/3dc79d25acccfa16dee4e83ffdc6ffde)

*There are 3 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

51:         require(weth.balanceOf(address(this)) > amount, "not enough reserves");


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L51-L51



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

266:         if (weth.balanceOf(address(this)) < _amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L266-L266



```solidity

File: src/UTBExecutor.sol

64:         if (extraNative > 0) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L64-L64

### [G-25]<a name="g-25"></a> Use assembly to validate `msg.sender`

We can use assembly to efficiently validate msg.sender with the least amount of opcodes necessary. For more details check the following report [Here](https://code4rena.com/reports/2023-05-juicebox#g-06-use-assembly-to-validate-msgsender)

*There are 2 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

44:             address(dcntEth) == msg.sender,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L44-L44



```solidity

File: src/bridge_adapters/BaseAdapter.sol

13:             msg.sender == address(bridgeExecutor),


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L13-L13

### [G-26]<a name="g-26"></a> Consider activating via-ir for deploying

The Solidity compiler's Intermediate Representation (IR) based code generator, which can be activated using --via-ir on the command line or {""viaIR"": true} in the options, serves a dual purpose. Firstly, it boosts the transparency and audibility of code generation, which enhances developers' comprehension and control over the contract's final bytecode. Secondly, it enables more sophisticated optimization passes that span multiple functions, thereby potentially leading to more efficient bytecode.
It's important to note that using the IR- based code generator may lengthen compile times due to the extra optimization steps.Therefore, it's advised to test your contract with and without this option enabled to measure the performance and gas cost implications.If the IR- based code generator significantly enhances your contract's performance or reduces gas costs, consider using the --via-ir flag during deployment.This way, you can leverage more advanced compiler optimizations without hindering your development workflow.

*There are 1 instance(s) of this issue:*



```solidity

File: hardhat.config.ts

//@audit /2024-01-decent/hardhat.config.ts
1: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//hardhat.config.ts#L1-L1

### [G-27]<a name="g-27"></a> State variables can be packed into fewer storage slots

If variables occupying the same slot are both written the same function or by the constructor, avoids a separate Gsset (**20000 gas**). Reads of the variables can also be cheaper

*There are 1 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

// @audit from 5 to 4 you need to change the structure elements order to: , mapping, mapping, mapping, address, IStargateRouter
017: contract StargateBridgeAdapter is
018:     BaseAdapter,
019:     IBridgeAdapter,
020:     IStargateReceiver
021: {
022:     uint8 public constant BRIDGE_ID = 1;
023:     uint8 public constant SG_FEE_BPS = 6;
024:     address public stargateEth;
025:     mapping(uint256 => address) public destinationBridgeAdapter;
026:     mapping(uint256 => uint16) lzIdLookup;
027:     mapping(uint16 => uint256) chainIdLookup;
028: 
029:     constructor() BaseAdapter() {}
030: 
031:     IStargateRouter public router;
032: 
033:     function setRouter(address _router) public onlyOwner {
034:         router = IStargateRouter(_router);
035:     }
036: 
037:     function setStargateEth(address _sgEth) public onlyOwner {
038:         stargateEth = _sgEth;
039:     }
040: 
041:     function getId() public pure returns (uint8) {
042:         return BRIDGE_ID;
043:     }
044: 
045:     function registerRemoteBridgeAdapter(
046:         uint256 dstChainId,
047:         uint16 dstLzId,
048:         address decentBridgeAdapter
049:     ) public onlyOwner {
050:         lzIdLookup[dstChainId] = dstLzId;
051:         chainIdLookup[dstLzId] = dstChainId;
052:         destinationBridgeAdapter[dstChainId] = decentBridgeAdapter;
053:     }
054: 
055:     function getBridgeToken(
056:         bytes calldata additionalArgs
057:     ) external pure returns (address bridgeToken) {
058:         bridgeToken = abi.decode(additionalArgs, (address));
059:     }
060: 
061:     function getBridgedAmount(
062:         uint256 amt2Bridge,
063:         address /*tokenIn*/,
064:         address /*tokenOut*/
065:     ) external pure returns (uint256) {
066:         return (amt2Bridge * (1e4 - SG_FEE_BPS)) / 1e4;
067:     }
068: 
069:     function bridge(
070:         uint256 amt2Bridge,
071:         SwapInstructions memory postBridge,
072:         uint256 dstChainId,
073:         address target,
074:         address paymentOperator,
075:         bytes memory payload,
076:         bytes calldata additionalArgs,
077:         address payable refund
078:     ) public payable onlyUtb returns (bytes memory bridgePayload) {
079:         address bridgeToken = abi.decode(additionalArgs, (address));
080: 
081:         bridgePayload = abi.encode(
082:             postBridge,
083:             target,
084:             paymentOperator,
085:             payload,
086:             refund
087:         );
088:         IERC20(bridgeToken).transferFrom(msg.sender, address(this), amt2Bridge);
089:         IERC20(bridgeToken).approve(address(router), amt2Bridge);
090: 
091:         callBridge(
092:             amt2Bridge,
093:             dstChainId,
094:             bridgePayload,
095:             additionalArgs,
096:             refund
097:         );
098:     }
099: 
100:     function getValue(
101:         bytes calldata additionalArgs,
102:         uint256 amt2Bridge
103:     ) private view returns (uint value) {
104:         (address bridgeToken, LzBridgeData memory lzBridgeData) = abi.decode(
105:             additionalArgs,
106:             (address, LzBridgeData)
107:         );
108:         return
109:             bridgeToken == stargateEth
110:                 ? (lzBridgeData.fee + amt2Bridge)
111:                 : lzBridgeData.fee;
112:     }
113: 
114:     function getLzTxObj(
115:         bytes calldata additionalArgs
116:     ) private pure returns (IStargateRouter.lzTxObj memory) {
117:         (, , IStargateRouter.lzTxObj memory lzTxObj) = abi.decode(
118:             additionalArgs,
119:             (address, LzBridgeData, IStargateRouter.lzTxObj)
120:         );
121:         return lzTxObj;
122:     }
123: 
124:     function getDstChainId(
125:         bytes calldata additionalArgs
126:     ) private pure returns (uint16) {
127:         (, LzBridgeData memory lzBridgeData, ) = abi.decode(
128:             additionalArgs,
129:             (address, LzBridgeData, IStargateRouter.lzTxObj)
130:         );
131:         return lzBridgeData._dstChainId;
132:     }
133: 
134:     function getSrcPoolId(
135:         bytes calldata additionalArgs
136:     ) private pure returns (uint120) {
137:         (, LzBridgeData memory lzBridgeData, ) = abi.decode(
138:             additionalArgs,
139:             (address, LzBridgeData, IStargateRouter.lzTxObj)
140:         );
141:         return lzBridgeData._srcPoolId;
142:     }
143: 
144:     function getDstPoolId(
145:         bytes calldata additionalArgs
146:     ) private pure returns (uint120) {
147:         (, LzBridgeData memory lzBridgeData, ) = abi.decode(
148:             additionalArgs,
149:             (address, LzBridgeData, IStargateRouter.lzTxObj)
150:         );
151:         return lzBridgeData._dstPoolId;
152:     }
153: 
154:     function getDestAdapter(uint chainId) private view returns (address dstAddr) {
155:         dstAddr = destinationBridgeAdapter[chainId];
156: 
157:         require(
158:             dstAddr != address(0),
159:             string.concat("dst chain address not set ")
160:         );
161:     }
162: 
163:     function callBridge(
164:         uint256 amt2Bridge,
165:         uint256 dstChainId,
166:         bytes memory bridgePayload,
167:         bytes calldata additionalArgs,
168:         address payable refund
169:     ) private {
170:         router.swap{value: msg.value}(
171:             getDstChainId(additionalArgs), //lzBridgeData._dstChainId, // send to LayerZero chainId
172:             getSrcPoolId(additionalArgs), //lzBridgeData._srcPoolId, // source pool id
173:             getDstPoolId(additionalArgs), //lzBridgeData._dstPoolId, // dst pool id
174:             refund, // refund adddress. extra gas (if any) is returned to this address
175:             amt2Bridge, // quantity to swap
176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips
177:             getLzTxObj(additionalArgs), // additional gasLimit increase, airdrop, at address
178:             abi.encodePacked(getDestAdapter(dstChainId)),
179:             bridgePayload // bytes param, if you wish to send additional payload you can abi.encode() them here
180:         );
181:     }
182: 
183:     function sgReceive(
184:         uint16, // _srcChainid
185:         bytes memory, // _srcAddress
186:         uint256, // _nonce
187:         address, // _token
188:         uint256, // amountLD
189:         bytes memory payload
190:     ) external override onlyExecutor {
191:         (
192:             SwapInstructions memory postBridge,
193:             address target,
194:             address paymentOperator,
195:             bytes memory utbPayload,
196:             address payable refund
197:         ) = abi.decode(
198:                 payload,
199:                 (SwapInstructions, address, address, bytes, address)
200:             );
201: 
202:         SwapParams memory swapParams = abi.decode(
203:             postBridge.swapPayload,
204:             (SwapParams)
205:         );
206: 
207:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);
208: 
209:         IUTB(utb).receiveFromBridge(
210:             postBridge,
211:             target,
212:             paymentOperator,
213:             utbPayload,
214:             refund
215:         );
216:     }
217: 
218:     receive() external payable {}
219: 
220:     fallback() external payable {}
221: }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L17-L221

### [G-28]<a name="g-28"></a> Avoid transferring amounts of zero in order to save gas

Skipping the external call when nothing will be transferred, will save at least **100 gas**

*There are 15 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

44:         weth.transfer(from, remainingAfterCall);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L44-L44



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

75:         weth.transferFrom(msg.sender, address(this), amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L75-L75



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

288:         dcntEth.transferFrom(msg.sender, address(this), amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L288-L288



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

297:         dcntEth.transferFrom(msg.sender, address(this), amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L297-L297



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

298:         weth.transfer(msg.sender, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L298-L298



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

325:         weth.transferFrom(msg.sender, address(this), amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L325-L325



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

334:         weth.transfer(msg.sender, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L334-L334



```solidity

File: src/UTB.sol

83:             IERC20(swapParams.tokenIn).transferFrom(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L83-L83



```solidity

File: src/UTBExecutor.sol

61:         IERC20(token).transferFrom(msg.sender, address(this), amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L61-L61



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

109:             IERC20(bridgeToken).transferFrom(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L109-L109



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

139:         IERC20(swapParams.tokenIn).transferFrom(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L139-L139



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

88:         IERC20(bridgeToken).transferFrom(msg.sender, address(this), amt2Bridge);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L88-L88



```solidity

File: src/swappers/UniSwapper.sol

44:         IERC20(token).transfer(user, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L44-L44



```solidity

File: src/swappers/UniSwapper.sol

55:         IERC20(token).transfer(recipient, amount);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L55-L55



```solidity

File: src/swappers/UniSwapper.sol

83:             IERC20(swapParams.tokenIn).transferFrom(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L83-L83

### [G-29]<a name="g-29"></a> When no `addresses` are used `abi.encodepacked()` Outperforms `abi.encode()` in Efficiency

when dealing with non address type parameters `encodepacked()` function less gas than `encode()`. For more details check the following [comparison](https://github.com/ConnorBlockchain/Solidity-Encode-Gas-Comparison)

*There are 2 instance(s) of this issue:*



```solidity

File: src/UTB.sol

115:         retrieveAndCollectFees(fees, abi.encode(instructions, fees), signature)


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L115-L115



```solidity

File: src/UTB.sol

266:         retrieveAndCollectFees(fees, abi.encode(instructions, fees), signature)


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L266-L266

### [G-30]<a name="g-30"></a> A `modifier` used only once and not being inherited should be inlined to save gas

 

*There are 1 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

42:     modifier onlyLzApp() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L42-L42

### [G-31]<a name="g-31"></a> Simple checks for zero `uint` can be done using assembly to save gas

 

*There are 2 instance(s) of this issue:*



```solidity

File: src/UTBExecutor.sol

76:         if (remainingBalance == 0) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L76-L76



```solidity

File: src/swappers/UniSwapper.sol

68:         if (swapParams.path.length == 0) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L68-L68

### [G-32]<a name="g-32"></a> Using `private` for constants saves gas

If needed, the values can be read from the verified contract source code, or if there are multiple values there can be a single getter function that [returns a tuple](https://github.com/code-423n4/2022-08-frax/blob/90f55a9ce4e25bceed3a74290b854341d8de6afa/src/contracts/FraxlendPair.sol#L156-L178) of the values of all currently-public constants. Saves **3406-3606 gas** in deployment gas due to the compiler not having to create non-payable getter functions for deployment calldata, not having to store the bytes of the value outside of where it's used, and not adding another entry to the method ID table

*There are 7 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

17:     uint8 public constant MT_ETH_TRANSFER = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L17-L17



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

18:     uint8 public constant MT_ETH_TRANSFER_WITH_PAYLOAD = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L18-L18



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

20:     uint16 public constant PT_SEND_AND_CALL = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L20-L20



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

13:     uint8 public constant BRIDGE_ID = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L13-L13



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

22:     uint8 public constant BRIDGE_ID = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L22-L22



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

23:     uint8 public constant SG_FEE_BPS = 6;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L23-L23



```solidity

File: src/swappers/UniSwapper.sol

16:     uint8 public constant SWAPPER_ID = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L16-L16

### [G-33]<a name="g-33"></a> Redundant state variable getters

Getters for public state variables are automatically generated so there is no need to code them manually and waste gas.

*There are 3 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

30:     function getId() public pure returns (uint8) {
31:         return BRIDGE_ID;
32:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L30-L32



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

41:     function getId() public pure returns (uint8) {
42:         return BRIDGE_ID;
43:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L41-L43



```solidity

File: src/swappers/UniSwapper.sol

28:     function getId() public pure returns (uint8) {
29:         return SWAPPER_ID;
30:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L28-L30

### [G-34]<a name="g-34"></a> Gas savings can be achieved by changing the model for assigning value to the structure ***123 gas***

Change this `structName a = structName({item1: val1,item2: val2}); ==> structName a; a.item1 = val1; a.item2 = val2;`

*There are 3 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

170:         ICommonOFT.LzCallParams memory callParams = ICommonOFT.LzCallParams({
171:             refundAddress: payable(msg.sender),
172:             zroPaymentAddress: address(0x0),
173:             adapterParams: adapterParams
174:         });


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L170-L174



```solidity

File: src/swappers/UniSwapper.sol

129:         IV3SwapRouter.ExactInputParams memory params = IV3SwapRouter
130:             .ExactInputParams({
131:                 path: swapParams.path,
132:                 recipient: address(this),
133:                 amountIn: swapParams.amountIn,
134:                 amountOutMinimum: swapParams.amountOut
135:             });


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L129-L135



```solidity

File: src/swappers/UniSwapper.sol

149:         IV3SwapRouter.ExactOutputParams memory params = IV3SwapRouter
150:             .ExactOutputParams({
151:                 path: swapParams.path,
152:                 recipient: address(this),
153:                 //deadline: block.timestamp,
154:                 amountOut: swapParams.amountOut,
155:                 amountInMaximum: swapParams.amountIn
156:             });


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L149-L156

### [G-35]<a name="g-35"></a> Refactor modifiers to call a local function

Modifiers code is copied in all instances where it's used, increasing bytecode size. By doing a refractor to the internal function, one can reduce bytecode size significantly at the cost of one JUMP.

*There are 1 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/BaseAdapter.sol

11:     modifier onlyExecutor() {
12:         require(
13:             msg.sender == address(bridgeExecutor),
14:             "Only bridge executor can call this"
15:         );
16:         _;
17:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L11-L17

### [G-36]<a name="g-36"></a> Consider using solady's 'FixedPointMathLib'

Using Solady's 'FixedPointMathLib' for multiplication or division operations in Solidity can lead to significant gas savings. This library is designed to optimize fixed-point arithmetic operations, which are common in financial calculations involving tokens or currencies. By implementing more efficient algorithms and assembly optimizations, 'FixedPointMathLib' minimizes the computational resources required for these operations. For contracts that frequently perform such calculations, integrating this library can reduce transaction costs, thereby enhancing overall performance and cost-effectiveness. However, developers must ensure compatibility with their existing codebase and thoroughly test for accuracy and expected behavior to avoid any unintended consequences.

*There are 4 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit for: `/`
66:         return (amt2Bridge * (1e4 - SG_FEE_BPS)) / 1e4;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L66-L66



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit for: `*`
66:         return (amt2Bridge * (1e4 - SG_FEE_BPS)) / 1e4;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L66-L66



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit for: `/`
176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L176-L176



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit for: `*`
176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L176-L176

### NonCritical Risk Issues

### [N-01]<a name="n-01"></a> State variables declarations should have NatSpec descriptions

 

*There are 36 instance(s) of this issue:*



```solidity

File: src/UTB.sol

18:     IUTBExecutor executor;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L18-L18



```solidity

File: src/UTB.sol

19:     IUTBFeeCollector feeCollector;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L19-L19



```solidity

File: src/UTB.sol

20:     IWETH wrapped;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L20-L20



```solidity

File: src/UTB.sol

21:     mapping(uint8 => address) public swappers;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L21-L21



```solidity

File: src/UTB.sol

22:     mapping(uint8 => address) public bridgeAdapters;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L22-L22



```solidity

File: src/bridge_adapters/BaseAdapter.sol

7:     address public bridgeExecutor;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L7-L7



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

13:     uint8 public constant BRIDGE_ID = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L13-L13



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

14:     mapping(uint256 => address) public destinationBridgeAdapter;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L14-L14



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

15:     IDecentEthRouter public router;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L15-L15



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

16:     mapping(uint256 => uint16) lzIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L16-L16



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

17:     mapping(uint16 => uint256) chainIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L17-L17



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

18:     bool gasIsEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L18-L18



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

19:     address bridgeToken;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

22:     uint8 public constant BRIDGE_ID = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L22-L22



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

23:     uint8 public constant SG_FEE_BPS = 6;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L23-L23



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

24:     address public stargateEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L24-L24



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

25:     mapping(uint256 => address) public destinationBridgeAdapter;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L25-L25



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

26:     mapping(uint256 => uint16) lzIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

27:     mapping(uint16 => uint256) chainIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L27-L27



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

31:     IStargateRouter public router;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L31-L31



```solidity

File: src/swappers/SwapParams.sol

5:     uint8 constant EXACT_IN = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L5-L5



```solidity

File: src/swappers/SwapParams.sol

6:     uint8 constant EXACT_OUT = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L6-L6



```solidity

File: src/swappers/UniSwapper.sol

16:     uint8 public constant SWAPPER_ID = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L16-L16



```solidity

File: src/swappers/UniSwapper.sol

17:     address public uniswap_router;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L17-L17



```solidity

File: src/swappers/UniSwapper.sol

18:     address payable public wrapped;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L18-L18



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

13:     IWETH public weth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L13-L13



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

14:     IDcntEth public dcntEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L14-L14



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

15:     IDecentBridgeExecutor public executor;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L15-L15



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

17:     uint8 public constant MT_ETH_TRANSFER = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L17-L17



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

18:     uint8 public constant MT_ETH_TRANSFER_WITH_PAYLOAD = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L18-L18



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

20:     uint16 public constant PT_SEND_AND_CALL = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L20-L20



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

22:     bool public gasCurrencyIsEth; // for chains that use ETH as gas currency


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L22-L22



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

24:     mapping(uint16 => address) public destinationBridges;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L24-L24



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

25:     mapping(address => uint256) public balanceOf;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L25-L25



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

9:     IWETH weth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L9-L9



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

10:     bool public gasCurrencyIsEth; // for chains that use ETH as gas currency


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L10-L10

### [N-02]<a name="n-02"></a> Large or complicated code bases should implement invariant tests

Large code bases, or code with lots of inline-assembly, complicated math, or complicated interactions between multiple contracts, should implement [invariant fuzzing tests](https://medium.com/coinmonks/smart-contract-fuzzing-d9b88e0b0a05). Invariant fuzzers such as Echidna require the test writer to come up with invariants which should not be violated under any circumstances, and the fuzzer tests various inputs and function calls to ensure that the invariants always hold. Even code with 100% code coverage can still have bugs due to the order of the operations a user performs, and invariant fuzzers, with properly and extensively-written invariants, can close this testing gap significantly.

*There are 1 instance(s) of this issue:*



```solidity

File: src/UTB.sol

@audit Should implement invariant tests
1: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L1-L1

### [N-03]<a name="n-03"></a> [NatSpec] Natspec `@author` is missing from `contract`

 

*There are 8 instance(s) of this issue:*



```solidity

File: src/UTB.sol

15: contract UTB is Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L15-L15



```solidity

File: src/UTBExecutor.sol

7: contract UTBExecutor is Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L7-L7



```solidity

File: src/bridge_adapters/BaseAdapter.sol

6: contract BaseAdapter is UTBOwned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L6-L6



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

12: contract DecentBridgeAdapter is BaseAdapter, IBridgeAdapter {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L12-L12



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

17: contract StargateBridgeAdapter is


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L17-L17



```solidity

File: src/swappers/UniSwapper.sol

13: contract UniSwapper is UTBOwned, ISwapper {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L13-L13



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

12: contract DecentEthRouter is IDecentEthRouter, IOFTReceiverV2, Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L12-L12



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

8: contract DecentBridgeExecutor is IDecentBridgeExecutor, Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L8-L8

### [N-04]<a name="n-04"></a> Variable names that consist of all capital letters should be reserved for `constant`/`immutable` variables

 

*There are 1 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

96:         uint256 GAS_FOR_RELAY = 100000;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L96-L96

### [N-05]<a name="n-05"></a> Common functions should be refactored to a common base contract

The functions below have the same implementation as is seen in other files. The functions should be refactored into functions of a common base contract

*There are 3 instance(s) of this issue:*



```solidity

File: src/UTB.sol

//@audit this function is already seen in `src/bridge_adapters/DecentBridgeAdapter.sol`
341:     fallback() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L341-L341



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit this function is already seen in `src/bridge_adapters/StargateBridgeAdapter.sol`
41:     function getId() public pure returns (uint8) {
42:         return BRIDGE_ID;
43:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L41-L43



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit this function is already seen in `src/bridge_adapters/StargateBridgeAdapter.sol`
45:     function registerRemoteBridgeAdapter(
46:         uint256 dstChainId,
47:         uint16 dstLzId,
48:         address decentBridgeAdapter
49:     ) public onlyOwner {
50:         lzIdLookup[dstChainId] = dstLzId;
51:         chainIdLookup[dstLzId] = dstChainId;
52:         destinationBridgeAdapter[dstChainId] = decentBridgeAdapter;
53:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L45-L53

### [N-06]<a name="n-06"></a> Constant redefined elsewhere

Consider defining in only one contract so that values cannot become out of sync when only one location is updated. A [cheap way](https://medium.com/coinmonks/gas-cost-of-solidity-library-functions-dbe0cedd4678) to store constants in a single location is to create an `internal constant` in a `library`. If the variable is a local cache of another contract's value, consider making the cache variable internal or private, which will require external users to query the contract with the source of truth, so that callers don't get out of sync.

*There are 1 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit The same constant is already defined on file : src/bridge_adapters/DecentBridgeAdapter.sol
22:     uint8 public constant BRIDGE_ID = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L22-L22

### [N-07]<a name="n-07"></a> Constants in comparisons should appear on the left side

 

*There are 6 instance(s) of this issue:*



```solidity

File: src/UTBExecutor.sol

//@audit `0`
64:         if (extraNative > 0) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L64-L64



```solidity

File: src/UTBExecutor.sol

//@audit `0`
76:         if (remainingBalance == 0) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L76-L76



```solidity

File: src/swappers/UniSwapper.sol

//@audit `0`
68:         if (swapParams.path.length == 0) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L68-L68



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `MT_ETH_TRANSFER`
100:         if (msgType == MT_ETH_TRANSFER) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L100-L100



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `MT_ETH_TRANSFER_WITH_PAYLOAD`
250:         if (msgType == MT_ETH_TRANSFER_WITH_PAYLOAD) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L250-L250



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `MT_ETH_TRANSFER`
271:         if (msgType == MT_ETH_TRANSFER) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L271-L271

### [N-08]<a name="n-08"></a> [NatSpec] Natspec description is missing from `contract`

It is recommended that Solidity contracts are fully annotated using NatSpec for all public interfaces (everything in the ABI). It is clearly stated in the Solidity official documentation. In complex projects such as Defi, the interpretation of all functions and their arguments and returns is important for code readability and auditability.[source](https://docs.soliditylang.org/en/v0.8.15/natspec-format.html)

*There are 9 instance(s) of this issue:*



```solidity

File: src/UTB.sol

15: contract UTB is Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L15-L15



```solidity

File: src/UTBExecutor.sol

7: contract UTBExecutor is Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L7-L7



```solidity

File: src/bridge_adapters/BaseAdapter.sol

6: contract BaseAdapter is UTBOwned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L6-L6



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

12: contract DecentBridgeAdapter is BaseAdapter, IBridgeAdapter {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L12-L12



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

17: contract StargateBridgeAdapter is


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L17-L17



```solidity

File: src/swappers/SwapParams.sol

4: library SwapDirection {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L4-L4



```solidity

File: src/swappers/UniSwapper.sol

13: contract UniSwapper is UTBOwned, ISwapper {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L13-L13



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

12: contract DecentEthRouter is IDecentEthRouter, IOFTReceiverV2, Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L12-L12



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

8: contract DecentBridgeExecutor is IDecentBridgeExecutor, Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L8-L8

### [N-09]<a name="n-09"></a> Contract does not follow the Solidity style guide's suggested layout ordering

The [style guide](https://docs.soliditylang.org/en/v0.8.16/style-guide.html#order-of-layout) says that, within a contract, the ordering should be 1) Type declarations, 2) State variables, 3) Events, 4) Modifiers, and 5) Functions, but the contract(s) below do not follow this ordering

*There are 1 instance(s) of this issue:*



```solidity

File: src/swappers/SwapParams.sol

//@audit the structure definition is misplaced
9: struct SwapParams {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L9-L9

### [N-10]<a name="n-10"></a> Control structures do not follow the Solidity Style Guide

See the [control structures](https://docs.soliditylang.org/en/latest/style-guide.html#control-structures) section of the Solidity Style Guide

*There are 50 instance(s) of this issue:*



```solidity

File: src/UTB.sol

52:     function performSwap(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L52-L52



```solidity

File: src/UTB.sol

63:     function performSwap(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L63-L63



```solidity

File: src/UTB.sol

108:     function swapAndExecute(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L108-L108



```solidity

File: src/UTB.sol

134:     function _swapAndExecute(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L134-L134



```solidity

File: src/UTB.sol

168:     function swapAndModifyPostBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L168-L168



```solidity

File: src/UTB.sol

207:     function approveAndCheckIfNative(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L207-L207



```solidity

File: src/UTB.sol

259:     function bridgeAndExecute(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L259-L259



```solidity

File: src/UTB.sol

282:     function callBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L282-L282



```solidity

File: src/UTB.sol

311:     function receiveFromBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L311-L311



```solidity

File: src/UTBExecutor.sol

19:     function execute(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L19-L19



```solidity

File: src/UTBExecutor.sol

41:     function execute(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L41-L41



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

34:     function registerRemoteBridgeAdapter(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L34-L34



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

44:     function estimateFees(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L44-L44



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

67:     function getBridgeToken(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L67-L67



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

73:     function getBridgedAmount(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L73-L73



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

81:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L81-L81



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

127:     function receiveFromBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L127-L127



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

45:     function registerRemoteBridgeAdapter(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L45-L45



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

55:     function getBridgeToken(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L55-L55



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

61:     function getBridgedAmount(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L61-L61



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

69:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L69-L69



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

100:     function getValue(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L100-L100



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

114:     function getLzTxObj(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L114-L114



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

124:     function getDstChainId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L124-L124



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

134:     function getSrcPoolId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L134-L134



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

144:     function getDstPoolId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L144-L144



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

163:     function callBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L163-L163



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

183:     function sgReceive(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L183-L183



```solidity

File: src/swappers/UniSwapper.sol

32:     function updateSwapParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L32-L32



```solidity

File: src/swappers/UniSwapper.sol

47:     function _sendToRecipient(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L47-L47



```solidity

File: src/swappers/UniSwapper.sol

58:     function swap(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L58-L58



```solidity

File: src/swappers/UniSwapper.sol

79:     function _receiveAndWrapIfNeeded(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L79-L79



```solidity

File: src/swappers/UniSwapper.sol

100:     function swapNoPath(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L100-L100



```solidity

File: src/swappers/UniSwapper.sol

123:     function swapExactIn(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L123-L123



```solidity

File: src/swappers/UniSwapper.sol

143:     function swapExactOut(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L143-L143



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

73:     function addDestinationBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L73-L73



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

80:     function _getCallParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L80-L80



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

113:     function estimateSendAndCallFee(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L113-L113



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

148:     function _bridgeWithPayload(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L148-L148



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

197:     function bridgeWithPayload(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L197-L197



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

218:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L218-L218



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

237:     function onOFTReceived(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L237-L237



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

285:     function redeemEth(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L285-L285



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

294:     function redeemWeth(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L294-L294



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

313:     function removeLiquidityEth(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L313-L313



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

322:     function addLiquidityWeth(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L322-L322



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

330:     function removeLiquidityWeth(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L330-L330



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

24:     function _executeWeth(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L24-L24



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

54:     function _executeEth(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L54-L54



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

68:     function execute(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L68-L68

### [N-11]<a name="n-11"></a> Default address(0) can be returned

Allowing a function in Solidity to return the default address (address(0)) can be problematic as it can represent uninitialized or invalid addresses. If such an address is utilized in transfer operations or other sensitive actions, it could lead to loss of funds or unpredicted behavior. It's prudent to include checks in your functions to prevent the return of the zero address, enhancing contract security.

*There are 1 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

70:         return bridgeToken;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L70-L70

### [N-12]<a name="n-12"></a> Dependence on external protocols

External protocols should be monitored as such dependencies may introduce vulnerabilities if a vulnerability is found /introduced in the external protocol

*There are 1 instance(s) of this issue:*



```solidity

File: src/swappers/UniSwapper.sol

11: import {IV3SwapRouter} from "@uniswap/swap-contracts/interfaces/IV3SwapRouter.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L11-L11

### [N-13]<a name="n-13"></a> Consider adding emergency-stop functionality

In the event of a security breach or any unforeseen emergency, swiftly suspending all protocol operations becomes crucial. Having a mechanism in place to halt all functions collectively, instead of pausing individual contracts separately, substantially enhances the efficiency of mitigating ongoing attacks or vulnerabilities. This not only quickens the response time to potential threats but also reduces operational stress during these critical periods. Therefore, consider integrating a 'circuit breaker' or 'emergency stop' function into the smart contract system architecture. Such a feature would provide the capability to suspend the entire protocol instantly, which could prove invaluable during a time-sensitive crisis management situation.

*There are 9 instance(s) of this issue:*



```solidity

File: src/UTB.sol

15: contract UTB is Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L15-L15



```solidity

File: src/UTBExecutor.sol

7: contract UTBExecutor is Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L7-L7



```solidity

File: src/bridge_adapters/BaseAdapter.sol

6: contract BaseAdapter is UTBOwned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L6-L6



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

12: contract DecentBridgeAdapter is BaseAdapter, IBridgeAdapter {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L12-L12



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

17: contract StargateBridgeAdapter is


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L17-L17



```solidity

File: src/swappers/SwapParams.sol

4: library SwapDirection {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L4-L4



```solidity

File: src/swappers/UniSwapper.sol

13: contract UniSwapper is UTBOwned, ISwapper {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L13-L13



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

12: contract DecentEthRouter is IDecentEthRouter, IOFTReceiverV2, Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L12-L12



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

8: contract DecentBridgeExecutor is IDecentBridgeExecutor, Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L8-L8

### [N-14]<a name="n-14"></a> Empty bytes check is missing

When developing smart contracts in Solidity, it's crucial to validate the inputs of your functions. This includes ensuring that the bytes parameters are not empty, especially when they represent crucial data such as addresses, identifiers, or raw data that the contract needs to process.
Missing empty bytes checks can lead to unexpected behaviour in your contract.For instance, certain operations might fail, produce incorrect results, or consume unnecessary gas when performed with empty bytes.Moreover, missing input validation can potentially expose your contract to malicious activity, including exploitation of unhandled edge cases.
To mitigate these issues, always validate that bytes parameters are not empty when the logic of your contract requires it.

*There are 28 instance(s) of this issue:*



```solidity

File: src/UTB.sol

//@audit  ,signature are not checked
108:     function swapAndExecute(
109:         SwapAndExecuteInstructions calldata instructions,
110:         FeeStructure calldata fees,
111:         bytes calldata signature
112:     )
113:         public
114:         payable
115:         retrieveAndCollectFees(fees, abi.encode(instructions, fees), signature)
116:     {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L108-L116



```solidity

File: src/UTB.sol

//@audit  ,payload are not checked
134:     function _swapAndExecute(
135:         SwapInstructions memory swapInstructions,
136:         address target,
137:         address paymentOperator,
138:         bytes memory payload,
139:         address payable refund
140:     ) private {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L134-L140



```solidity

File: src/UTB.sol

//@audit  ,signature are not checked
259:     function bridgeAndExecute(
260:         BridgeInstructions calldata instructions,
261:         FeeStructure calldata fees,
262:         bytes calldata signature
263:     )
264:         public
265:         payable
266:         retrieveAndCollectFees(fees, abi.encode(instructions, fees), signature)
267:         returns (bytes memory)
268:     {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L259-L268



```solidity

File: src/UTB.sol

//@audit  ,payload are not checked
311:     function receiveFromBridge(
312:         SwapInstructions memory postBridge,
313:         address target,
314:         address paymentOperator,
315:         bytes memory payload,
316:         address payable refund
317:     ) public {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L311-L317



```solidity

File: src/UTBExecutor.sol

//@audit  ,payload are not checked
19:     function execute(
20:         address target,
21:         address paymentOperator,
22:         bytes memory payload,
23:         address token,
24:         uint amount,
25:         address payable refund
26:     ) public payable onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L19-L26



```solidity

File: src/UTBExecutor.sol

//@audit  ,payload are not checked
41:     function execute(
42:         address target,
43:         address paymentOperator,
44:         bytes memory payload,
45:         address token,
46:         uint amount,
47:         address payable refund,
48:         uint extraNative
49:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L41-L49



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit  ,payload are not checked
44:     function estimateFees(
45:         SwapInstructions memory postBridge,
46:         uint256 dstChainId,
47:         address target,
48:         uint64 dstGas,
49:         bytes memory payload
50:     ) public view returns (uint nativeFee, uint zroFee) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L44-L50



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit  ,payload ,additionalArgs are not checked
81:     function bridge(
82:         uint256 amt2Bridge,
83:         SwapInstructions memory postBridge,
84:         uint256 dstChainId,
85:         address target,
86:         address paymentOperator,
87:         bytes memory payload,
88:         bytes calldata additionalArgs,
89:         address payable refund
90:     ) public payable onlyUtb returns (bytes memory bridgePayload) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L81-L90



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit  ,payload are not checked
127:     function receiveFromBridge(
128:         SwapInstructions memory postBridge,
129:         address target,
130:         address paymentOperator,
131:         bytes memory payload,
132:         address payable refund
133:     ) public onlyExecutor {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L127-L133



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit  ,additionalArgs are not checked
55:     function getBridgeToken(
56:         bytes calldata additionalArgs
57:     ) external pure returns (address bridgeToken) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L55-L57



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit  ,payload ,additionalArgs are not checked
69:     function bridge(
70:         uint256 amt2Bridge,
71:         SwapInstructions memory postBridge,
72:         uint256 dstChainId,
73:         address target,
74:         address paymentOperator,
75:         bytes memory payload,
76:         bytes calldata additionalArgs,
77:         address payable refund
78:     ) public payable onlyUtb returns (bytes memory bridgePayload) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L69-L78



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit  ,additionalArgs are not checked
100:     function getValue(
101:         bytes calldata additionalArgs,
102:         uint256 amt2Bridge
103:     ) private view returns (uint value) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L100-L103



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit  ,additionalArgs are not checked
114:     function getLzTxObj(
115:         bytes calldata additionalArgs
116:     ) private pure returns (IStargateRouter.lzTxObj memory) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L114-L116



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit  ,additionalArgs are not checked
124:     function getDstChainId(
125:         bytes calldata additionalArgs
126:     ) private pure returns (uint16) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L124-L126



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit  ,additionalArgs are not checked
134:     function getSrcPoolId(
135:         bytes calldata additionalArgs
136:     ) private pure returns (uint120) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L134-L136



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit  ,additionalArgs are not checked
144:     function getDstPoolId(
145:         bytes calldata additionalArgs
146:     ) private pure returns (uint120) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L144-L146



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit  ,bridgePayload ,additionalArgs are not checked
163:     function callBridge(
164:         uint256 amt2Bridge,
165:         uint256 dstChainId,
166:         bytes memory bridgePayload,
167:         bytes calldata additionalArgs,
168:         address payable refund
169:     ) private {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L163-L169



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit  ,payload are not checked
183:     function sgReceive(
184:         uint16, // _srcChainid
185:         bytes memory, // _srcAddress
186:         uint256, // _nonce
187:         address, // _token
188:         uint256, // amountLD
189:         bytes memory payload
190:     ) external override onlyExecutor {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L183-L190



```solidity

File: src/swappers/UniSwapper.sol

//@audit  ,payload are not checked
32:     function updateSwapParams(
33:         SwapParams memory newSwapParams,
34:         bytes memory payload
35:     ) external pure returns (bytes memory) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L32-L35



```solidity

File: src/swappers/UniSwapper.sol

//@audit  ,swapPayload are not checked
58:     function swap(
59:         bytes memory swapPayload
60:     )
61:         external
62:         onlyUtb
63:         returns (address tokenOut, uint256 amountOut)
64:     {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L58-L64



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit  ,additionalPayload are not checked
80:     function _getCallParams(
81:         uint8 msgType,
82:         address _toAddress,
83:         uint16 _dstChainId,
84:         uint64 _dstGasForCall,
85:         bool deliverEth,
86:         bytes memory additionalPayload
87:     )
88:         private
89:         view
90:         returns (
91:             bytes32 destBridge,
92:             bytes memory adapterParams,
93:             bytes memory payload
94:         )
95:     {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L80-L95



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit  ,payload are not checked
113:     function estimateSendAndCallFee(
114:         uint8 msgType,
115:         uint16 _dstChainId,
116:         address _toAddress,
117:         uint _amount,
118:         uint64 _dstGasForCall,
119:         bool deliverEth,
120:         bytes memory payload
121:     ) public view returns (uint nativeFee, uint zroFee) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L113-L121



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit  ,additionalPayload are not checked
148:     function _bridgeWithPayload(
149:         uint8 msgType,
150:         uint16 _dstChainId,
151:         address _toAddress,
152:         uint _amount,
153:         uint64 _dstGasForCall,
154:         bytes memory additionalPayload,
155:         bool deliverEth
156:     ) internal {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L148-L156



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit  ,additionalPayload are not checked
197:     function bridgeWithPayload(
198:         uint16 _dstChainId,
199:         address _toAddress,
200:         uint _amount,
201:         bool deliverEth,
202:         uint64 _dstGasForCall,
203:         bytes memory additionalPayload
204:     ) public payable {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L197-L204



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit  ,_payload are not checked
237:     function onOFTReceived(
238:         uint16 _srcChainId,
239:         bytes calldata,
240:         uint64,
241:         bytes32,
242:         uint _amount,
243:         bytes memory _payload
244:     ) external override onlyLzApp {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L237-L244



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

//@audit  ,callPayload are not checked
24:     function _executeWeth(
25:         address from,
26:         address target,
27:         uint256 amount,
28:         bytes memory callPayload
29:     ) private {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L24-L29



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

//@audit  ,callPayload are not checked
54:     function _executeEth(
55:         address from,
56:         address target,
57:         uint256 amount,
58:         bytes memory callPayload
59:     ) private {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L54-L59



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

//@audit  ,callPayload are not checked
68:     function execute(
69:         address from,
70:         address target,
71:         bool deliverEth,
72:         uint256 amount,
73:         bytes memory callPayload
74:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L68-L74

### [N-15]<a name="n-15"></a> Events are missing sender information

When an action is triggered based on a user's action, not being able to filter based on who triggered the action makes event processing a lot more cumbersome. Including the `msg.sender` the events of these types of action will make events much more useful to end users, especially when `msg.sender` is not `tx.origin`.

*There are 1 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

257:         emit ReceivedDecentEth(
258:             msgType,
259:             _srcChainId,
260:             _from,
261:             _to,
262:             _amount,
263:             callPayload
264:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L257-L264

### [N-16]<a name="n-16"></a> Explicitly define visibility of state variables to prevent misconceptions on what can access the variable

Such state variables should be marked as private as this is the default visibility

*There are 12 instance(s) of this issue:*



```solidity

File: src/UTB.sol

18:     IUTBExecutor executor;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L18-L18



```solidity

File: src/UTB.sol

19:     IUTBFeeCollector feeCollector;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L19-L19



```solidity

File: src/UTB.sol

20:     IWETH wrapped;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L20-L20



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

16:     mapping(uint256 => uint16) lzIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L16-L16



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

17:     mapping(uint16 => uint256) chainIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L17-L17



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

18:     bool gasIsEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L18-L18



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

19:     address bridgeToken;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

26:     mapping(uint256 => uint16) lzIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

27:     mapping(uint16 => uint256) chainIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L27-L27



```solidity

File: src/swappers/SwapParams.sol

5:     uint8 constant EXACT_IN = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L5-L5



```solidity

File: src/swappers/SwapParams.sol

6:     uint8 constant EXACT_OUT = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L6-L6



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

9:     IWETH weth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L9-L9

### [N-17]<a name="n-17"></a> Defining All External/Public Functions in Contract Interfaces

It is preferable to have all the external and public function in an interface to make using them easier by developers. This helps ensure the whole API is extracted in a interface.

*There are 8 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {
20:         bridgeExecutor = _executor;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L20



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

34:     function registerRemoteBridgeAdapter(
35:         uint256 dstChainId,
36:         uint16 dstLzId,
37:         address decentBridgeAdapter
38:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L34-L38



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

44:     function estimateFees(
45:         SwapInstructions memory postBridge,
46:         uint256 dstChainId,
47:         address target,
48:         uint64 dstGas,
49:         bytes memory payload
50:     ) public view returns (uint nativeFee, uint zroFee) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L44-L50



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {
38:         stargateEth = _sgEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L38



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

45:     function registerRemoteBridgeAdapter(
46:         uint256 dstChainId,
47:         uint16 dstLzId,
48:         address decentBridgeAdapter
49:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L45-L49



```solidity

File: src/swappers/UniSwapper.sol

100:     function swapNoPath(
101:         SwapParams memory swapParams,
102:         address receiver,
103:         address refund
104:     ) public payable returns (address tokenOut, uint256 amountOut) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L100-L104



```solidity

File: src/swappers/UniSwapper.sol

123:     function swapExactIn(
124:         SwapParams memory swapParams, // SwapParams is a struct
125:         address receiver
126:     ) public payable routerIsSet returns (uint256 amountOut) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L123-L126



```solidity

File: src/swappers/UniSwapper.sol

143:     function swapExactOut(
144:         SwapParams memory swapParams,
145:         address receiver,
146:         address refundAddress
147:     ) public payable routerIsSet returns (uint256 amountIn) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L143-L147

### [N-18]<a name="n-18"></a> Fixed Compiler Version Required for Non-Library/Interface Files

 

*There are 8 instance(s) of this issue:*



```solidity

File: src/UTB.sol

//@audit `UTB` 
2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L2-L2



```solidity

File: src/UTBExecutor.sol

//@audit `UTBExecutor` 
2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L2-L2



```solidity

File: src/bridge_adapters/BaseAdapter.sol

//@audit `BaseAdapter` 
2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit `DecentBridgeAdapter` 
2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `StargateBridgeAdapter` 
2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L2-L2



```solidity

File: src/swappers/UniSwapper.sol

//@audit `UniSwapper` 
2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `DecentEthRouter` 
2: pragma solidity ^0.8.13;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

//@audit `DecentBridgeExecutor` 
2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L2-L2

### [N-19]<a name="n-19"></a> Floating pragma should be avoided

If you leave a floating pragma in your code (pragma solidity 0.4>=0.6. 0. ), you won't know which version was deployed to compile your code, leading to unexpected behavior

*There are 8 instance(s) of this issue:*



```solidity

File: src/UTB.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L2-L2



```solidity

File: src/UTBExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L2-L2



```solidity

File: src/bridge_adapters/BaseAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L2-L2



```solidity

File: src/swappers/UniSwapper.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

2: pragma solidity ^0.8.13;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L2-L2

### [N-20]<a name="n-20"></a> [NatSpec] Natspec description is missing from `function`

It is recommended that Solidity contracts are fully annotated using NatSpec for all public interfaces (everything in the ABI). It is clearly stated in the Solidity official documentation. In complex projects such as Defi, the interpretation of all functions and their arguments and returns is important for code readability and auditability.[source](https://docs.soliditylang.org/en/v0.8.15/natspec-format.html)

*There are 38 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

26:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

30:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L30-L30



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

34:     function registerRemoteBridgeAdapter(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L34-L34



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

44:     function estimateFees(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L44-L44



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

67:     function getBridgeToken(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L67-L67



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

73:     function getBridgedAmount(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L73-L73



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

81:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L81-L81



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

127:     function receiveFromBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L127-L127



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

33:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L33-L33



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L37



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

41:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L41-L41



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

45:     function registerRemoteBridgeAdapter(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L45-L45



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

55:     function getBridgeToken(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L55-L55



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

61:     function getBridgedAmount(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L61-L61



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

69:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L69-L69



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

100:     function getValue(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L100-L100



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

114:     function getLzTxObj(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L114-L114



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

124:     function getDstChainId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L124-L124



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

134:     function getSrcPoolId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L134-L134



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

144:     function getDstPoolId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L144-L144



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

154:     function getDestAdapter(uint chainId) private view returns (address dstAddr) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L154-L154



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

163:     function callBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L163-L163



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

183:     function sgReceive(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L183-L183



```solidity

File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L20



```solidity

File: src/swappers/UniSwapper.sol

24:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L24



```solidity

File: src/swappers/UniSwapper.sol

28:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L28-L28



```solidity

File: src/swappers/UniSwapper.sol

32:     function updateSwapParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L32-L32



```solidity

File: src/swappers/UniSwapper.sol

43:     function _refundUser(address user, address token, uint amount) private {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L43-L43



```solidity

File: src/swappers/UniSwapper.sol

47:     function _sendToRecipient(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L47-L47



```solidity

File: src/swappers/UniSwapper.sol

58:     function swap(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L58-L58



```solidity

File: src/swappers/UniSwapper.sol

79:     function _receiveAndWrapIfNeeded(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L79-L79



```solidity

File: src/swappers/UniSwapper.sol

100:     function swapNoPath(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L100-L100



```solidity

File: src/swappers/UniSwapper.sol

123:     function swapExactIn(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L123-L123



```solidity

File: src/swappers/UniSwapper.sol

143:     function swapExactOut(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L143-L143



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

80:     function _getCallParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L80-L80



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

113:     function estimateSendAndCallFee(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L113-L113



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

148:     function _bridgeWithPayload(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L148-L148

### [N-21]<a name="n-21"></a> Function ordering does not follow the Solidity style guide

According to the [Solidity style guide](https://docs.soliditylang.org/en/v0.8.17/style-guide.html#order-of-functions), functions should be laid out in the following order :`constructor()`, `receive()`, `fallback()`, `external`, `public`, `internal`, `private`, but the cases below do not follow this pattern

*There are 6 instance(s) of this issue:*



```solidity

File: src/UTB.sol

108:     function swapAndExecute(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L108-L108



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

67:     function getBridgeToken(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L67-L67



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

55:     function getBridgeToken(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L55-L55



```solidity

File: src/swappers/UniSwapper.sol

32:     function updateSwapParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L32-L32



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

113:     function estimateSendAndCallFee(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L113-L113



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

68:     function execute(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L68-L68

### [N-22]<a name="n-22"></a> Some if-statement can be converted to a ternary

Improving code readability and compactness is an integral part of optimal programming practices. The use of ternary operators in place of if-else conditions is one such measure. Ternary operators allow us to write conditional statements in a more concise manner, thereby enhancing readability and simplicity. They follow the syntax `condition ? exprIfTrue : exprIfFalse`, which interprets as "if the condition is true, evaluate to `exprIfTrue`, else evaluate to `exprIfFalse`". By adopting this approach, we make our code more streamlined and intuitive, which could potentially aid in better understanding and maintenance of the codebase.

*There are 1 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

100:         if (msgType == MT_ETH_TRANSFER) {
101:             payload = abi.encode(msgType, msg.sender, _toAddress, deliverEth);
102:         } else {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L100-L102

### [N-23]<a name="n-23"></a> Imports could be organized more systematically

The contract used interfaces should be imported first, followed by all other files. The examples below do not follow this layout.

*There are 4 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

6: import {IUTB} from "../interfaces/IUTB.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L6-L6



```solidity

File: src/swappers/UniSwapper.sol

11: import {IV3SwapRouter} from "@uniswap/swap-contracts/interfaces/IV3SwapRouter.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L11-L11



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

9: import {IDecentBridgeExecutor} from "./interfaces/IDecentBridgeExecutor.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L9-L9



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

6: import {IDecentBridgeExecutor} from "./interfaces/IDecentBridgeExecutor.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L6-L6

### [N-24]<a name="n-24"></a> Inconsistent spacing in comments

Some lines use `// x` and some use `//x`. The instances below point out the usages that don't follow the majority, within each file

*There are 5 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

171:             getDstChainId(additionalArgs), //lzBridgeData._dstChainId, // send to LayerZero chainId


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L171-L171



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

172:             getSrcPoolId(additionalArgs), //lzBridgeData._srcPoolId, // source pool id


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L172-L172



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

173:             getDstPoolId(additionalArgs), //lzBridgeData._dstPoolId, // dst pool id


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L173-L173



```solidity

File: src/swappers/UniSwapper.sol

153:                 //deadline: block.timestamp,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L153-L153



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

190:             payload, //payload (will have recipients address)


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L190-L190

### [N-25]<a name="n-25"></a> Large numeric literals should use underscores for readability

 

*There are 3 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L176-L176



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L176-L176



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

96:         uint256 GAS_FOR_RELAY = 100000;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L96-L96

### [N-26]<a name="n-26"></a> Long functions should be refactored into multiple, smaller, functions

 

*There are 3 instance(s) of this issue:*



```solidity

File: src/UTB.sol

207:     function approveAndCheckIfNative(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L207-L207



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

148:     function _bridgeWithPayload(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L148-L148



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

237:     function onOFTReceived(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L237-L237

### [N-27]<a name="n-27"></a> Long lines of code

Usually lines in source code are limited to [80](https://softwareengineering.stackexchange.com/questions/148677/why-is-80-characters-the-standard-limit-for-code-width) characters. Today's screens are much larger so it's reasonable to stretch this in some cases. The solidity style guide recommends a maximumum line length of [120 characters](https://docs.soliditylang.org/en/v0.8.17/style-guide.html#maximum-line-length), so the lines below should be split when they reach that length.

*There are 1 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L176-L176

### [N-28]<a name="n-28"></a> Missing event and or timelock for critical parameter change

Events help non-contract tools to track changes, and events prevent users from being surprised by changes

*There are 10 instance(s) of this issue:*



```solidity

File: src/UTB.sol

28:     function setExecutor(address _executor) public onlyOwner {
29:         executor = IUTBExecutor(_executor);
30:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L28-L30



```solidity

File: src/UTB.sol

36:     function setWrapped(address payable _wrapped) public onlyOwner {
37:         wrapped = IWETH(_wrapped);
38:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L36-L38



```solidity

File: src/UTB.sol

44:     function setFeeCollector(address payable _feeCollector) public onlyOwner {
45:         feeCollector = IUTBFeeCollector(_feeCollector);
46:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L44-L46



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {
20:         bridgeExecutor = _executor;
21:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L21



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

26:     function setRouter(address _router) public onlyOwner {
27:         router = IDecentEthRouter(payable(_router));
28:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L26-L28



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

33:     function setRouter(address _router) public onlyOwner {
34:         router = IStargateRouter(_router);
35:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L33-L35



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {
38:         stargateEth = _sgEth;
39:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L39



```solidity

File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {
21:         uniswap_router = _router;
22:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L22



```solidity

File: src/swappers/UniSwapper.sol

24:     function setWrapped(address payable _wrapped) public onlyOwner {
25:         wrapped = _wrapped;
26:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L26



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

73:     function addDestinationBridge(
74:         uint16 _dstChainId,
75:         address _routerAddress
76:     ) public onlyOwner {
77:         destinationBridges[_dstChainId] = _routerAddress;
78:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L73-L78

### [N-29]<a name="n-29"></a> File is missing NatSpec

 

*There are 5 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/BaseAdapter.sol

0: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L0-L0



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

0: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L0-L0



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

0: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L0-L0



```solidity

File: src/swappers/SwapParams.sol

0: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L0-L0



```solidity

File: src/swappers/UniSwapper.sol

0: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L0-L0

### [N-30]<a name="n-30"></a> Mixed usage of `int`/`uint` with `int256`/`uint256`

`int256`/`uint256` are the preferred type names (they're what are used for function signatures), so they should be used consistently

*There are 22 instance(s) of this issue:*



```solidity

File: src/UTB.sol

284:         uint bridgeFee,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L284-L284



```solidity

File: src/UTB.sol

234:             uint value = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L234-L234



```solidity

File: src/UTBExecutor.sol

24:         uint amount,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L24-L24



```solidity

File: src/UTBExecutor.sol

46:         uint amount,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L46-L46



```solidity

File: src/UTBExecutor.sol

48:         uint extraNative


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L48-L48



```solidity

File: src/UTBExecutor.sol

59:         uint initBalance = IERC20(token).balanceOf(address(this));


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L59-L59



```solidity

File: src/UTBExecutor.sol

73:         uint remainingBalance = IERC20(token).balanceOf(address(this)) -


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L73-L73



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

50:     ) public view returns (uint nativeFee, uint zroFee) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L50-L50



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

50:     ) public view returns (uint nativeFee, uint zroFee) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L50-L50



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

103:     ) private view returns (uint value) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L103-L103



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

154:     function getDestAdapter(uint chainId) private view returns (address dstAddr) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L154-L154



```solidity

File: src/swappers/UniSwapper.sol

43:     function _refundUser(address user, address token, uint amount) private {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L43-L43



```solidity

File: src/swappers/UniSwapper.sol

50:         uint amount


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L50-L50



```solidity

File: src/swappers/UniSwapper.sol

115:         uint amt2Recipient = swapParams.direction == SwapDirection.EXACT_OUT


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L115-L115



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

117:         uint _amount,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L117-L117



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

121:     ) public view returns (uint nativeFee, uint zroFee) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L121-L121



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

121:     ) public view returns (uint nativeFee, uint zroFee) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L121-L121



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

152:         uint _amount,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L152-L152



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

200:         uint _amount,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L200-L200



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

221:         uint _amount,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L221-L221



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

242:         uint _amount,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L242-L242



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

176:         uint gasValue;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L176-L176

### [N-31]<a name="n-31"></a> Consider using named mappings

Consider using [named mappings](https://ethereum.stackexchange.com/a/145555) to make it easier to understand the purpose of each mapping

*There are 10 instance(s) of this issue:*



```solidity

File: src/UTB.sol

21:     mapping(uint8 => address) public swappers;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L21-L21



```solidity

File: src/UTB.sol

22:     mapping(uint8 => address) public bridgeAdapters;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L22-L22



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

14:     mapping(uint256 => address) public destinationBridgeAdapter;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L14-L14



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

16:     mapping(uint256 => uint16) lzIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L16-L16



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

17:     mapping(uint16 => uint256) chainIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L17-L17



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

25:     mapping(uint256 => address) public destinationBridgeAdapter;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L25-L25



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

26:     mapping(uint256 => uint16) lzIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

27:     mapping(uint16 => uint256) chainIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L27-L27



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

24:     mapping(uint16 => address) public destinationBridges;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L24-L24



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

25:     mapping(address => uint256) public balanceOf;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L25-L25

### [N-32]<a name="n-32"></a> Consider using later versions of solidity for more cappabilities

Consider using solidity 0.8.18 or later to benefit from multiple things including the named mappings [named mappings](https://ethereum.stackexchange.com/a/145555) to make it easier to understand the purpose of each mapping

*There are 9 instance(s) of this issue:*



```solidity

File: src/UTB.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L2-L2



```solidity

File: src/UTBExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L2-L2



```solidity

File: src/bridge_adapters/BaseAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L2-L2



```solidity

File: src/swappers/SwapParams.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L2-L2



```solidity

File: src/swappers/UniSwapper.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

2: pragma solidity ^0.8.13;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L2-L2

### [N-33]<a name="n-33"></a> Some error strings are not descriptive

Consider adding more detail to these error strings

*There are 1 instance(s) of this issue:*



```solidity

File: src/swappers/UniSwapper.sol

//@audit This message need more details : router not set
96:         require(uniswap_router != address(0), "router not set");


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L96-L96

### [N-34]<a name="n-34"></a> Use of `override` is unnecessary

Starting with Solidity version [0.8.8](https://docs.soliditylang.org/en/v0.8.20/contracts.html#function-overriding), using the `override` keyword when the function solely overrides an interface function, and the function doesn't exist in multiple base contracts, is unnecessary.

*There are 2 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

183:     function sgReceive(
184:         uint16, // _srcChainid
185:         bytes memory, // _srcAddress
186:         uint256, // _nonce
187:         address, // _token
188:         uint256, // amountLD
189:         bytes memory payload
190:     ) external override onlyExecutor {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L183-L190



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

237:     function onOFTReceived(
238:         uint16 _srcChainId,
239:         bytes calldata,
240:         uint64,
241:         bytes32,
242:         uint _amount,
243:         bytes memory _payload
244:     ) external override onlyLzApp {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L237-L244

### [N-35]<a name="n-35"></a> Functions which are either private or internal should have a preceding _ in their name

Add a preceding underscore to the function name, take care to refactor where there functions are called 

*There are 12 instance(s) of this issue:*



```solidity

File: src/UTB.sol

52:     function performSwap(
53:         SwapInstructions memory swapInstructions
54:     ) private returns (address tokenOut, uint256 amountOut) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L52-L54



```solidity

File: src/UTB.sol

63:     function performSwap(
64:         SwapInstructions memory swapInstructions,
65:         bool retrieveTokenIn
66:     ) private returns (address tokenOut, uint256 amountOut) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L63-L66



```solidity

File: src/UTB.sol

168:     function swapAndModifyPostBridge(
169:         BridgeInstructions memory instructions
170:     )
171:         private
172:         returns (


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L168-L172



```solidity

File: src/UTB.sol

207:     function approveAndCheckIfNative(
208:         BridgeInstructions memory instructions,
209:         uint256 amt2Bridge
210:     ) private returns (bool) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L207-L210



```solidity

File: src/UTB.sol

282:     function callBridge(
283:         uint256 amt2Bridge,
284:         uint bridgeFee,
285:         BridgeInstructions memory instructions
286:     ) private returns (bytes memory) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L282-L286



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

100:     function getValue(
101:         bytes calldata additionalArgs,
102:         uint256 amt2Bridge
103:     ) private view returns (uint value) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L100-L103



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

114:     function getLzTxObj(
115:         bytes calldata additionalArgs
116:     ) private pure returns (IStargateRouter.lzTxObj memory) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L114-L116



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

124:     function getDstChainId(
125:         bytes calldata additionalArgs
126:     ) private pure returns (uint16) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L124-L126



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

134:     function getSrcPoolId(
135:         bytes calldata additionalArgs
136:     ) private pure returns (uint120) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L134-L136



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

144:     function getDstPoolId(
145:         bytes calldata additionalArgs
146:     ) private pure returns (uint120) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L144-L146



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

154:     function getDestAdapter(uint chainId) private view returns (address dstAddr) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L154-L154



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

163:     function callBridge(
164:         uint256 amt2Bridge,
165:         uint256 dstChainId,
166:         bytes memory bridgePayload,
167:         bytes calldata additionalArgs,
168:         address payable refund
169:     ) private {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L163-L169

### [N-36]<a name="n-36"></a> Private and internal state variables should have a preceding _ in their name unless they are constants

Add a preceding underscore to the state variable name, take care to refactor where there variables are read/wrote

*There are 10 instance(s) of this issue:*



```solidity

File: src/UTB.sol

18:     IUTBExecutor executor;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L18-L18



```solidity

File: src/UTB.sol

19:     IUTBFeeCollector feeCollector;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L19-L19



```solidity

File: src/UTB.sol

20:     IWETH wrapped;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L20-L20



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

16:     mapping(uint256 => uint16) lzIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L16-L16



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

17:     mapping(uint16 => uint256) chainIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L17-L17



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

18:     bool gasIsEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L18-L18



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

19:     address bridgeToken;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

26:     mapping(uint256 => uint16) lzIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

27:     mapping(uint16 => uint256) chainIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L27-L27



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

9:     IWETH weth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L9-L9

### [N-37]<a name="n-37"></a> `public` functions not called by the contract should be declared `external` instead

Contracts [are allowed](https://docs.soliditylang.org/en/latest/contracts.html#function-overriding) to override their parents' functions and change the visibility from `external` to `public`.

*There are 35 instance(s) of this issue:*



```solidity

File: src/UTB.sol

28:     function setExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L28-L28



```solidity

File: src/UTB.sol

36:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L36-L36



```solidity

File: src/UTB.sol

44:     function setFeeCollector(address payable _feeCollector) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L44-L44



```solidity

File: src/UTB.sol

108:     function swapAndExecute(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L108-L108



```solidity

File: src/UTB.sol

259:     function bridgeAndExecute(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L259-L259



```solidity

File: src/UTB.sol

311:     function receiveFromBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L311-L311



```solidity

File: src/UTB.sol

325:     function registerSwapper(address swapper) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L325-L325



```solidity

File: src/UTB.sol

334:     function registerBridge(address bridge) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L334-L334



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

26:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

30:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L30-L30



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

34:     function registerRemoteBridgeAdapter(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L34-L34



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

44:     function estimateFees(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L44-L44



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

81:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L81-L81



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

127:     function receiveFromBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L127-L127



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

33:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L33-L33



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L37



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

41:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L41-L41



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

45:     function registerRemoteBridgeAdapter(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L45-L45



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

69:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L69-L69



```solidity

File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L20



```solidity

File: src/swappers/UniSwapper.sol

24:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L24



```solidity

File: src/swappers/UniSwapper.sol

28:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L28-L28



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

68:     function registerDcntEth(address _addr) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L68-L68



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

73:     function addDestinationBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L73-L73



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

113:     function estimateSendAndCallFee(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L113-L113



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

197:     function bridgeWithPayload(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L197-L197



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

218:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L218-L218



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

285:     function redeemEth(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L285-L285



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

294:     function redeemWeth(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L294-L294



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

302:     function addLiquidityEth()


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L302-L302



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

313:     function removeLiquidityEth(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L313-L313



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

322:     function addLiquidityWeth(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L322-L322



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

330:     function removeLiquidityWeth(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L330-L330



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

68:     function execute(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L68-L68

### [N-38]<a name="n-38"></a> Remove `forge-std` import

Logging and debugging libraries such as forge-std are crucial tools during the development phase of a smart contract, as they provide critical insights into the execution of the contract. However, it's essential to remove or disable these libraries in the production version of your contract. Leaving such libraries active in the final version can lead to unnecessary gas costs, as logging operations consume gas, and it can potentially expose sensitive internal state information.

*There are 5 instance(s) of this issue:*



```solidity

File: src/UTB.sol

7: import {IERC20} from "forge-std/interfaces/IERC20.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L7-L7



```solidity

File: src/UTBExecutor.sol

4: import {IERC20} from "forge-std/interfaces/IERC20.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L4-L4



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

4: import {IERC20} from "forge-std/interfaces/IERC20.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L4-L4



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

4: import {IERC20} from "forge-std/interfaces/IERC20.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L4-L4



```solidity

File: src/swappers/UniSwapper.sol

7: import {IERC20} from "forge-std/interfaces/IERC20.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L7-L7

### [N-39]<a name="n-39"></a> Setters should prevent re-setting of the same value

This especially problematic when the setter also emits the same value, which may be confusing to offline parsers

*There are 4 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/BaseAdapter.sol

//@audit `bridgeExecutor` and `_executor` are never checked for the same value setting
19:     function setBridgeExecutor(address _executor) public onlyOwner {
20:         bridgeExecutor = _executor;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L20



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `stargateEth` and `_sgEth` are never checked for the same value setting
37:     function setStargateEth(address _sgEth) public onlyOwner {
38:         stargateEth = _sgEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L38



```solidity

File: src/swappers/UniSwapper.sol

//@audit `uniswap_router` and `_router` are never checked for the same value setting
20:     function setRouter(address _router) public onlyOwner {
21:         uniswap_router = _router;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L21



```solidity

File: src/swappers/UniSwapper.sol

//@audit `wrapped` and `_wrapped` are never checked for the same value setting
24:     function setWrapped(address payable _wrapped) public onlyOwner {
25:         wrapped = _wrapped;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L25

### [N-40]<a name="n-40"></a> NatSpec `@return` argument is missing

 

*There are 6 instance(s) of this issue:*



```solidity

File: src/UTB.sol

// @audit the @return is missing
 @dev Performs a swap with a default setting to retrieve ERC20.
 @param swapInstructions The swapper ID and calldata to execute a swap.


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L52-L1



```solidity

File: src/UTB.sol

// @audit the @return is missing
 @dev Performs a swap with the requested swapper and swap calldata.
 @param swapInstructions The swapper ID and calldata to execute a swap.
 @param retrieveTokenIn Flag indicating whether to transfer ERC20 for the swap.


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L63-L1



```solidity

File: src/UTB.sol

// @audit the @return is missing
 @dev Performs the pre bridge swap and modifies the post bridge swap to utilize the bridged amount.
 @param instructions The bridge data, token swap data, and payment transaction payload.


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L168-L1



```solidity

File: src/UTB.sol

// @audit the @return is missing
 @dev Checks if the bridge token is native, and approves the bridge adapter to transfer ERC20 if required.
 @param instructions The bridge data, token swap data, and payment transaction payload.
 @param amt2Bridge The amount of the bridge token being transferred to the bridge adapter.


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L207-L1



```solidity

File: src/UTB.sol

// @audit the @return is missing
 @dev Bridges funds in native or ERC20 and a payment transaction payload to the destination chain
 @param instructions The bridge data, token swap data, and payment transaction payload.
 @param fees The bridge fee in native, as well as utb fee token and amount.
 @param signature The ECDSA signature to verify the fee structure.


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L259-L1



```solidity

File: src/UTB.sol

// @audit the @return is missing
 @dev Calls the bridge adapter to bridge funds, and approves the bridge adapter to transfer ERC20 if required.
 @param amt2Bridge The amount of the bridge token being bridged via the bridge adapter.
 @param bridgeFee The fee being transferred to the bridge adapter and finally to the bridge.
 @param instructions The bridge data, token swap data, and payment transaction payload.


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L282-L1

### [N-41]<a name="n-41"></a> Consider using `SafeTransferLib.safeTransferETH()` or `Address.sendValue()` for clearer semantic meaning

These Functions indicate their purpose with their name more clearly than using low-level calls.

*There are 7 instance(s) of this issue:*



```solidity

File: src/UTBExecutor.sol

52:             (success, ) = target.call{value: amount}(payload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L52-L52



```solidity

File: src/UTBExecutor.sol

70:             (success, ) = target.call(payload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L70-L70



```solidity

File: src/UTBExecutor.sol

65:             (success, ) = target.call{value: extraNative}(payload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L65-L65



```solidity

File: src/UTBExecutor.sol

54:                 (refund.call{value: amount}(""));


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L54-L54



```solidity

File: src/UTBExecutor.sol

67:                 (refund.call{value: extraNative}(""));


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L67-L67



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

33:         (bool success, ) = target.call(callPayload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L33-L33



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

61:         (bool success, ) = target.call{value: amount}(callPayload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L61-L61

### [N-42]<a name="n-42"></a> Polymorphic functions make security audits more time-consuming and error-prone

The instances below point to one of two functions with the same name. Consider naming each function differently, in order to make code navigation and analysis easier.

*There are 1 instance(s) of this issue:*



```solidity

File: src/UTBExecutor.sol

41:     function execute(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L41-L41

### [N-43]<a name="n-43"></a> Large multiples of ten should use scientific notation (e.g. `1e6`) rather than decimal literals (e.g. `1000000`), for readability

While the compiler knows to optimize away the exponentiation, it's still better coding practice to use idioms that do not require compiler optimization, if they exist

*There are 3 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `10000`
176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L176-L176



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `10000`
176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L176-L176



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `100000`
96:         uint256 GAS_FOR_RELAY = 100000;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L96-L96

### [N-44]<a name="n-44"></a> Empty `receive()`/`payable fallback()` function does not authorize requests

If the intention is for the Ether to be used, the function should call another function, otherwise it should revert (e.g. `require(msg.sender == address(weth))`). Having no access control on the function means that someone may send Ether to the contract, and have no way to get anything back out, which is a loss of funds. If the concern is having to spend a small amount of gas to check the sender against an immutable address, the code should at least have a function to rescue unused Ether.

*There are 12 instance(s) of this issue:*



```solidity

File: src/UTB.sol

339:     receive() external payable {}
340: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L339-L340



```solidity

File: src/UTB.sol

341:     fallback() external payable {}
342: }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L341-L342



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

156:     receive() external payable {}
157: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L156-L157



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

158:     fallback() external payable {}
159: }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L158-L159



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

218:     receive() external payable {}
219: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L218-L219



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

220:     fallback() external payable {}
221: }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L220-L221



```solidity

File: src/swappers/UniSwapper.sol

171:     receive() external payable {}
172: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L171-L172



```solidity

File: src/swappers/UniSwapper.sol

173:     fallback() external payable {}
174: }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L173-L174



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

337:     receive() external payable {}
338: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L337-L338



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

339:     fallback() external payable {}
340: }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L339-L340



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

85:     receive() external payable {}
86: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L85-L86



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

88:     fallback() external payable {}
89: }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L88-L89

### [N-45]<a name="n-45"></a> State variables should have `Natspec` comments

Consider adding some `Natspec` comments on critical state variables to explain what they are supposed to do: this will help for future code reviews.

*There are 36 instance(s) of this issue:*



```solidity

File: src/UTB.sol

//@audit executor need comments
18:     IUTBExecutor executor;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L18-L18



```solidity

File: src/UTB.sol

//@audit feeCollector need comments
19:     IUTBFeeCollector feeCollector;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L19-L19



```solidity

File: src/UTB.sol

//@audit wrapped need comments
20:     IWETH wrapped;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L20-L20



```solidity

File: src/UTB.sol

//@audit swappers need comments
21:     mapping(uint8 => address) public swappers;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L21-L21



```solidity

File: src/UTB.sol

//@audit bridgeAdapters need comments
22:     mapping(uint8 => address) public bridgeAdapters;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L22-L22



```solidity

File: src/bridge_adapters/BaseAdapter.sol

//@audit bridgeExecutor need comments
7:     address public bridgeExecutor;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L7-L7



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit BRIDGE_ID need comments
13:     uint8 public constant BRIDGE_ID = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L13-L13



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit destinationBridgeAdapter need comments
14:     mapping(uint256 => address) public destinationBridgeAdapter;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L14-L14



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit router need comments
15:     IDecentEthRouter public router;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L15-L15



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit lzIdLookup need comments
16:     mapping(uint256 => uint16) lzIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L16-L16



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit chainIdLookup need comments
17:     mapping(uint16 => uint256) chainIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L17-L17



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit gasIsEth need comments
18:     bool gasIsEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L18-L18



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit bridgeToken need comments
19:     address bridgeToken;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit BRIDGE_ID need comments
22:     uint8 public constant BRIDGE_ID = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L22-L22



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit SG_FEE_BPS need comments
23:     uint8 public constant SG_FEE_BPS = 6;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L23-L23



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit stargateEth need comments
24:     address public stargateEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L24-L24



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit destinationBridgeAdapter need comments
25:     mapping(uint256 => address) public destinationBridgeAdapter;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L25-L25



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit lzIdLookup need comments
26:     mapping(uint256 => uint16) lzIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit chainIdLookup need comments
27:     mapping(uint16 => uint256) chainIdLookup;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L27-L27



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit router need comments
31:     IStargateRouter public router;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L31-L31



```solidity

File: src/swappers/SwapParams.sol

//@audit EXACT_IN need comments
5:     uint8 constant EXACT_IN = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L5-L5



```solidity

File: src/swappers/SwapParams.sol

//@audit EXACT_OUT need comments
6:     uint8 constant EXACT_OUT = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L6-L6



```solidity

File: src/swappers/UniSwapper.sol

//@audit SWAPPER_ID need comments
16:     uint8 public constant SWAPPER_ID = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L16-L16



```solidity

File: src/swappers/UniSwapper.sol

//@audit uniswap_router need comments
17:     address public uniswap_router;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L17-L17



```solidity

File: src/swappers/UniSwapper.sol

//@audit wrapped need comments
18:     address payable public wrapped;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L18-L18



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit weth need comments
13:     IWETH public weth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L13-L13



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit dcntEth need comments
14:     IDcntEth public dcntEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L14-L14



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit executor need comments
15:     IDecentBridgeExecutor public executor;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L15-L15



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit MT_ETH_TRANSFER need comments
17:     uint8 public constant MT_ETH_TRANSFER = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L17-L17



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit MT_ETH_TRANSFER_WITH_PAYLOAD need comments
18:     uint8 public constant MT_ETH_TRANSFER_WITH_PAYLOAD = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L18-L18



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit PT_SEND_AND_CALL need comments
20:     uint16 public constant PT_SEND_AND_CALL = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L20-L20



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit gasCurrencyIsEth need comments
22:     bool public gasCurrencyIsEth; // for chains that use ETH as gas currency


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L22-L22



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit destinationBridges need comments
24:     mapping(uint16 => address) public destinationBridges;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L24-L24



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit balanceOf need comments
25:     mapping(address => uint256) public balanceOf;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L25-L25



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

//@audit weth need comments
9:     IWETH weth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L9-L9



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

//@audit gasCurrencyIsEth need comments
10:     bool public gasCurrencyIsEth; // for chains that use ETH as gas currency


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L10-L10

### [N-46]<a name="n-46"></a> Contracts should have full test coverage

While 100% code coverage does not guarantee that there are no bugs, it often will catch easy-to-find bugs, and will ensure that there are fewer regressions when the code invariably has to be modified. Furthermore, in order to get full coverage, code authors will often have to re-organize their code so that it is more modular, so that each component can be tested separately, which reduces interdependencies between modules and layers, and makes for code that is easier to reason about and audit.

*There are 1 instance(s) of this issue:*



```solidity

File: src/UTB.sol

@audit Multiple files
1: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L1-L1

### [N-47]<a name="n-47"></a> [NatSpec] Natspec `@title` is missing from `contract`

 

*There are 9 instance(s) of this issue:*



```solidity

File: src/UTB.sol

15: contract UTB is Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L15-L15



```solidity

File: src/UTBExecutor.sol

7: contract UTBExecutor is Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L7-L7



```solidity

File: src/bridge_adapters/BaseAdapter.sol

6: contract BaseAdapter is UTBOwned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L6-L6



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

12: contract DecentBridgeAdapter is BaseAdapter, IBridgeAdapter {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L12-L12



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

17: contract StargateBridgeAdapter is


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L17-L17



```solidity

File: src/swappers/SwapParams.sol

4: library SwapDirection {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L4-L4



```solidity

File: src/swappers/UniSwapper.sol

13: contract UniSwapper is UTBOwned, ISwapper {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L13-L13



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

12: contract DecentEthRouter is IDecentEthRouter, IOFTReceiverV2, Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L12-L12



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

8: contract DecentBridgeExecutor is IDecentBridgeExecutor, Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L8-L8

### [N-48]<a name="n-48"></a> Top level pragma declarations should be separated by two blank lines

 

*There are 15 instance(s) of this issue:*



```solidity

File: src/UTB.sol

2: pragma solidity ^0.8.0;
3: 
4: import {Owned} from "solmate/auth/Owned.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L2-L4



```solidity

File: src/UTBExecutor.sol

2: pragma solidity ^0.8.0;
3: 
4: import {IERC20} from "forge-std/interfaces/IERC20.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L2-L4



```solidity

File: src/UTBExecutor.sol

5: import {Owned} from "solmate/auth/Owned.sol";
6: 
7: contract UTBExecutor is Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L5-L7



```solidity

File: src/bridge_adapters/BaseAdapter.sol

2: pragma solidity ^0.8.0;
3: 
4: import {UTBOwned} from "../UTBOwned.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L2-L4



```solidity

File: src/bridge_adapters/BaseAdapter.sol

4: import {UTBOwned} from "../UTBOwned.sol";
5: 
6: contract BaseAdapter is UTBOwned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L4-L6



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

2: pragma solidity ^0.8.0;
3: 
4: import {IERC20} from "forge-std/interfaces/IERC20.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L2-L4



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

10: import {BaseAdapter} from "./BaseAdapter.sol";
11: 
12: contract DecentBridgeAdapter is BaseAdapter, IBridgeAdapter {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L10-L12



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

2: pragma solidity ^0.8.0;
3: 
4: import {IERC20} from "forge-std/interfaces/IERC20.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L2-L4



```solidity

File: src/swappers/SwapParams.sol

2: pragma solidity ^0.8.0;
3: 
4: library SwapDirection {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L2-L4



```solidity

File: src/swappers/UniSwapper.sol

2: pragma solidity ^0.8.0;
3: 
4: import {UTBOwned} from "../UTBOwned.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L2-L4



```solidity

File: src/swappers/UniSwapper.sol

11: import {IV3SwapRouter} from "@uniswap/swap-contracts/interfaces/IV3SwapRouter.sol";
12: 
13: contract UniSwapper is UTBOwned, ISwapper {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L11-L13



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

2: pragma solidity ^0.8.13;
3: 
4: import {IWETH} from "./interfaces/IWETH.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L2-L4



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

10: import {IDecentEthRouter} from "./interfaces/IDecentEthRouter.sol";
11: 
12: contract DecentEthRouter is IDecentEthRouter, IOFTReceiverV2, Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L10-L12



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

2: pragma solidity ^0.8.0;
3: 
4: import {IWETH} from "./interfaces/IWETH.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L2-L4



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

6: import {IDecentBridgeExecutor} from "./interfaces/IDecentBridgeExecutor.sol";
7: 
8: contract DecentBridgeExecutor is IDecentBridgeExecutor, Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L6-L8

### [N-49]<a name="n-49"></a> Critical functions should be a two step procedure

Critical functions in Solidity contracts should follow a two-step procedure to enhance security, minimize human error, and ensure proper access control. By dividing sensitive operations into distinct phases, such as initiation and confirmation, developers can introduce a safeguard against unintended actions or unauthorized access.

*There are 12 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

73:     function addDestinationBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L73-L73



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

302:     function addLiquidityEth()


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L302-L302



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

313:     function removeLiquidityEth(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L313-L313



```solidity

File: src/UTB.sol

28:     function setExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L28-L28



```solidity

File: src/UTB.sol

36:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L36-L36



```solidity

File: src/UTB.sol

44:     function setFeeCollector(address payable _feeCollector) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L44-L44



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

26:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

33:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L33-L33



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L37



```solidity

File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L20



```solidity

File: src/swappers/UniSwapper.sol

24:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L24

### [N-50]<a name="n-50"></a> uint variables should have the bit size defined explicitly

Instead of using uint to declare uint258, explicitly define uint258 to ensure there is no confusion

*There are 22 instance(s) of this issue:*



```solidity

File: src/UTB.sol

//@audit `bridgeFee`
284:         uint bridgeFee,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L284-L284



```solidity

File: src/UTB.sol

//@audit `value`
234:             uint value = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L234-L234



```solidity

File: src/UTBExecutor.sol

//@audit `amount`
24:         uint amount,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L24-L24



```solidity

File: src/UTBExecutor.sol

//@audit `amount`
46:         uint amount,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L46-L46



```solidity

File: src/UTBExecutor.sol

//@audit `extraNative`
48:         uint extraNative


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L48-L48



```solidity

File: src/UTBExecutor.sol

//@audit `initBalance`
59:         uint initBalance = IERC20(token).balanceOf(address(this));


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L59-L59



```solidity

File: src/UTBExecutor.sol

//@audit `remainingBalance`
73:         uint remainingBalance = IERC20(token).balanceOf(address(this)) -


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L73-L73



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit `nativeFee`
50:     ) public view returns (uint nativeFee, uint zroFee) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L50-L50



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit `zroFee`
50:     ) public view returns (uint nativeFee, uint zroFee) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L50-L50



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `value`
103:     ) private view returns (uint value) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L103-L103



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `chainId`
154:     function getDestAdapter(uint chainId) private view returns (address dstAddr) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L154-L154



```solidity

File: src/swappers/UniSwapper.sol

//@audit `amount`
43:     function _refundUser(address user, address token, uint amount) private {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L43-L43



```solidity

File: src/swappers/UniSwapper.sol

//@audit `amount`
50:         uint amount


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L50-L50



```solidity

File: src/swappers/UniSwapper.sol

//@audit `amt2Recipient`
115:         uint amt2Recipient = swapParams.direction == SwapDirection.EXACT_OUT


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L115-L115



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_amount`
117:         uint _amount,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L117-L117



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `nativeFee`
121:     ) public view returns (uint nativeFee, uint zroFee) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L121-L121



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `zroFee`
121:     ) public view returns (uint nativeFee, uint zroFee) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L121-L121



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_amount`
152:         uint _amount,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L152-L152



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_amount`
200:         uint _amount,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L200-L200



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_amount`
221:         uint _amount,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L221-L221



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `_amount`
242:         uint _amount,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L242-L242



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit `gasValue`
176:         uint gasValue;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L176-L176

### [N-51]<a name="n-51"></a> Uncommented fields in a struct

Consider adding comments for all the fields in a struct to improve the readability of the codebase.

*There are 1 instance(s) of this issue:*



```solidity

File: src/swappers/SwapParams.sol

//@audit Add explanational comments to the following items `amountIn`, `amountOut`, `tokenIn`, `tokenOut`, `direction`, `path`, 
09: struct SwapParams {
10:     uint256 amountIn;
11:     uint256 amountOut;
12:     address tokenIn;
13:     address tokenOut;
14:     uint8 direction;
15:     // if direction is exactAmountIn
16:     // then amount out will be the minimum amount out
17:     // if direction is exactAmountOutA
18:     // then amount in is maximum amount in
19:     bytes path;
20: }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L9-L20

### [N-52]<a name="n-52"></a> Unused Import

Some files/Items are imported but never used

*There are 1 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `UTBOwned` is not used
5: import {UTBOwned} from "../UTBOwned.sol";


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L5-L5

### [N-53]<a name="n-53"></a> Missing upgradability functionality

At the begining of a project, there is always the need to modify of add something to the source code especialy if any vulnerability is discovered. Therefore, having such system is crusial at least at the first stages of the project

*There are 1 instance(s) of this issue:*



```solidity

File: src/UTB.sol

1: // SPDX-License-Identifier: UNLICENSED


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L1-L1

### [N-54]<a name="n-54"></a> Cast to `bytes` or `bytes32` for clearer semantic meaning

Using a [cast](https://ethereum.stackexchange.com/questions/30912/how-to-compare-strings-in-solidity#answer-82739) on a single argument, rather than `abi.encodePacked()` makes the intended operation more clear, leading to less reviewer confusion.

*There are 1 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

178:             abi.encodePacked(getDestAdapter(dstChainId)),


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L178-L178

### [N-55]<a name="n-55"></a> Constants should be defined rather than using magic numbers

Even [assembly](https://github.com/code-423n4/2022-05-opensea-seaport/blob/9d7ce4d08bf3c3010304a0476a785c70c0e90ae7/contracts/lib/TokenTransferrer.sol#L35-L39) can benefit from using readable constants instead of hex/numeric literals

*There are 3 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit Try to make a `constant` with `10000` value
176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L176-L176



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit Try to make a `constant` with `10000` value
176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L176-L176



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit Try to make a `constant` with `100000` value
96:         uint256 GAS_FOR_RELAY = 100000;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L96-L96

### [N-56]<a name="n-56"></a> Use the latest solidity (prior to 0.8.20 if on L2s) for deployment

```
When deploying contracts, you should use the latest released version of Solidity.Apart from exceptional cases, only the latest version receives security fixes.
```
https://docs.soliditylang.org/en/v0.8.20/

*There are 9 instance(s) of this issue:*



```solidity

File: src/UTB.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L2-L2



```solidity

File: src/UTBExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L2-L2



```solidity

File: src/bridge_adapters/BaseAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L2-L2



```solidity

File: src/swappers/SwapParams.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L2-L2



```solidity

File: src/swappers/UniSwapper.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

2: pragma solidity ^0.8.13;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L2-L2

### [N-57]<a name="n-57"></a> Use a single file for system wide constants

Consider grouping all the system constants under a single file. This finding shows only the first constant for each file.

*There are 5 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

13:     uint8 public constant BRIDGE_ID = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L13-L13



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

22:     uint8 public constant BRIDGE_ID = 1;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L22-L22



```solidity

File: src/swappers/SwapParams.sol

5:     uint8 constant EXACT_IN = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L5-L5



```solidity

File: src/swappers/UniSwapper.sol

16:     uint8 public constant SWAPPER_ID = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L16-L16



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

17:     uint8 public constant MT_ETH_TRANSFER = 0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L17-L17

### [N-58]<a name="n-58"></a> Consider using SMTChecker

The SMTChecker is a valuable tool for Solidity developers as it helps detect potential vulnerabilities and logical errors in the contract's code. By utilizing Satisfiability Modulo Theories (SMT) solvers, it can reason about the potential states a contract can be in, and therefore, identify conditions that could lead to undesirable behavior. This automatic formal verification can catch issues that might otherwise be missed in manual code reviews or standard testing, enhancing the overall contract's security and reliability.

*There are 9 instance(s) of this issue:*



```solidity

File: src/UTB.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L2-L2



```solidity

File: src/UTBExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L2-L2



```solidity

File: src/bridge_adapters/BaseAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L2-L2



```solidity

File: src/swappers/SwapParams.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L2-L2



```solidity

File: src/swappers/UniSwapper.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

2: pragma solidity ^0.8.13;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L2-L2

### [N-59]<a name="n-59"></a> Variable name must be in mixedCase

Avoid using underscore for variable Names or parameters

*There are 2 instance(s) of this issue:*



```solidity

File: src/swappers/UniSwapper.sol

// @audit uniswap_router
17:     address public uniswap_router;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L17-L17



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

// @audit GAS_FOR_RELAY
96:         uint256 GAS_FOR_RELAY = 100000;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L96-L96

### [N-60]<a name="n-60"></a> Whitespace in Expressions

See the [Whitespace in Expressions](https://docs.soliditylang.org/en/latest/style-guide.html#whitespace-in-expressions) section of the Solidity Style Guide

*There are 10 instance(s) of this issue:*



```solidity

File: src/UTBExecutor.sol

//@audit remove the whiteSpace before the ')' char
52:             (success, ) = target.call{value: amount}(payload);
53:             if (!success) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L52-L53



```solidity

File: src/UTBExecutor.sol

//@audit remove the whiteSpace before the ')' char
65:             (success, ) = target.call{value: extraNative}(payload);
66:             if (!success) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L65-L66



```solidity

File: src/UTBExecutor.sol

//@audit remove the whiteSpace before the ')' char
70:             (success, ) = target.call(payload);
71:         }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L70-L71



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit remove the whiteSpace before the ',' char
117:         (, , IStargateRouter.lzTxObj memory lzTxObj) = abi.decode(
118:             additionalArgs,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L117-L118



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit remove the whiteSpace before the ')' char
127:         (, LzBridgeData memory lzBridgeData, ) = abi.decode(
128:             additionalArgs,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L127-L128



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit remove the whiteSpace before the ')' char
137:         (, LzBridgeData memory lzBridgeData, ) = abi.decode(
138:             additionalArgs,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L137-L138



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit remove the whiteSpace before the ')' char
147:         (, LzBridgeData memory lzBridgeData, ) = abi.decode(
148:             additionalArgs,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L147-L148



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit remove the whiteSpace before the ',' char
251:             (, , , , callPayload) = abi.decode(
252:                 _payload,


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L251-L252



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

//@audit remove the whiteSpace before the ')' char
33:         (bool success, ) = target.call(callPayload);
34: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L33-L34



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

//@audit remove the whiteSpace before the ')' char
61:         (bool success, ) = target.call{value: amount}(callPayload);
62:         if (!success) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L61-L62

### [N-61]<a name="n-61"></a> A function which defines named returns in it's declaration doesn't need to use return

Remove the return statement once ensuring it is safe to do so

*There are 2 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

100:     function getValue(
101:         bytes calldata additionalArgs,
102:         uint256 amt2Bridge
103:     ) private view returns (uint value) {
104:         (address bridgeToken, LzBridgeData memory lzBridgeData) = abi.decode(
105:             additionalArgs,
106:             (address, LzBridgeData)
107:         );
108:         return
109:             bridgeToken == stargateEth
110:                 ? (lzBridgeData.fee + amt2Bridge)
111:                 : lzBridgeData.fee;
112:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L100-L112



```solidity

File: src/swappers/UniSwapper.sol

79:     function _receiveAndWrapIfNeeded(
80:         SwapParams memory swapParams
81:     ) private returns (SwapParams memory _swapParams) {
82:         if (swapParams.tokenIn != address(0)) {
83:             IERC20(swapParams.tokenIn).transferFrom(
84:                 msg.sender,
85:                 address(this),
86:                 swapParams.amountIn
87:             );
88:             return swapParams;
89:         }
90:         swapParams.tokenIn = wrapped;
91:         IWETH(wrapped).deposit{value: swapParams.amountIn}();
92:         return swapParams;
93:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L79-L93

### [N-62]<a name="n-62"></a> [NatSpec] Natspec `@dev` is missing from `contract`

 

*There are 9 instance(s) of this issue:*



```solidity

File: src/UTB.sol

15: contract UTB is Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L15-L15



```solidity

File: src/UTBExecutor.sol

7: contract UTBExecutor is Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L7-L7



```solidity

File: src/bridge_adapters/BaseAdapter.sol

6: contract BaseAdapter is UTBOwned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L6-L6



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

12: contract DecentBridgeAdapter is BaseAdapter, IBridgeAdapter {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L12-L12



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

17: contract StargateBridgeAdapter is


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L17-L17



```solidity

File: src/swappers/SwapParams.sol

4: library SwapDirection {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L4-L4



```solidity

File: src/swappers/UniSwapper.sol

13: contract UniSwapper is UTBOwned, ISwapper {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L13-L13



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

12: contract DecentEthRouter is IDecentEthRouter, IOFTReceiverV2, Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L12-L12



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

8: contract DecentBridgeExecutor is IDecentBridgeExecutor, Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L8-L8

### [N-63]<a name="n-63"></a> Add inline comments for unnamed variables

`function foo(address x, address)` -> `function foo(address x, address /* y */)`

*There are 2 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit parameters 1,2,3,4,5, need comment
183:     function sgReceive(
184:         uint16, // _srcChainid
185:         bytes memory, // _srcAddress
186:         uint256, // _nonce
187:         address, // _token
188:         uint256, // amountLD
189:         bytes memory payload


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L183-L189



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit parameters 2,3,4, need comment
237:     function onOFTReceived(
238:         uint16 _srcChainId,
239:         bytes calldata,
240:         uint64,
241:         bytes32,
242:         uint _amount,
243:         bytes memory _payload


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L237-L243

### [N-64]<a name="n-64"></a> Contract should expose an `interface`

The `contract`s should expose an `interface` so that other projects can more easily integrate with it, without having to develop their own non-standard variants.

*There are 8 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

34:     function registerRemoteBridgeAdapter(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L34-L34



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

44:     function estimateFees(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L44-L44



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L37



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

45:     function registerRemoteBridgeAdapter(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L45-L45



```solidity

File: src/swappers/UniSwapper.sol

100:     function swapNoPath(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L100-L100



```solidity

File: src/swappers/UniSwapper.sol

123:     function swapExactIn(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L123-L123



```solidity

File: src/swappers/UniSwapper.sol

143:     function swapExactOut(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L143-L143

### [N-65]<a name="n-65"></a> [NatSpec] Natspec `@notice` is missing from `contract`

 

*There are 8 instance(s) of this issue:*



```solidity

File: src/UTB.sol

15: contract UTB is Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L15-L15



```solidity

File: src/UTBExecutor.sol

7: contract UTBExecutor is Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L7-L7



```solidity

File: src/bridge_adapters/BaseAdapter.sol

6: contract BaseAdapter is UTBOwned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L6-L6



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

12: contract DecentBridgeAdapter is BaseAdapter, IBridgeAdapter {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L12-L12



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

17: contract StargateBridgeAdapter is


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L17-L17



```solidity

File: src/swappers/UniSwapper.sol

13: contract UniSwapper is UTBOwned, ISwapper {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L13-L13



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

12: contract DecentEthRouter is IDecentEthRouter, IOFTReceiverV2, Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L12-L12



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

8: contract DecentBridgeExecutor is IDecentBridgeExecutor, Owned {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L8-L8

### [N-66]<a name="n-66"></a> Do not use UNDERSCORE in `struct` elements names

 

*There are 21 instance(s) of this issue:*



```solidity

File: src/UTB.sol

55:         return performSwap(swapInstructions, true);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L55-L55



```solidity

File: src/UTB.sol

117:         _swapAndExecute(
118:             instructions.swapInstructions,
119:             instructions.target,
120:             instructions.paymentOperator,
121:             instructions.payload,
122:             instructions.refund
123:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L117-L123



```solidity

File: src/UTB.sol

273:         return callBridge(amt2Bridge, fees.bridgeFee, updatedInstructions);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L273-L273



```solidity

File: src/UTB.sol

287:         bool native = approveAndCheckIfNative(instructions, amt2Bridge);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L287-L287



```solidity

File: src/UTB.sol

318:         _swapAndExecute(postBridge, target, paymentOperator, payload, refund);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L318-L318



```solidity

File: src/UTBExecutor.sol

28:             execute(target, paymentOperator, payload, token, amount, refund, 0);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L28-L28



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

91:         callBridge(
92:             amt2Bridge,
93:             dstChainId,
94:             bridgePayload,
95:             additionalArgs,
96:             refund
97:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L91-L97



```solidity

File: src/swappers/UniSwapper.sol

119:         _sendToRecipient(receiver, swapParams.tokenOut, amt2Recipient);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L119-L119



```solidity

File: src/swappers/UniSwapper.sol

140:         _sendToRecipient(receiver, swapParams.tokenOut, amountOut);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L140-L140



```solidity

File: src/swappers/UniSwapper.sol

162:         _refundUser(
163:             refundAddress,
164:             swapParams.tokenIn,
165:             params.amountInMaximum - amountIn
166:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L162-L166



```solidity

File: src/swappers/UniSwapper.sol

168:         _sendToRecipient(receiver, swapParams.tokenOut, swapParams.amountOut);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L168-L168



```solidity

File: src/swappers/UniSwapper.sol

69:             return swapNoPath(swapParams, receiver, refund);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L69-L69



```solidity

File: src/swappers/UniSwapper.sol

74:             swapExactOut(swapParams, receiver, refund);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L74-L74



```solidity

File: src/swappers/UniSwapper.sol

108:             _refundUser(
109:                 refund,
110:                 swapParams.tokenIn,
111:                 swapParams.amountIn - swapParams.amountOut
112:             );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L108-L112



```solidity

File: src/swappers/UniSwapper.sol

72:             amountOut = swapExactIn(swapParams, receiver);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L72-L72



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

126:         ) = _getCallParams(
127:                 msgType,
128:                 _toAddress,
129:                 _dstChainId,
130:                 _dstGasForCall,
131:                 deliverEth,
132:                 payload
133:             );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L126-L133



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

161:         ) = _getCallParams(
162:                 msgType,
163:                 _toAddress,
164:                 _dstChainId,
165:                 _dstGasForCall,
166:                 deliverEth,
167:                 additionalPayload
168:             );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L161-L168



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

206:             _bridgeWithPayload(
207:                 MT_ETH_TRANSFER_WITH_PAYLOAD,
208:                 _dstChainId,
209:                 _toAddress,
210:                 _amount,
211:                 _dstGasForCall,
212:                 additionalPayload,
213:                 deliverEth
214:             );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L206-L214



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

225:         _bridgeWithPayload(
226:             MT_ETH_TRANSFER,
227:             _dstChainId,
228:             _toAddress,
229:             _amount,
230:             _dstGasForCall,
231:             bytes(""),
232:             deliverEth
233:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L225-L233



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

80:             _executeEth(from, target, amount, callPayload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L80-L80



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

78:             _executeWeth(from, target, amount, callPayload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L78-L78

### [N-67]<a name="n-67"></a> `private`/`public` function name should start with underscore

According to solidity style guide, Private or Public function name should start with underscore.

*There are 12 instance(s) of this issue:*



```solidity

File: src/UTB.sol

//@audit `performSwap` is not in CamelCase
52:     function performSwap(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L52-L52



```solidity

File: src/UTB.sol

//@audit `performSwap` is not in CamelCase
63:     function performSwap(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L63-L63



```solidity

File: src/UTB.sol

//@audit `swapAndModifyPostBridge` is not in CamelCase
168:     function swapAndModifyPostBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L168-L168



```solidity

File: src/UTB.sol

//@audit `approveAndCheckIfNative` is not in CamelCase
207:     function approveAndCheckIfNative(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L207-L207



```solidity

File: src/UTB.sol

//@audit `callBridge` is not in CamelCase
282:     function callBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L282-L282



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `getValue` is not in CamelCase
100:     function getValue(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L100-L100



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `getLzTxObj` is not in CamelCase
114:     function getLzTxObj(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L114-L114



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `getDstChainId` is not in CamelCase
124:     function getDstChainId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L124-L124



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `getSrcPoolId` is not in CamelCase
134:     function getSrcPoolId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L134-L134



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `getDstPoolId` is not in CamelCase
144:     function getDstPoolId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L144-L144



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `getDestAdapter` is not in CamelCase
154:     function getDestAdapter(uint chainId) private view returns (address dstAddr) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L154-L154



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit `callBridge` is not in CamelCase
163:     function callBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L163-L163

### [N-68]<a name="n-68"></a> [NatSpec] Natspec description is missing from `modifier` declaration

It is recommended that Solidity contracts are fully annotated using NatSpec for all public interfaces (everything in the ABI). It is clearly stated in the Solidity official documentation. In complex projects such as Defi, the interpretation of all functions and their arguments and returns is important for code readability and auditability.[source](https://docs.soliditylang.org/en/v0.8.15/natspec-format.html)

*There are 7 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/BaseAdapter.sol

11:     modifier onlyExecutor() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L11-L11



```solidity

File: src/swappers/UniSwapper.sol

95:     modifier routerIsSet() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L95-L95



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

37:     modifier onlyEthChain() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L37-L37



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

42:     modifier onlyLzApp() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L42-L42



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

50:     modifier onlyIfWeHaveEnoughReserves(uint256 amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L50-L50



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

55:     modifier userDepositing(uint256 amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L55-L55



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

60:     modifier userIsWithdrawing(uint256 amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L60-L60

### [N-69]<a name="n-69"></a> Add inline comments for unnamed parameters

`function func(address a, address)` -> `function func(address a, address /* b */)`

*There are 2 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit parameter number 0 starting from left need inline comment
//@audit parameter number 1 starting from left need inline comment
//@audit parameter number 2 starting from left need inline comment
//@audit parameter number 3 starting from left need inline comment
//@audit parameter number 4 starting from left need inline comment
183:     function sgReceive(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L183-L183



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit parameter number 1 starting from left need inline comment
//@audit parameter number 2 starting from left need inline comment
//@audit parameter number 3 starting from left need inline comment
237:     function onOFTReceived(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L237-L237

### [N-70]<a name="n-70"></a> Use the latest Solidity version for better security

Using the latest solidity version will help avoid old compiler related vulnerabilities

*There are 9 instance(s) of this issue:*



```solidity

File: src/UTB.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L2-L2



```solidity

File: src/UTBExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L2-L2



```solidity

File: src/bridge_adapters/BaseAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L2-L2



```solidity

File: src/swappers/SwapParams.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L2-L2



```solidity

File: src/swappers/UniSwapper.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

2: pragma solidity ^0.8.13;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L2-L2

### [N-71]<a name="n-71"></a> Consider adding formal verification proofs

Consider using formal verification to mathematically prove that your code does what is intended, and does not have any edge cases with unexpected behavior. The solidity compiler itself has this functionality [built in](https://docs.soliditylang.org/en/latest/smtchecker.html#smtchecker-and-formal-verification)

*There are 1 instance(s) of this issue:*



```solidity

File: src/UTB.sol

@audit Should implement invariant tests
1: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L1-L1

### [N-72]<a name="n-72"></a> Missing zero address check in functions with address parameters

Adding a zero address check for each address type parameter can prevent errors.

*There are 8 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/BaseAdapter.sol

//@audit _executor,  are not checked
19:     function setBridgeExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit _bridgeToken,  are not checked
21:     constructor(bool _gasIsEth, address _bridgeToken) BaseAdapter() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L21-L21



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

//@audit decentBridgeAdapter,  are not checked
34:     function registerRemoteBridgeAdapter(
35:         uint256 dstChainId,
36:         uint16 dstLzId,
37:         address decentBridgeAdapter
38:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L34-L38



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit _sgEth,  are not checked
37:     function setStargateEth(address _sgEth) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L37



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit decentBridgeAdapter,  are not checked
45:     function registerRemoteBridgeAdapter(
46:         uint256 dstChainId,
47:         uint16 dstLzId,
48:         address decentBridgeAdapter
49:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L45-L49



```solidity

File: src/swappers/UniSwapper.sol

//@audit _router,  are not checked
20:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L20



```solidity

File: src/swappers/UniSwapper.sol

//@audit _wrapped,  are not checked
24:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L24



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

//@audit _routerAddress,  are not checked
73:     function addDestinationBridge(
74:         uint16 _dstChainId,
75:         address _routerAddress
76:     ) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L73-L76

### [N-73]<a name="n-73"></a> Use a struct to encapsulate multiple function parameters

If a function has too many parameters, replacing them with a struct can improve code readability and maintainability, increase reusability, and reduce the likelihood of errors when passing the parameters.

*There are 17 instance(s) of this issue:*



```solidity

File: src/UTB.sol

134:     function _swapAndExecute(
135:         SwapInstructions memory swapInstructions,
136:         address target,
137:         address paymentOperator,
138:         bytes memory payload,
139:         address payable refund
140:     ) private {
141:         (address tokenOut, uint256 amountOut) = performSwap(swapInstructions);
142:         if (tokenOut == address(0)) {
143:             executor.execute{value: amountOut}(
144:                 target,
145:                 paymentOperator,
146:                 payload,
147:                 tokenOut,
148:                 amountOut,
149:                 refund
150:             );
151:         } else {
152:             IERC20(tokenOut).approve(address(executor), amountOut);
153:             executor.execute(
154:                 target,
155:                 paymentOperator,
156:                 payload,
157:                 tokenOut,
158:                 amountOut,
159:                 refund
160:             );
161:         }
162:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L134-L162



```solidity

File: src/UTB.sol

311:     function receiveFromBridge(
312:         SwapInstructions memory postBridge,
313:         address target,
314:         address paymentOperator,
315:         bytes memory payload,
316:         address payable refund
317:     ) public {
318:         _swapAndExecute(postBridge, target, paymentOperator, payload, refund);
319:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L311-L319



```solidity

File: src/UTBExecutor.sol

19:     function execute(
20:         address target,
21:         address paymentOperator,
22:         bytes memory payload,
23:         address token,
24:         uint amount,
25:         address payable refund
26:     ) public payable onlyOwner {
27:         return
28:             execute(target, paymentOperator, payload, token, amount, refund, 0);
29:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L19-L29



```solidity

File: src/UTBExecutor.sol

41:     function execute(
42:         address target,
43:         address paymentOperator,
44:         bytes memory payload,
45:         address token,
46:         uint amount,
47:         address payable refund,
48:         uint extraNative
49:     ) public onlyOwner {
50:         bool success;
51:         if (token == address(0)) {
52:             (success, ) = target.call{value: amount}(payload);
53:             if (!success) {
54:                 (refund.call{value: amount}(""));
55:             }
56:             return;
57:         }
58: 
59:         uint initBalance = IERC20(token).balanceOf(address(this));
60: 
61:         IERC20(token).transferFrom(msg.sender, address(this), amount);
62:         IERC20(token).approve(paymentOperator, amount);
63: 
64:         if (extraNative > 0) {
65:             (success, ) = target.call{value: extraNative}(payload);
66:             if (!success) {
67:                 (refund.call{value: extraNative}(""));
68:             }
69:         } else {
70:             (success, ) = target.call(payload);
71:         }
72: 
73:         uint remainingBalance = IERC20(token).balanceOf(address(this)) -
74:             initBalance;
75: 
76:         if (remainingBalance == 0) {
77:             return;
78:         }
79: 
80:         IERC20(token).transfer(refund, remainingBalance);
81:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L41-L81



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

44:     function estimateFees(
45:         SwapInstructions memory postBridge,
46:         uint256 dstChainId,
47:         address target,
48:         uint64 dstGas,
49:         bytes memory payload
50:     ) public view returns (uint nativeFee, uint zroFee) {
51:         SwapParams memory swapParams = abi.decode(
52:             postBridge.swapPayload,
53:             (SwapParams)
54:         );
55:         return
56:             router.estimateSendAndCallFee(
57:                 router.MT_ETH_TRANSFER_WITH_PAYLOAD(),
58:                 lzIdLookup[dstChainId],
59:                 target,
60:                 swapParams.amountIn,
61:                 dstGas,
62:                 false,
63:                 payload
64:             );
65:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L44-L65



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

081:     function bridge(
082:         uint256 amt2Bridge,
083:         SwapInstructions memory postBridge,
084:         uint256 dstChainId,
085:         address target,
086:         address paymentOperator,
087:         bytes memory payload,
088:         bytes calldata additionalArgs,
089:         address payable refund
090:     ) public payable onlyUtb returns (bytes memory bridgePayload) {
091:         require(
092:             destinationBridgeAdapter[dstChainId] != address(0),
093:             string.concat("dst chain address not set ")
094:         );
095: 
096:         uint64 dstGas = abi.decode(additionalArgs, (uint64));
097: 
098:         bridgePayload = abi.encodeCall(
099:             this.receiveFromBridge,
100:             (postBridge, target, paymentOperator, payload, refund)
101:         );
102: 
103:         SwapParams memory swapParams = abi.decode(
104:             postBridge.swapPayload,
105:             (SwapParams)
106:         );
107: 
108:         if (!gasIsEth) {
109:             IERC20(bridgeToken).transferFrom(
110:                 msg.sender,
111:                 address(this),
112:                 amt2Bridge
113:             );
114:             IERC20(bridgeToken).approve(address(router), amt2Bridge);
115:         }
116: 
117:         router.bridgeWithPayload{value: msg.value}(
118:             lzIdLookup[dstChainId],
119:             destinationBridgeAdapter[dstChainId],
120:             swapParams.amountIn,
121:             false,
122:             dstGas,
123:             bridgePayload
124:         );
125:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L81-L125



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

127:     function receiveFromBridge(
128:         SwapInstructions memory postBridge,
129:         address target,
130:         address paymentOperator,
131:         bytes memory payload,
132:         address payable refund
133:     ) public onlyExecutor {
134:         SwapParams memory swapParams = abi.decode(
135:             postBridge.swapPayload,
136:             (SwapParams)
137:         );
138: 
139:         IERC20(swapParams.tokenIn).transferFrom(
140:             msg.sender,
141:             address(this),
142:             swapParams.amountIn
143:         );
144: 
145:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);
146: 
147:         IUTB(utb).receiveFromBridge(
148:             postBridge,
149:             target,
150:             paymentOperator,
151:             payload,
152:             refund
153:         );
154:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L127-L154



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

69:     function bridge(
70:         uint256 amt2Bridge,
71:         SwapInstructions memory postBridge,
72:         uint256 dstChainId,
73:         address target,
74:         address paymentOperator,
75:         bytes memory payload,
76:         bytes calldata additionalArgs,
77:         address payable refund
78:     ) public payable onlyUtb returns (bytes memory bridgePayload) {
79:         address bridgeToken = abi.decode(additionalArgs, (address));
80: 
81:         bridgePayload = abi.encode(
82:             postBridge,
83:             target,
84:             paymentOperator,
85:             payload,
86:             refund
87:         );
88:         IERC20(bridgeToken).transferFrom(msg.sender, address(this), amt2Bridge);
89:         IERC20(bridgeToken).approve(address(router), amt2Bridge);
90: 
91:         callBridge(
92:             amt2Bridge,
93:             dstChainId,
94:             bridgePayload,
95:             additionalArgs,
96:             refund
97:         );
98:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L69-L98



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

163:     function callBridge(
164:         uint256 amt2Bridge,
165:         uint256 dstChainId,
166:         bytes memory bridgePayload,
167:         bytes calldata additionalArgs,
168:         address payable refund
169:     ) private {
170:         router.swap{value: msg.value}(
171:             getDstChainId(additionalArgs), //lzBridgeData._dstChainId, // send to LayerZero chainId
172:             getSrcPoolId(additionalArgs), //lzBridgeData._srcPoolId, // source pool id
173:             getDstPoolId(additionalArgs), //lzBridgeData._dstPoolId, // dst pool id
174:             refund, // refund adddress. extra gas (if any) is returned to this address
175:             amt2Bridge, // quantity to swap
176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips
177:             getLzTxObj(additionalArgs), // additional gasLimit increase, airdrop, at address
178:             abi.encodePacked(getDestAdapter(dstChainId)),
179:             bridgePayload // bytes param, if you wish to send additional payload you can abi.encode() them here
180:         );
181:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L163-L181



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

183:     function sgReceive(
184:         uint16, // _srcChainid
185:         bytes memory, // _srcAddress
186:         uint256, // _nonce
187:         address, // _token
188:         uint256, // amountLD
189:         bytes memory payload
190:     ) external override onlyExecutor {
191:         (
192:             SwapInstructions memory postBridge,
193:             address target,
194:             address paymentOperator,
195:             bytes memory utbPayload,
196:             address payable refund
197:         ) = abi.decode(
198:                 payload,
199:                 (SwapInstructions, address, address, bytes, address)
200:             );
201: 
202:         SwapParams memory swapParams = abi.decode(
203:             postBridge.swapPayload,
204:             (SwapParams)
205:         );
206: 
207:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);
208: 
209:         IUTB(utb).receiveFromBridge(
210:             postBridge,
211:             target,
212:             paymentOperator,
213:             utbPayload,
214:             refund
215:         );
216:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L183-L216



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

080:     function _getCallParams(
081:         uint8 msgType,
082:         address _toAddress,
083:         uint16 _dstChainId,
084:         uint64 _dstGasForCall,
085:         bool deliverEth,
086:         bytes memory additionalPayload
087:     )
088:         private
089:         view
090:         returns (
091:             bytes32 destBridge,
092:             bytes memory adapterParams,
093:             bytes memory payload
094:         )
095:     {
096:         uint256 GAS_FOR_RELAY = 100000;
097:         uint256 gasAmount = GAS_FOR_RELAY + _dstGasForCall;
098:         adapterParams = abi.encodePacked(PT_SEND_AND_CALL, gasAmount);
099:         destBridge = bytes32(abi.encode(destinationBridges[_dstChainId]));
100:         if (msgType == MT_ETH_TRANSFER) {
101:             payload = abi.encode(msgType, msg.sender, _toAddress, deliverEth);
102:         } else {
103:             payload = abi.encode(
104:                 msgType,
105:                 msg.sender,
106:                 _toAddress,
107:                 deliverEth,
108:                 additionalPayload
109:             );
110:         }
111:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L80-L111



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

113:     function estimateSendAndCallFee(
114:         uint8 msgType,
115:         uint16 _dstChainId,
116:         address _toAddress,
117:         uint _amount,
118:         uint64 _dstGasForCall,
119:         bool deliverEth,
120:         bytes memory payload
121:     ) public view returns (uint nativeFee, uint zroFee) {
122:         (
123:             bytes32 destinationBridge,
124:             bytes memory adapterParams,
125:             bytes memory _payload
126:         ) = _getCallParams(
127:                 msgType,
128:                 _toAddress,
129:                 _dstChainId,
130:                 _dstGasForCall,
131:                 deliverEth,
132:                 payload
133:             );
134: 
135:         return
136:             dcntEth.estimateSendAndCallFee(
137:                 _dstChainId,
138:                 destinationBridge,
139:                 _amount,
140:                 _payload,
141:                 _dstGasForCall,
142:                 false, // useZero
143:                 adapterParams // Relayer adapter parameters
144:                 // contains packet type (send and call in this case) and gasAmount
145:             );
146:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L113-L146



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

148:     function _bridgeWithPayload(
149:         uint8 msgType,
150:         uint16 _dstChainId,
151:         address _toAddress,
152:         uint _amount,
153:         uint64 _dstGasForCall,
154:         bytes memory additionalPayload,
155:         bool deliverEth
156:     ) internal {
157:         (
158:             bytes32 destinationBridge,
159:             bytes memory adapterParams,
160:             bytes memory payload
161:         ) = _getCallParams(
162:                 msgType,
163:                 _toAddress,
164:                 _dstChainId,
165:                 _dstGasForCall,
166:                 deliverEth,
167:                 additionalPayload
168:             );
169: 
170:         ICommonOFT.LzCallParams memory callParams = ICommonOFT.LzCallParams({
171:             refundAddress: payable(msg.sender),
172:             zroPaymentAddress: address(0x0),
173:             adapterParams: adapterParams
174:         });
175: 
176:         uint gasValue;
177:         if (gasCurrencyIsEth) {
178:             weth.deposit{value: _amount}();
179:             gasValue = msg.value - _amount;
180:         } else {
181:             weth.transferFrom(msg.sender, address(this), _amount);
182:             gasValue = msg.value;
183:         }
184: 
185:         dcntEth.sendAndCall{value: gasValue}(
186:             address(this), // from address that has dcntEth (so DecentRouter)
187:             _dstChainId,
188:             destinationBridge, // toAddress
189:             _amount, // amount
190:             payload, //payload (will have recipients address)
191:             _dstGasForCall, // dstGasForCall
192:             callParams // refundAddress, zroPaymentAddress, adapterParams
193:         );
194:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L148-L194



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

197:     function bridgeWithPayload(
198:         uint16 _dstChainId,
199:         address _toAddress,
200:         uint _amount,
201:         bool deliverEth,
202:         uint64 _dstGasForCall,
203:         bytes memory additionalPayload
204:     ) public payable {
205:         return
206:             _bridgeWithPayload(
207:                 MT_ETH_TRANSFER_WITH_PAYLOAD,
208:                 _dstChainId,
209:                 _toAddress,
210:                 _amount,
211:                 _dstGasForCall,
212:                 additionalPayload,
213:                 deliverEth
214:             );
215:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L197-L215



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

218:     function bridge(
219:         uint16 _dstChainId,
220:         address _toAddress,
221:         uint _amount,
222:         uint64 _dstGasForCall,
223:         bool deliverEth // if false, delivers WETH
224:     ) public payable {
225:         _bridgeWithPayload(
226:             MT_ETH_TRANSFER,
227:             _dstChainId,
228:             _toAddress,
229:             _amount,
230:             _dstGasForCall,
231:             bytes(""),
232:             deliverEth
233:         );
234:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L218-L234



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

237:     function onOFTReceived(
238:         uint16 _srcChainId,
239:         bytes calldata,
240:         uint64,
241:         bytes32,
242:         uint _amount,
243:         bytes memory _payload
244:     ) external override onlyLzApp {
245:         (uint8 msgType, address _from, address _to, bool deliverEth) = abi
246:             .decode(_payload, (uint8, address, address, bool));
247: 
248:         bytes memory callPayload = "";
249: 
250:         if (msgType == MT_ETH_TRANSFER_WITH_PAYLOAD) {
251:             (, , , , callPayload) = abi.decode(
252:                 _payload,
253:                 (uint8, address, address, bool, bytes)
254:             );
255:         }
256: 
257:         emit ReceivedDecentEth(
258:             msgType,
259:             _srcChainId,
260:             _from,
261:             _to,
262:             _amount,
263:             callPayload
264:         );
265: 
266:         if (weth.balanceOf(address(this)) < _amount) {
267:             dcntEth.transfer(_to, _amount);
268:             return;
269:         }
270: 
271:         if (msgType == MT_ETH_TRANSFER) {
272:             if (!gasCurrencyIsEth || !deliverEth) {
273:                 weth.transfer(_to, _amount);
274:             } else {
275:                 weth.withdraw(_amount);
276:                 payable(_to).transfer(_amount);
277:             }
278:         } else {
279:             weth.approve(address(executor), _amount);
280:             executor.execute(_from, _to, deliverEth, _amount, callPayload);
281:         }
282:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L237-L282



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

68:     function execute(
69:         address from,
70:         address target,
71:         bool deliverEth,
72:         uint256 amount,
73:         bytes memory callPayload
74:     ) public onlyOwner {
75:         weth.transferFrom(msg.sender, address(this), amount);
76: 
77:         if (!gasCurrencyIsEth || !deliverEth) {
78:             _executeWeth(from, target, amount, callPayload);
79:         } else {
80:             _executeEth(from, target, amount, callPayload);
81:         }
82:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L68-L82

### [N-74]<a name="n-74"></a> [NatSpec] Natspec `@notice` is missing from `function`

 

*There are 68 instance(s) of this issue:*



```solidity

File: src/UTB.sol

24:     /**
25:      * @dev Sets the executor.
26:      * @param _executor The address of the executor.
27:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L24-L27



```solidity

File: src/UTB.sol

32:     /**
33:      * @dev Sets the wrapped native token.
34:      * @param _wrapped The address of the wrapped token.
35:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L32-L35



```solidity

File: src/UTB.sol

40:     /**
41:      * @dev Sets the fee collector.
42:      * @param _feeCollector The address of the fee collector.
43:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L40-L43



```solidity

File: src/UTB.sol

48:     /**
49:      * @dev Performs a swap with a default setting to retrieve ERC20.
50:      * @param swapInstructions The swapper ID and calldata to execute a swap.
51:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L48-L51



```solidity

File: src/UTB.sol

58:     /**
59:      * @dev Performs a swap with the requested swapper and swap calldata.
60:      * @param swapInstructions The swapper ID and calldata to execute a swap.
61:      * @param retrieveTokenIn Flag indicating whether to transfer ERC20 for the swap.
62:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L58-L62



```solidity

File: src/UTB.sol

102:     /**
103:      * @dev Swaps currency from the incoming to the outgoing token and executes a transaction with payment.
104:      * @param instructions The token swap data and payment transaction payload.
105:      * @param fees The bridge fee in native, as well as utb fee token and amount.
106:      * @param signature The ECDSA signature to verify the fee structure.
107:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L102-L107



```solidity

File: src/UTB.sol

126:     /**
127:      * @dev Swaps currency from the incoming to the outgoing token and executes a transaction with payment.
128:      * @param swapInstructions The swapper ID and calldata to execute a swap.
129:      * @param target The address of the target contract for the payment transaction.
130:      * @param paymentOperator The operator address for payment transfers requiring ERC20 approvals.
131:      * @param payload The calldata to execute the payment transaction.
132:      * @param refund The account receiving any refunds, typically the EOA which initiated the transaction.
133:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L126-L133



```solidity

File: src/UTB.sol

164:     /**
165:      * @dev Performs the pre bridge swap and modifies the post bridge swap to utilize the bridged amount.
166:      * @param instructions The bridge data, token swap data, and payment transaction payload.
167:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L164-L167



```solidity

File: src/UTB.sol

202:     /**
203:      * @dev Checks if the bridge token is native, and approves the bridge adapter to transfer ERC20 if required.
204:      * @param instructions The bridge data, token swap data, and payment transaction payload.
205:      * @param amt2Bridge The amount of the bridge token being transferred to the bridge adapter.
206:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L202-L206



```solidity

File: src/UTB.sol

253:     /**
254:      * @dev Bridges funds in native or ERC20 and a payment transaction payload to the destination chain
255:      * @param instructions The bridge data, token swap data, and payment transaction payload.
256:      * @param fees The bridge fee in native, as well as utb fee token and amount.
257:      * @param signature The ECDSA signature to verify the fee structure.
258:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L253-L258



```solidity

File: src/UTB.sol

276:     /**
277:      * @dev Calls the bridge adapter to bridge funds, and approves the bridge adapter to transfer ERC20 if required.
278:      * @param amt2Bridge The amount of the bridge token being bridged via the bridge adapter.
279:      * @param bridgeFee The fee being transferred to the bridge adapter and finally to the bridge.
280:      * @param instructions The bridge data, token swap data, and payment transaction payload.
281:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L276-L281



```solidity

File: src/UTB.sol

303:     /**
304:      * @dev Receives funds from the bridge adapter, executes a swap, and executes a payment transaction.
305:      * @param postBridge The swapper ID and calldata to execute a swap.
306:      * @param target The address of the target contract for the payment transaction.
307:      * @param paymentOperator The operator address for payment transfers requiring ERC20 approvals.
308:      * @param payload The calldata to execute the payment transaction.
309:      * @param refund The account receiving any refunds, typically the EOA which initiated the transaction.
310:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L303-L310



```solidity

File: src/UTB.sol

321:     /**
322:      * @dev Registers and maps a swapper to a swapper ID.
323:      * @param swapper The address of the swapper.
324:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L321-L324



```solidity

File: src/UTB.sol

330:     /**
331:      * @dev Registers and maps a bridge adapter to a bridge adapter ID.
332:      * @param bridge The address of the bridge adapter.
333:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L330-L333



```solidity

File: src/UTBExecutor.sol

10:     /**
11:      * @dev Executes a payment transaction with native OR ERC20.
12:      * @param target The address of the target contract for the payment transaction.
13:      * @param paymentOperator The operator address for payment transfers requiring ERC20 approvals.
14:      * @param payload The calldata to execute the payment transaction.
15:      * @param token The token being transferred, zero address for native.
16:      * @param amount The amount of native or ERC20 being sent with the payment transaction.
17:      * @param refund The account receiving any refunds, typically the EOA that initiated the transaction.
18:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L10-L18



```solidity

File: src/UTBExecutor.sol

31:     /**
32:      * @dev Executes a payment transaction with native AND/OR ERC20.
33:      * @param target The address of the target contract for the payment transaction.
34:      * @param paymentOperator The operator address for payment transfers requiring ERC20 approvals.
35:      * @param payload The calldata to execute the payment transaction.
36:      * @param token The token being transferred, zero address for native.
37:      * @param amount The amount of native or ERC20 being sent with the payment transaction.
38:      * @param refund The account receiving any refunds, typically the EOA that initiated the transaction.
39:      * @param extraNative Forwards additional gas or native fees required to executing the payment transaction.
40:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L31-L40



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

26:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

30:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L30-L30



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

34:     function registerRemoteBridgeAdapter(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L34-L34



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

44:     function estimateFees(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L44-L44



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

67:     function getBridgeToken(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L67-L67



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

73:     function getBridgedAmount(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L73-L73



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

81:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L81-L81



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

127:     function receiveFromBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L127-L127



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

33:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L33-L33



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L37



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

41:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L41-L41



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

45:     function registerRemoteBridgeAdapter(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L45-L45



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

55:     function getBridgeToken(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L55-L55



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

61:     function getBridgedAmount(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L61-L61



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

69:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L69-L69



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

100:     function getValue(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L100-L100



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

114:     function getLzTxObj(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L114-L114



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

124:     function getDstChainId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L124-L124



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

134:     function getSrcPoolId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L134-L134



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

144:     function getDstPoolId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L144-L144



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

154:     function getDestAdapter(uint chainId) private view returns (address dstAddr) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L154-L154



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

163:     function callBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L163-L163



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

183:     function sgReceive(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L183-L183



```solidity

File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L20



```solidity

File: src/swappers/UniSwapper.sol

24:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L24



```solidity

File: src/swappers/UniSwapper.sol

28:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L28-L28



```solidity

File: src/swappers/UniSwapper.sol

32:     function updateSwapParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L32-L32



```solidity

File: src/swappers/UniSwapper.sol

43:     function _refundUser(address user, address token, uint amount) private {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L43-L43



```solidity

File: src/swappers/UniSwapper.sol

47:     function _sendToRecipient(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L47-L47



```solidity

File: src/swappers/UniSwapper.sol

58:     function swap(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L58-L58



```solidity

File: src/swappers/UniSwapper.sol

79:     function _receiveAndWrapIfNeeded(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L79-L79



```solidity

File: src/swappers/UniSwapper.sol

100:     function swapNoPath(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L100-L100



```solidity

File: src/swappers/UniSwapper.sol

123:     function swapExactIn(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L123-L123



```solidity

File: src/swappers/UniSwapper.sol

143:     function swapExactOut(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L143-L143



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

67:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L67-L67



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

72:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L72-L72



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

80:     function _getCallParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L80-L80



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

113:     function estimateSendAndCallFee(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L113-L113



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

148:     function _bridgeWithPayload(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L148-L148



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

196:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L196-L196



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

217:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L217-L217



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

236:     /// @inheritdoc IOFTReceiverV2


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L236-L236



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

284:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L284-L284



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

293:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L293-L293



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

301:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L301-L301



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

312:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L312-L312



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

321:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L321-L321



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

329:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L329-L329



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

17:     /**
18:      * @dev helper function for execute
19:      * @param from caller of the function
20:      * @param target target contract
21:      * @param amount amount of the in eth
22:      * @param callPayload payload for the tx
23:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L17-L23



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

47:     /**
48:      * @dev helper function for execute
49:      * @param from caller of the function
50:      * @param target target contract
51:      * @param amount amount of the transaction
52:      * @param callPayload payload for the tx
53:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L47-L53



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

67:     /// @inheritdoc IDecentBridgeExecutor


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L67-L67

### [N-75]<a name="n-75"></a> [NatSpec] Natspec `@dev` is missing from `function`

 

*There are 50 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

26:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

30:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L30-L30



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

34:     function registerRemoteBridgeAdapter(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L34-L34



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

44:     function estimateFees(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L44-L44



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

67:     function getBridgeToken(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L67-L67



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

73:     function getBridgedAmount(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L73-L73



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

81:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L81-L81



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

127:     function receiveFromBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L127-L127



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

33:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L33-L33



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L37



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

41:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L41-L41



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

45:     function registerRemoteBridgeAdapter(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L45-L45



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

55:     function getBridgeToken(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L55-L55



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

61:     function getBridgedAmount(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L61-L61



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

69:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L69-L69



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

100:     function getValue(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L100-L100



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

114:     function getLzTxObj(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L114-L114



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

124:     function getDstChainId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L124-L124



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

134:     function getSrcPoolId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L134-L134



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

144:     function getDstPoolId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L144-L144



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

154:     function getDestAdapter(uint chainId) private view returns (address dstAddr) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L154-L154



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

163:     function callBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L163-L163



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

183:     function sgReceive(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L183-L183



```solidity

File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L20



```solidity

File: src/swappers/UniSwapper.sol

24:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L24



```solidity

File: src/swappers/UniSwapper.sol

28:     function getId() public pure returns (uint8) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L28-L28



```solidity

File: src/swappers/UniSwapper.sol

32:     function updateSwapParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L32-L32



```solidity

File: src/swappers/UniSwapper.sol

43:     function _refundUser(address user, address token, uint amount) private {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L43-L43



```solidity

File: src/swappers/UniSwapper.sol

47:     function _sendToRecipient(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L47-L47



```solidity

File: src/swappers/UniSwapper.sol

58:     function swap(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L58-L58



```solidity

File: src/swappers/UniSwapper.sol

79:     function _receiveAndWrapIfNeeded(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L79-L79



```solidity

File: src/swappers/UniSwapper.sol

100:     function swapNoPath(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L100-L100



```solidity

File: src/swappers/UniSwapper.sol

123:     function swapExactIn(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L123-L123



```solidity

File: src/swappers/UniSwapper.sol

143:     function swapExactOut(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L143-L143



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

67:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L67-L67



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

72:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L72-L72



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

80:     function _getCallParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L80-L80



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

113:     function estimateSendAndCallFee(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L113-L113



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

148:     function _bridgeWithPayload(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L148-L148



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

196:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L196-L196



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

217:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L217-L217



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

236:     /// @inheritdoc IOFTReceiverV2


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L236-L236



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

284:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L284-L284



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

293:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L293-L293



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

301:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L301-L301



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

312:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L312-L312



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

321:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L321-L321



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

329:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L329-L329



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

67:     /// @inheritdoc IDecentBridgeExecutor


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L67-L67

### [N-76]<a name="n-76"></a> Missing NatSpec `@dev` from `modifier` declaration

 

*There are 7 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/BaseAdapter.sol

11:     modifier onlyExecutor() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L11-L11



```solidity

File: src/swappers/UniSwapper.sol

95:     modifier routerIsSet() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L95-L95



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

37:     modifier onlyEthChain() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L37-L37



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

42:     modifier onlyLzApp() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L42-L42



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

50:     modifier onlyIfWeHaveEnoughReserves(uint256 amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L50-L50



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

55:     modifier userDepositing(uint256 amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L55-L55



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

60:     modifier userIsWithdrawing(uint256 amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L60-L60

### [N-77]<a name="n-77"></a> [NatSpec] Natspec `@notice` is missing from `modifier`

 

*There are 8 instance(s) of this issue:*



```solidity

File: src/UTB.sol

222:     /**
223:      * @dev Transfers fees from the sender to UTB, and finally to the Fee Collector.
224:      * @param fees The bridge fee in native, as well as utb fee token and amount.
225:      * @param packedInfo The fees and swap instructions which were used to generate the signature.
226:      * @param signature The ECDSA signature to verify the fee structure.
227:      */


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L222-L227



```solidity

File: src/bridge_adapters/BaseAdapter.sol

11:     modifier onlyExecutor() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L11-L11



```solidity

File: src/swappers/UniSwapper.sol

95:     modifier routerIsSet() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L95-L95



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

37:     modifier onlyEthChain() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L37-L37



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

42:     modifier onlyLzApp() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L42-L42



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

50:     modifier onlyIfWeHaveEnoughReserves(uint256 amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L50-L50



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

55:     modifier userDepositing(uint256 amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L55-L55



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

60:     modifier userIsWithdrawing(uint256 amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L60-L60

### [N-78]<a name="n-78"></a> Use custom errors rather than `revert()`/`require()` strings for better readability

Custom errors are available from solidity version 0.8.4. Custom errors are more easily processed in try-catch blocks, and are easier to re-use and maintain.

*There are 7 instance(s) of this issue:*



```solidity

File: src/UTB.sol

75:             require(msg.value >= swapParams.amountIn, "not enough native");


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L75-L75



```solidity

File: src/bridge_adapters/BaseAdapter.sol

12:         require(
13:             msg.sender == address(bridgeExecutor),
14:             "Only bridge executor can call this"
15:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L12-L15



```solidity

File: src/swappers/UniSwapper.sol

96:         require(uniswap_router != address(0), "router not set");


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L96-L96



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

38:         require(gasCurrencyIsEth, "Gas currency is not ETH");


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L38-L38



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

43:         require(
44:             address(dcntEth) == msg.sender,
45:             "DecentEthRouter: only lz App can call"
46:         );


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L43-L46



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

51:         require(weth.balanceOf(address(this)) > amount, "not enough reserves");


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L51-L51



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

62:         require(balance >= amount, "not enough balance");


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L62-L62

### [N-79]<a name="n-79"></a> Use `@inheritdoc` for overridden functions

 

*There are 1 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

183:     function sgReceive(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L183-L183

### [N-80]<a name="n-80"></a> constructor should emit an event

Use events to signal significant changes to off-chain monitoring tools.

*There are 8 instance(s) of this issue:*



```solidity

File: src/UTB.sol

16:     constructor() Owned(msg.sender) {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L16-L16



```solidity

File: src/UTBExecutor.sol

8:     constructor() Owned(msg.sender) {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L8-L8



```solidity

File: src/bridge_adapters/BaseAdapter.sol

9:     constructor() UTBOwned() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L9-L9



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

21:     constructor(bool _gasIsEth, address _bridgeToken) BaseAdapter() {
22:         gasIsEth = _gasIsEth;
23:         bridgeToken = _bridgeToken;
24:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L21-L24



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

29:     constructor() BaseAdapter() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L29-L29



```solidity

File: src/swappers/UniSwapper.sol

14:     constructor() UTBOwned() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L14-L14



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

27:     constructor(
28:         address payable _wethAddress,
29:         bool gasIsEth,
30:         address _executor
31:     ) Owned(msg.sender) {
32:         weth = IWETH(_wethAddress);
33:         gasCurrencyIsEth = gasIsEth;
34:         executor = IDecentBridgeExecutor(payable(_executor));
35:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L27-L35



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

12:     constructor(address _weth, bool gasIsEth) Owned(msg.sender) {
13:         weth = IWETH(payable(_weth));
14:         gasCurrencyIsEth = gasIsEth;
15:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L12-L15

### [N-81]<a name="n-81"></a> Complex functions should include comments

Large and/or complex functions should include comments to make them easier to understand and reduce margin for error.

*There are 11 instance(s) of this issue:*



```solidity

File: src/UTB.sol

63:     function performSwap(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L63-L63



```solidity

File: src/UTB.sol

134:     function _swapAndExecute(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L134-L134



```solidity

File: src/UTB.sol

168:     function swapAndModifyPostBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L168-L168



```solidity

File: src/UTBExecutor.sol

41:     function execute(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L41-L41



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

44:     function estimateFees(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L44-L44



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

81:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L81-L81



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

127:     function receiveFromBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L127-L127



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

69:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L69-L69



```solidity

File: src/swappers/UniSwapper.sol

100:     function swapNoPath(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L100-L100



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

80:     function _getCallParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L80-L80



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

237:     function onOFTReceived(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L237-L237

### [N-82]<a name="n-82"></a> Use a `struct` instead of returning multiple values

Functions that return many variables can become difficult to read and maintain. Using a struct to encapsulate these return values can improve code readability, increase reusability, and reduce the likelihood of errors. Consider refactoring functions that return more than three variables to use a struct instead.

*There are 1 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

80:     function _getCallParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L80-L80

### [N-83]<a name="n-83"></a> Make use of Solidiy's `using` keyword

The directive `using A for B` can be used to attach functions (`A`) as operators to user-defined value types or as member functions to any type (`B`). The member functions receive the object they are called on as their first parameter (like the `self` variable in Python). The operator functions receive operands as parameters.  Doing so improves readability, makes debugging easier, and promotes modularity and reusability in the code.

*There are 3 instance(s) of this issue:*



```solidity

File: src/swappers/UniSwapper.sol

129:         IV3SwapRouter.ExactInputParams memory params = IV3SwapRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L129-L129



```solidity

File: src/swappers/UniSwapper.sol

149:         IV3SwapRouter.ExactOutputParams memory params = IV3SwapRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L149-L149



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

170:         ICommonOFT.LzCallParams memory callParams = ICommonOFT.LzCallParams({


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L170-L170

### [N-84]<a name="n-84"></a> [Solidity]: Bug in Legacy Code Generation When Accessing the .selector Member on Expressions with Side Effects

This version of solidity is vulnerable to a bug in the legacy code generation pipeline of the Solidity compiler that was found during investigation of a security report On June 26, 2023. For more details check the following [link](https://soliditylang.org/blog/2023/07/19/missing-side-effects-on-selector-access-bug/)

*There are 9 instance(s) of this issue:*



```solidity

File: src/UTB.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L2-L2



```solidity

File: src/UTBExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L2-L2



```solidity

File: src/bridge_adapters/BaseAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L2-L2



```solidity

File: src/swappers/SwapParams.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L2-L2



```solidity

File: src/swappers/UniSwapper.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

2: pragma solidity ^0.8.13;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L2-L2

### [N-85]<a name="n-85"></a> [Solidity]: All `verbatim` blocks are considered identical by deduplicator and can incorrectly be unified

The block deduplicator is a step of the opcode-based optimizer which identifies equivalent assembly blocks and merges them into a single one. However, when blocks contained `verbatim`, their comparison was performed incorrectly, leading to the collapse of assembly blocks which are identical except for the contents of the ``verbatim`` items. Since `verbatim` is only available in Yul, compilation of Solidity sources is not affected. For more details check the following [link](https://blog.soliditylang.org/2023/11/08/verbatim-invalid-deduplication-bug/)

*There are 1 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

2: pragma solidity ^0.8.13;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L2-L2

### [N-86]<a name="n-86"></a> [NatSpec] Natspec `@author` is missing from `library`

 

*There are 1 instance(s) of this issue:*



```solidity

File: src/swappers/SwapParams.sol

4: library SwapDirection {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L4-L4

### [N-87]<a name="n-87"></a> [NatSpec] Natspec `@dev` is missing from `library`

 

*There are 1 instance(s) of this issue:*



```solidity

File: src/swappers/SwapParams.sol

4: library SwapDirection {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L4-L4

### [N-88]<a name="n-88"></a> [NatSpec] Natspec `@notice` is missing from `library`

 

*There are 1 instance(s) of this issue:*



```solidity

File: src/swappers/SwapParams.sol

4: library SwapDirection {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L4-L4

### [N-89]<a name="n-89"></a> [NatSpec] Natspec `@title` is missing from `library`

 

*There are 1 instance(s) of this issue:*



```solidity

File: src/swappers/SwapParams.sol

4: library SwapDirection {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L4-L4

### [N-90]<a name="n-90"></a> [NatSpec] Natspec `@dev` is missing from `constractor`

 

*There are 8 instance(s) of this issue:*



```solidity

File: src/UTB.sol

16:     constructor() Owned(msg.sender) {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L16-L16



```solidity

File: src/UTBExecutor.sol

8:     constructor() Owned(msg.sender) {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L8-L8



```solidity

File: src/bridge_adapters/BaseAdapter.sol

9:     constructor() UTBOwned() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L9-L9



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

21:     constructor(bool _gasIsEth, address _bridgeToken) BaseAdapter() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L21-L21



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

29:     constructor() BaseAdapter() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L29-L29



```solidity

File: src/swappers/UniSwapper.sol

14:     constructor() UTBOwned() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L14-L14



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

27:     constructor(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L27-L27



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

12:     constructor(address _weth, bool gasIsEth) Owned(msg.sender) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L12-L12

### [N-91]<a name="n-91"></a> [NatSpec] Natspec `@notice` is missing from `constractor`

 

*There are 8 instance(s) of this issue:*



```solidity

File: src/UTB.sol

16:     constructor() Owned(msg.sender) {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L16-L16



```solidity

File: src/UTBExecutor.sol

8:     constructor() Owned(msg.sender) {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L8-L8



```solidity

File: src/bridge_adapters/BaseAdapter.sol

9:     constructor() UTBOwned() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L9-L9



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

21:     constructor(bool _gasIsEth, address _bridgeToken) BaseAdapter() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L21-L21



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

29:     constructor() BaseAdapter() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L29-L29



```solidity

File: src/swappers/UniSwapper.sol

14:     constructor() UTBOwned() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L14-L14



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

27:     constructor(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L27-L27



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

12:     constructor(address _weth, bool gasIsEth) Owned(msg.sender) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L12-L12

### [N-92]<a name="n-92"></a> [NatSpec] Natspec `@param` is missing from `constractor`

 

*There are 3 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

21:     constructor(bool _gasIsEth, address _bridgeToken) BaseAdapter() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L21-L21



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

27:     constructor(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L27-L27



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

12:     constructor(address _weth, bool gasIsEth) Owned(msg.sender) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L12-L12

### [N-93]<a name="n-93"></a> [NatSpec] Natspec `@dev` is missing from `receive` function

 

*There are 6 instance(s) of this issue:*



```solidity

File: src/UTB.sol

339:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L339-L339



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

156:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L156-L156



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

218:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L218-L218



```solidity

File: src/swappers/UniSwapper.sol

171:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L171-L171



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

337:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L337-L337



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

85:     receive() external payable {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L85-L85

### [N-94]<a name="n-94"></a> [NatSpec] Natspec `@notice` is missing from `constractor`

 

*There are 8 instance(s) of this issue:*



```solidity

File: src/UTB.sol

16:     constructor() Owned(msg.sender) {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L16-L16



```solidity

File: src/UTBExecutor.sol

8:     constructor() Owned(msg.sender) {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L8-L8



```solidity

File: src/bridge_adapters/BaseAdapter.sol

9:     constructor() UTBOwned() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L9-L9



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

21:     constructor(bool _gasIsEth, address _bridgeToken) BaseAdapter() {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L21-L21



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

29:     constructor() BaseAdapter() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L29-L29



```solidity

File: src/swappers/UniSwapper.sol

14:     constructor() UTBOwned() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L14-L14



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

27:     constructor(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L27-L27



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

12:     constructor(address _weth, bool gasIsEth) Owned(msg.sender) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L12-L12

### [N-95]<a name="n-95"></a> [NatSpec] Natspec `@dev` is missing from `struct`

 

*There are 1 instance(s) of this issue:*



```solidity

File: src/swappers/SwapParams.sol

9: struct SwapParams {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L9-L9

### [N-96]<a name="n-96"></a> [NatSpec] Natspec `@notice` is missing from `struct`

 

*There are 1 instance(s) of this issue:*



```solidity

File: src/swappers/SwapParams.sol

9: struct SwapParams {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L9-L9

### [N-97]<a name="n-97"></a> [NatSpec] Natspec `@param` is missing from `struct`

 

*There are 1 instance(s) of this issue:*



```solidity

File: src/swappers/SwapParams.sol

9: struct SwapParams {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L9-L9

### [N-98]<a name="n-98"></a> [NatSpec] Natspec `@param` is missing from `modifier`

 

*There are 3 instance(s) of this issue:*



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

50:     modifier onlyIfWeHaveEnoughReserves(uint256 amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L50-L50



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

55:     modifier userDepositing(uint256 amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L55-L55



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

60:     modifier userIsWithdrawing(uint256 amount) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L60-L60

### [N-99]<a name="n-99"></a> [NatSpec] Natspec `@param` is missing from `function`

 

*There are 46 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L19-L19



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

26:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L26-L26



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

34:     function registerRemoteBridgeAdapter(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L34-L34



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

44:     function estimateFees(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L44-L44



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

67:     function getBridgeToken(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L67-L67



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

73:     function getBridgedAmount(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L73-L73



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

81:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L81-L81



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

127:     function receiveFromBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L127-L127



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

33:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L33-L33



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

37:     function setStargateEth(address _sgEth) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L37-L37



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

45:     function registerRemoteBridgeAdapter(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L45-L45



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

55:     function getBridgeToken(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L55-L55



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

61:     function getBridgedAmount(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L61-L61



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

69:     function bridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L69-L69



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

100:     function getValue(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L100-L100



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

114:     function getLzTxObj(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L114-L114



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

124:     function getDstChainId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L124-L124



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

134:     function getSrcPoolId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L134-L134



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

144:     function getDstPoolId(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L144-L144



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

154:     function getDestAdapter(uint chainId) private view returns (address dstAddr) {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L154-L154



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

163:     function callBridge(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L163-L163



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

183:     function sgReceive(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L183-L183



```solidity

File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L20-L20



```solidity

File: src/swappers/UniSwapper.sol

24:     function setWrapped(address payable _wrapped) public onlyOwner {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L24-L24



```solidity

File: src/swappers/UniSwapper.sol

32:     function updateSwapParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L32-L32



```solidity

File: src/swappers/UniSwapper.sol

43:     function _refundUser(address user, address token, uint amount) private {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L43-L43



```solidity

File: src/swappers/UniSwapper.sol

47:     function _sendToRecipient(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L47-L47



```solidity

File: src/swappers/UniSwapper.sol

58:     function swap(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L58-L58



```solidity

File: src/swappers/UniSwapper.sol

79:     function _receiveAndWrapIfNeeded(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L79-L79



```solidity

File: src/swappers/UniSwapper.sol

100:     function swapNoPath(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L100-L100



```solidity

File: src/swappers/UniSwapper.sol

123:     function swapExactIn(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L123-L123



```solidity

File: src/swappers/UniSwapper.sol

143:     function swapExactOut(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L143-L143



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

67:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L67-L67



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

72:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L72-L72



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

80:     function _getCallParams(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L80-L80



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

113:     function estimateSendAndCallFee(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L113-L113



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

148:     function _bridgeWithPayload(


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L148-L148



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

196:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L196-L196



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

217:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L217-L217



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

236:     /// @inheritdoc IOFTReceiverV2


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L236-L236



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

284:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L284-L284



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

293:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L293-L293



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

312:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L312-L312



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

321:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L321-L321



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

329:     /// @inheritdoc IDecentEthRouter


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L329-L329



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

67:     /// @inheritdoc IDecentBridgeExecutor


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L67-L67

### [N-100]<a name="n-100"></a> Not using the latest version of `prb-math` from dependencies

`prb-math` is an important mathematical library The package.json configuration file says that the project is using an old version of `prb-math`.

*There are 1 instance(s) of this issue:*



```solidity

File: /home/oualid/c4/competitions/2024-01-decent/package.json

//@audit `prb-math` version is 
1: 


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main///home/oualid/c4/competitions/2024-01-decent/package.json#L1-L1

### [N-101]<a name="n-101"></a> Establishing Best Practices for Initial Version in package.json

Starting with 0.1.0 or 1.0.0 in package.json adheres to Semantic Versioning (SemVer) standards, implying a more stable and significant release. Initial versions like 0.0.1 or 0.0.0 suggest extreme infancy or instability, which might not accurately reflect the software's development stage, potentially misleading users or contributors about its readiness.

*There are 1 instance(s) of this issue:*



```solidity

File: package.json

//@audit package.json version is 0.0.0
1: {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//package.json#L1-L1

### [N-102]<a name="n-102"></a> Enforcing Lowercase and Underscores Only in the `name` Field of package.json

package.json name variable should only consist of lowercase letters and underscores

*There are 1 instance(s) of this issue:*



```solidity

File: package.json

//@audit package.json name is @decent.xyz/utb
1: {


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//package.json#L1-L1

### [N-103]<a name="n-103"></a> Non constant/immutable state variables are missing a setter post deployment

Non-constant or non-immutable state variables lacking a setter function can create inflexibility in contract operations. If there's no way to update these variables post-deployment, the contract might not adapt to changing conditions or requirements, which can be a significant drawback, especially in upgradable or long-lived contracts. To resolve this, implement setter functions guarded by appropriate access controls, like `onlyOwner` or similar modifiers, so that these variables can be updated as required while maintaining security. This enables smoother contract maintenance and feature upgrades.

*There are 5 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

19:     address bridgeToken;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L19-L19



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

13:     IWETH public weth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L13-L13



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

15:     IDecentBridgeExecutor public executor;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L15-L15



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

25:     mapping(address => uint256) public balanceOf;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L25-L25



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

9:     IWETH weth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L9-L9

### [N-104]<a name="n-104"></a> [NatSpec] Empty constructor body without NatSpec comments

 

*There are 5 instance(s) of this issue:*



```solidity

File: src/UTB.sol

16:     constructor() Owned(msg.sender) {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L16-L16



```solidity

File: src/UTBExecutor.sol

8:     constructor() Owned(msg.sender) {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L8-L8



```solidity

File: src/bridge_adapters/BaseAdapter.sol

9:     constructor() UTBOwned() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L9-L9



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

29:     constructor() BaseAdapter() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L29-L29



```solidity

File: src/swappers/UniSwapper.sol

14:     constructor() UTBOwned() {}


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L14-L14

### [N-105]<a name="n-105"></a> Using Low-Level Call for Transfers

Utilizing low-level calls like `.call{value: value}` for Ether transfers in Ethereum can be risky, as it can inadvertently allow malicious contract executions through fallback functions. To mitigate these risks and ensure safer Ether transfers, it is recommended to adopt more secure and explicit methods provided by reputable libraries such as OpenZeppelin. Functions like `Address.sendValue()` from OpenZeppelin provide a clearer and safer alternative for sending Ether, as they encapsulate necessary checks and error handling, ensuring that Ether is transferred securely and any errors are appropriately dealt with. This not only enhances the security of your smart contract but also improves code readability and maintainability, aligning with modern Solidity development practices.

*There are 5 instance(s) of this issue:*



```solidity

File: src/UTBExecutor.sol

52:             (success, ) = target.call{value: amount}(payload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L52-L52



```solidity

File: src/UTBExecutor.sol

65:             (success, ) = target.call{value: extraNative}(payload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L65-L65



```solidity

File: src/UTBExecutor.sol

54:                 (refund.call{value: amount}(""));


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L54-L54



```solidity

File: src/UTBExecutor.sol

67:                 (refund.call{value: extraNative}(""));


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L67-L67



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

61:         (bool success, ) = target.call{value: amount}(callPayload);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L61-L61

### [N-106]<a name="n-106"></a> Lack of space near the operator

Lack of space near operators in code can lead to reduced readability, making it more challenging to distinguish between different elements and understand the logic quickly. As a resolution, always include spaces around operators to ensure a clear visual separation, which promotes better maintainability and comprehension of the code.

*There are 3 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit operator : /
176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L176-L176



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit operator : *
176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L176-L176



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

//@audit operator : -
176:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L176-L176

### [N-107]<a name="n-107"></a> Avoid mutating function parameters

Function parameters in Solidity are passed by value, meaning they are essentially local copies. Mutating them can lead to confusion and errors because the changes don't persist outside the function. By keeping function parameters immutable, you ensure clarity in code behavior, preventing unintended side-effects. If you need to modify a value based on a parameter, use a local variable inside the function, leaving the original parameter unaltered. By adhering to this practice, you maintain a clear distinction between input data and the internal processing logic, improving code readability and reducing the potential for bugs.

*There are 4 instance(s) of this issue:*



```solidity

File: src/swappers/UniSwapper.sol

//@audit the following parameters are mutated token,
47:     function _sendToRecipient(
48:         address recipient,
49:         address token,
50:         uint amount
51:     ) private {
52:         if (token == address(0)) {
53:             token = wrapped;
54:         }
55:         IERC20(token).transfer(recipient, amount);
56:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L47-L56



```solidity

File: src/swappers/UniSwapper.sol

//@audit the following parameters are mutated swapParams,
100:     function swapNoPath(
101:         SwapParams memory swapParams,
102:         address receiver,
103:         address refund
104:     ) public payable returns (address tokenOut, uint256 amountOut) {
105:         swapParams = _receiveAndWrapIfNeeded(swapParams);
106: 
107:         if (swapParams.direction == SwapDirection.EXACT_OUT) {
108:             _refundUser(
109:                 refund,
110:                 swapParams.tokenIn,
111:                 swapParams.amountIn - swapParams.amountOut
112:             );
113:         }
114: 
115:         uint amt2Recipient = swapParams.direction == SwapDirection.EXACT_OUT
116:             ? swapParams.amountOut
117:             : swapParams.amountIn;
118: 
119:         _sendToRecipient(receiver, swapParams.tokenOut, amt2Recipient);
120:         return (swapParams.tokenOut, amt2Recipient);
121:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L100-L121



```solidity

File: src/swappers/UniSwapper.sol

//@audit the following parameters are mutated swapParams,
123:     function swapExactIn(
124:         SwapParams memory swapParams, // SwapParams is a struct
125:         address receiver
126:     ) public payable routerIsSet returns (uint256 amountOut) {
127:         swapParams = _receiveAndWrapIfNeeded(swapParams);
128: 
129:         IV3SwapRouter.ExactInputParams memory params = IV3SwapRouter
130:             .ExactInputParams({
131:                 path: swapParams.path,
132:                 recipient: address(this),
133:                 amountIn: swapParams.amountIn,
134:                 amountOutMinimum: swapParams.amountOut
135:             });
136: 
137:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);
138:         amountOut = IV3SwapRouter(uniswap_router).exactInput(params);
139: 
140:         _sendToRecipient(receiver, swapParams.tokenOut, amountOut);
141:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L123-L141



```solidity

File: src/swappers/UniSwapper.sol

//@audit the following parameters are mutated swapParams,
143:     function swapExactOut(
144:         SwapParams memory swapParams,
145:         address receiver,
146:         address refundAddress
147:     ) public payable routerIsSet returns (uint256 amountIn) {
148:         swapParams = _receiveAndWrapIfNeeded(swapParams);
149:         IV3SwapRouter.ExactOutputParams memory params = IV3SwapRouter
150:             .ExactOutputParams({
151:                 path: swapParams.path,
152:                 recipient: address(this),
153:                 //deadline: block.timestamp,
154:                 amountOut: swapParams.amountOut,
155:                 amountInMaximum: swapParams.amountIn
156:             });
157: 
158:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);
159:         amountIn = IV3SwapRouter(uniswap_router).exactOutput(params);
160: 
161:         // refund sender
162:         _refundUser(
163:             refundAddress,
164:             swapParams.tokenIn,
165:             params.amountInMaximum - amountIn
166:         );
167: 
168:         _sendToRecipient(receiver, swapParams.tokenOut, swapParams.amountOut);
169:     }


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L143-L169

### [N-108]<a name="n-108"></a> A event should be emitted if a non immutable state variable is set in a constructor

 

*There are 7 instance(s) of this issue:*



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

22:         gasIsEth = _gasIsEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L22-L22



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

23:         bridgeToken = _bridgeToken;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L23-L23



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

32:         weth = IWETH(_wethAddress);


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L32-L32



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

33:         gasCurrencyIsEth = gasIsEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L33-L33



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

34:         executor = IDecentBridgeExecutor(payable(_executor));


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L34-L34



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

13:         weth = IWETH(payable(_weth));


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L13-L13



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

14:         gasCurrencyIsEth = gasIsEth;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L14-L14

### [N-109]<a name="n-109"></a> [Solidity]: Order of Argument Evaluation Disrupted in Non-Expression-Split Code by Optimizer Sequences with FullInliner

Function call arguments in Yul are evaluated right to left. This order matters when the argument expressions have side-effects, and changing it may change contract behavior. FullInliner is an optimizer step that can replace a function call with the body of that function. The transformation involves assigning argument expressions to temporary variables, which imposes an explicit evaluation order. FullInliner was written with the assumption that this order does not necessarily have to match usual argument evaluation order because the argument expressions have no side-effects. In most circumstances this assumption is true because the default optimization step sequence contains the ExpressionSplitter step. ExpressionSplitter ensures that the code is in *expression-split form*, which means that function calls cannot appear nested inside expressions, and all function call arguments have to be variables. The assumption is, however, not guaranteed to be true in general. Version 0.6.7 introduced a setting allowing users to specify an arbitrary optimization step sequence, making it possible for the FullInliner to actually encounter argument expressions with side-effects, which can result in behavior differences between optimized and unoptimized bytecode. Contracts compiled without optimization or with the default optimization sequence are not affected. To trigger the bug the user has to explicitly choose compiler settings that contain a sequence with FullInliner step not preceded by ExpressionSplitter. [Ref](https://blog.soliditylang.org/2023/07/19/full-inliner-non-expression-split-argument-evaluation-order-bug/)

*There are 9 instance(s) of this issue:*



```solidity

File: src/UTB.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTB.sol#L2-L2



```solidity

File: src/UTBExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/UTBExecutor.sol#L2-L2



```solidity

File: src/bridge_adapters/BaseAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/BaseAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/DecentBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/DecentBridgeAdapter.sol#L2-L2



```solidity

File: src/bridge_adapters/StargateBridgeAdapter.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/bridge_adapters/StargateBridgeAdapter.sol#L2-L2



```solidity

File: src/swappers/SwapParams.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/SwapParams.sol#L2-L2



```solidity

File: src/swappers/UniSwapper.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//src/swappers/UniSwapper.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentEthRouter.sol

2: pragma solidity ^0.8.13;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentEthRouter.sol#L2-L2



```solidity

File: lib/decent-bridge/src/DecentBridgeExecutor.sol

2: pragma solidity ^0.8.0;


```


*GitHub* : https://github.com/code-423n4/2024-01-decent/blob/main//lib/decent-bridge/src/DecentBridgeExecutor.sol#L2-L2