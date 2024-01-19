# Report


## Gas Optimizations


| |Issue|Instances|
|-|:-|:-:|
| [GAS-1](#GAS-1) | State variables should be cached in stack variables rather than re-reading them from storage | 4 |
| [GAS-2](#GAS-2) | Use calldata instead of memory for function arguments that do not get mutated | 20 |
| [GAS-3](#GAS-3) | For Operations that will not overflow, you could use unchecked | 82 |
| [GAS-4](#GAS-4) | Use Custom Errors | 2 |
| [GAS-5](#GAS-5) | Don't initialize variables with default value | 4 |
| [GAS-6](#GAS-6) | Functions guaranteed to revert when called by normal users can be marked `payable` | 8 |
| [GAS-7](#GAS-7) | Using `private` rather than `public` for constants, saves gas | 4 |
| [GAS-8](#GAS-8) | Use != 0 instead of > 0 for unsigned integer comparison | 1 |
### <a name="GAS-1"></a>[GAS-1] State variables should be cached in stack variables rather than re-reading them from storage
The instances below point to the second+ access of a state variable within a function. Caching of a state variable replaces each Gwarmaccess (100 gas) with a much cheaper stack read. Other less obvious fixes/optimizations include having local memory caches of state variable structs, or having local caches of state variable contracts/addresses.

*Saves 100 gas per instance*

*Instances (4)*:
```solidity
File: src/bridge_adapters/DecentBridgeAdapter.sol

108:             IERC20(bridgeToken).approve(address(router), amt2Bridge);

```

```solidity
File: src/swappers/UniSwapper.sol

91:         IWETH(wrapped).deposit{value: swapParams.amountIn}();

138:         amountOut = IV3SwapRouter(uniswap_router).exactInput(params);

159:         amountIn = IV3SwapRouter(uniswap_router).exactOutput(params);

```

### <a name="GAS-2"></a>[GAS-2] Use calldata instead of memory for function arguments that do not get mutated
Mark data types as `calldata` instead of `memory` where possible. This makes it so that the data is not automatically loaded into memory. If the data passed into the function does not need to be changed (like updating values in an array), it can be passed in as `calldata`. The one exception to this is if the argument must later be passed into another function that takes an argument that specifies `memory` storage.

*Instances (20)*:
```solidity
File: src/UTB.sol

302:         SwapInstructions memory postBridge,

305:         bytes memory payload,

```

```solidity
File: src/UTBExecutor.sol

19:         bytes memory payload,

41:         bytes memory payload,

```

```solidity
File: src/bridge_adapters/DecentBridgeAdapter.sol

39:         SwapInstructions memory postBridge,

43:         bytes memory payload

77:         SwapInstructions memory postBridge,

81:         bytes memory payload,

122:         SwapInstructions memory postBridge,

125:         bytes memory payload,

```

```solidity
File: src/bridge_adapters/StargateBridgeAdapter.sol

63:         SwapInstructions memory postBridge,

67:         bytes memory payload,

177:         bytes memory, // _srcAddress

181:         bytes memory payload

```

```solidity
File: src/swappers/UniSwapper.sol

33:         SwapParams memory newSwapParams,

34:         bytes memory payload

59:         bytes memory swapPayload

101:         SwapParams memory swapParams,

124:         SwapParams memory swapParams, // SwapParams is a struct

144:         SwapParams memory swapParams,

```

### <a name="GAS-3"></a>[GAS-3] For Operations that will not overflow, you could use unchecked

*Instances (82)*:
```solidity
File: src/UTB.sol

280:                 value: bridgeFee + (native ? amt2Bridge : 0)

```

```solidity
File: src/UTBExecutor.sol

70:         uint remainingBalance = IERC20(token).balanceOf(address(this)) -

```

```solidity
File: src/bridge_adapters/DecentBridgeAdapter.sol

62:         bytes calldata /*additionalArgs*/

62:         bytes calldata /*additionalArgs*/

62:         bytes calldata /*additionalArgs*/

62:         bytes calldata /*additionalArgs*/

69:         address /*tokenIn*/,

69:         address /*tokenIn*/,

69:         address /*tokenIn*/,

69:         address /*tokenIn*/,

70:         address /*tokenOut*/

70:         address /*tokenOut*/

70:         address /*tokenOut*/

70:         address /*tokenOut*/

```

```solidity
File: src/bridge_adapters/StargateBridgeAdapter.sol

55:         address /*tokenIn*/,

55:         address /*tokenIn*/,

55:         address /*tokenIn*/,

55:         address /*tokenIn*/,

56:         address /*tokenOut*/

56:         address /*tokenOut*/

56:         address /*tokenOut*/

56:         address /*tokenOut*/

58:         return (amt2Bridge * (1e4 - SG_FEE_BPS)) / 1e4;

58:         return (amt2Bridge * (1e4 - SG_FEE_BPS)) / 1e4;

58:         return (amt2Bridge * (1e4 - SG_FEE_BPS)) / 1e4;

102:                 ? (lzBridgeData.fee + amt2Bridge)

163:             getDstChainId(additionalArgs), //lzBridgeData._dstChainId, // send to LayerZero chainId

163:             getDstChainId(additionalArgs), //lzBridgeData._dstChainId, // send to LayerZero chainId

163:             getDstChainId(additionalArgs), //lzBridgeData._dstChainId, // send to LayerZero chainId

163:             getDstChainId(additionalArgs), //lzBridgeData._dstChainId, // send to LayerZero chainId

164:             getSrcPoolId(additionalArgs), //lzBridgeData._srcPoolId, // source pool id

164:             getSrcPoolId(additionalArgs), //lzBridgeData._srcPoolId, // source pool id

164:             getSrcPoolId(additionalArgs), //lzBridgeData._srcPoolId, // source pool id

164:             getSrcPoolId(additionalArgs), //lzBridgeData._srcPoolId, // source pool id

165:             getDstPoolId(additionalArgs), //lzBridgeData._dstPoolId, // dst pool id

165:             getDstPoolId(additionalArgs), //lzBridgeData._dstPoolId, // dst pool id

165:             getDstPoolId(additionalArgs), //lzBridgeData._dstPoolId, // dst pool id

165:             getDstPoolId(additionalArgs), //lzBridgeData._dstPoolId, // dst pool id

166:             refund, // refund adddress. extra gas (if any) is returned to this address

166:             refund, // refund adddress. extra gas (if any) is returned to this address

167:             amt2Bridge, // quantity to swap

167:             amt2Bridge, // quantity to swap

168:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips

168:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips

168:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips

168:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips

168:             (amt2Bridge * (10000 - SG_FEE_BPS)) / 10000, // the min qty you would accept on the destination, fee is 6 bips

169:             getLzTxObj(additionalArgs), // additional gasLimit increase, airdrop, at address

169:             getLzTxObj(additionalArgs), // additional gasLimit increase, airdrop, at address

171:             bridgePayload // bytes param, if you wish to send additional payload you can abi.encode() them here

171:             bridgePayload // bytes param, if you wish to send additional payload you can abi.encode() them here

176:         uint16, // _srcChainid

176:         uint16, // _srcChainid

177:         bytes memory, // _srcAddress

177:         bytes memory, // _srcAddress

178:         uint256, // _nonce

178:         uint256, // _nonce

179:         address, // _token

179:         address, // _token

180:         uint256, // amountLD

180:         uint256, // amountLD

```

```solidity
File: src/swappers/UniSwapper.sol

4: import {UTBOwned} from "../UTBOwned.sol";

5: import {SwapParams} from "./SwapParams.sol";

6: import {SwapDirection} from "./SwapParams.sol";

7: import {IERC20} from "forge-std/interfaces/IERC20.sol";

7: import {IERC20} from "forge-std/interfaces/IERC20.sol";

7: import {IERC20} from "forge-std/interfaces/IERC20.sol";

8: import {IWETH} from "decent-bridge/src/interfaces/IWETH.sol";

8: import {IWETH} from "decent-bridge/src/interfaces/IWETH.sol";

8: import {IWETH} from "decent-bridge/src/interfaces/IWETH.sol";

8: import {IWETH} from "decent-bridge/src/interfaces/IWETH.sol";

9: import {Owned} from "solmate/auth/Owned.sol";

9: import {Owned} from "solmate/auth/Owned.sol";

10: import {ISwapper} from "../UTB.sol";

11: import {IV3SwapRouter} from "@uniswap/swap-contracts/interfaces/IV3SwapRouter.sol";

11: import {IV3SwapRouter} from "@uniswap/swap-contracts/interfaces/IV3SwapRouter.sol";

11: import {IV3SwapRouter} from "@uniswap/swap-contracts/interfaces/IV3SwapRouter.sol";

11: import {IV3SwapRouter} from "@uniswap/swap-contracts/interfaces/IV3SwapRouter.sol";

111:                 swapParams.amountIn - swapParams.amountOut

124:         SwapParams memory swapParams, // SwapParams is a struct

124:         SwapParams memory swapParams, // SwapParams is a struct

165:             params.amountInMaximum - amountIn

```

### <a name="GAS-4"></a>[GAS-4] Use Custom Errors
[Source](https://blog.soliditylang.org/2021/04/21/custom-errors/)
Instead of using error strings, to reduce deployment and runtime cost, you should use Custom Errors. This would save both deployment and runtime cost.

*Instances (2)*:
```solidity
File: src/UTB.sol

65:             require(msg.value >= swapParams.amountIn, "not enough native");

```

```solidity
File: src/swappers/UniSwapper.sol

96:         require(uniswap_router != address(0), "router not set");

```

### <a name="GAS-5"></a>[GAS-5] Don't initialize variables with default value

*Instances (4)*:
```solidity
File: src/UTB.sol

224:             uint value = 0;

```

```solidity
File: src/bridge_adapters/DecentBridgeAdapter.sol

7:     uint8 public constant BRIDGE_ID = 0;

```

```solidity
File: src/swappers/SwapParams.sol

5:     uint8 constant EXACT_IN = 0;

```

```solidity
File: src/swappers/UniSwapper.sol

16:     uint8 public constant SWAPPER_ID = 0;

```

### <a name="GAS-6"></a>[GAS-6] Functions guaranteed to revert when called by normal users can be marked `payable`
If a function modifier such as `onlyOwner` is used, the function will revert if a normal user tries to pay the function. Marking the function as `payable` will lower the gas cost for legitimate callers because the compiler will not include checks for whether a payment was provided.

*Instances (8)*:
```solidity
File: src/UTB.sol

18:     function setExecutor(address _executor) public onlyOwner {

315:     function registerSwapper(address swapper) public onlyOwner {

324:     function registerBridge(address bridge) public onlyOwner {

```

```solidity
File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {

```

```solidity
File: src/bridge_adapters/DecentBridgeAdapter.sol

20:     function setRouter(address _router) public onlyOwner {

```

```solidity
File: src/bridge_adapters/StargateBridgeAdapter.sol

25:     function setRouter(address _router) public onlyOwner {

29:     function setStargateEth(address _sgEth) public onlyOwner {

```

```solidity
File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {

```

### <a name="GAS-7"></a>[GAS-7] Using `private` rather than `public` for constants, saves gas
If needed, the values can be read from the verified contract source code, or if there are multiple values there can be a single getter function that [returns a tuple](https://github.com/code-423n4/2022-08-frax/blob/90f55a9ce4e25bceed3a74290b854341d8de6afa/src/contracts/FraxlendPair.sol#L156-L178) of the values of all currently-public constants. Saves **3406-3606 gas** in deployment gas due to the compiler not having to create non-payable getter functions for deployment calldata, not having to store the bytes of the value outside of where it's used, and not adding another entry to the method ID table

*Instances (4)*:
```solidity
File: src/bridge_adapters/DecentBridgeAdapter.sol

7:     uint8 public constant BRIDGE_ID = 0;

```

```solidity
File: src/bridge_adapters/StargateBridgeAdapter.sol

14:     uint8 public constant BRIDGE_ID = 1;

15:     uint8 public constant SG_FEE_BPS = 6;

```

```solidity
File: src/swappers/UniSwapper.sol

16:     uint8 public constant SWAPPER_ID = 0;

```

### <a name="GAS-8"></a>[GAS-8] Use != 0 instead of > 0 for unsigned integer comparison

*Instances (1)*:
```solidity
File: src/UTBExecutor.sol

61:         if (extraNative > 0) {

```


## Non Critical Issues


| |Issue|Instances|
|-|:-|:-:|
| [NC-1](#NC-1) | Return values of `approve()` not checked | 11 |
| [NC-2](#NC-2) | Functions not used internally could be marked external | 23 |
### <a name="NC-1"></a>[NC-1] Return values of `approve()` not checked
Not all IERC20 implementations `revert()` when there's a failure in `approve()`. The function signature has a boolean return value and they indicate errors that way instead. By not checking the return value, operations that should have marked as failed, may potentially go through without actually approving anything

*Instances (11)*:
```solidity
File: src/UTB.sol

80:         IERC20(swapParams.tokenIn).approve(

142:             IERC20(tokenOut).approve(address(executor), amountOut);

206:             IERC20(bridgeToken).approve(address(bridgeAdapter), amt2Bridge);

231:                 IERC20(fees.feeToken).approve(

```

```solidity
File: src/UTBExecutor.sol

59:         IERC20(token).approve(paymentOperator, amount);

```

```solidity
File: src/bridge_adapters/DecentBridgeAdapter.sol

108:             IERC20(bridgeToken).approve(address(router), amt2Bridge);

139:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);

```

```solidity
File: src/bridge_adapters/StargateBridgeAdapter.sol

81:         IERC20(bridgeToken).approve(address(router), amt2Bridge);

199:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);

```

```solidity
File: src/swappers/UniSwapper.sol

137:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);

158:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);

```

### <a name="NC-2"></a>[NC-2] Functions not used internally could be marked external

*Instances (23)*:
```solidity
File: src/UTB.sol

18:     function setExecutor(address _executor) public onlyOwner {

26:     function setWrapped(address payable _wrapped) public onlyOwner {

34:     function setFeeCollector(address payable _feeCollector) public onlyOwner {

98:     function swapAndExecute(

249:     function bridgeAndExecute(

301:     function receiveFromBridge(

315:     function registerSwapper(address swapper) public onlyOwner {

324:     function registerBridge(address bridge) public onlyOwner {

```

```solidity
File: src/bridge_adapters/BaseAdapter.sol

19:     function setBridgeExecutor(address _executor) public onlyOwner {

```

```solidity
File: src/bridge_adapters/DecentBridgeAdapter.sol

20:     function setRouter(address _router) public onlyOwner {

24:     function getId() public pure returns (uint8) {

28:     function registerRemoteBridgeAdapter(

38:     function estimateFees(

75:     function bridge(

121:     function receiveFromBridge(

```

```solidity
File: src/bridge_adapters/StargateBridgeAdapter.sol

25:     function setRouter(address _router) public onlyOwner {

29:     function setStargateEth(address _sgEth) public onlyOwner {

33:     function getId() public pure returns (uint8) {

37:     function registerRemoteBridgeAdapter(

61:     function bridge(

```

```solidity
File: src/swappers/UniSwapper.sol

20:     function setRouter(address _router) public onlyOwner {

24:     function setWrapped(address payable _wrapped) public onlyOwner {

28:     function getId() public pure returns (uint8) {

```


## Low Issues


| |Issue|Instances|
|-|:-|:-:|
| [L-1](#L-1) | Empty Function Body - Consider commenting why | 13 |
| [L-2](#L-2) | Unsafe ERC20 operation(s) | 21 |
### <a name="L-1"></a>[L-1] Empty Function Body - Consider commenting why

*Instances (13)*:
```solidity
File: src/UTB.sol

6:     constructor() Owned(msg.sender) {}

329:     receive() external payable {}

331:     fallback() external payable {}

```

```solidity
File: src/UTBExecutor.sol

5:     constructor() Owned(msg.sender) {}

```

```solidity
File: src/bridge_adapters/BaseAdapter.sol

9:     constructor() UTBOwned() {}

```

```solidity
File: src/bridge_adapters/DecentBridgeAdapter.sol

150:     receive() external payable {}

152:     fallback() external payable {}

```

```solidity
File: src/bridge_adapters/StargateBridgeAdapter.sol

21:     constructor() BaseAdapter() {}

210:     receive() external payable {}

212:     fallback() external payable {}

```

```solidity
File: src/swappers/UniSwapper.sol

14:     constructor() UTBOwned() {}

171:     receive() external payable {}

173:     fallback() external payable {}

```

### <a name="L-2"></a>[L-2] Unsafe ERC20 operation(s)

*Instances (21)*:
```solidity
File: src/UTB.sol

73:             IERC20(swapParams.tokenIn).transferFrom(

80:         IERC20(swapParams.tokenIn).approve(

142:             IERC20(tokenOut).approve(address(executor), amountOut);

206:             IERC20(bridgeToken).approve(address(bridgeAdapter), amt2Bridge);

226:                 IERC20(fees.feeToken).transferFrom(

231:                 IERC20(fees.feeToken).approve(

```

```solidity
File: src/UTBExecutor.sol

58:         IERC20(token).transferFrom(msg.sender, address(this), amount);

59:         IERC20(token).approve(paymentOperator, amount);

77:         IERC20(token).transfer(refund, remainingBalance);

```

```solidity
File: src/bridge_adapters/DecentBridgeAdapter.sol

103:             IERC20(bridgeToken).transferFrom(

108:             IERC20(bridgeToken).approve(address(router), amt2Bridge);

133:         IERC20(swapParams.tokenIn).transferFrom(

139:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);

```

```solidity
File: src/bridge_adapters/StargateBridgeAdapter.sol

80:         IERC20(bridgeToken).transferFrom(msg.sender, address(this), amt2Bridge);

81:         IERC20(bridgeToken).approve(address(router), amt2Bridge);

199:         IERC20(swapParams.tokenIn).approve(utb, swapParams.amountIn);

```

```solidity
File: src/swappers/UniSwapper.sol

44:         IERC20(token).transfer(user, amount);

55:         IERC20(token).transfer(recipient, amount);

83:             IERC20(swapParams.tokenIn).transferFrom(

137:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);

158:         IERC20(swapParams.tokenIn).approve(uniswap_router, swapParams.amountIn);

```

