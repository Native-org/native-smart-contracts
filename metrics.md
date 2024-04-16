
[<img width="200" alt="get in touch with Consensys Diligence" src="https://user-images.githubusercontent.com/2865694/56826101-91dcf380-685b-11e9-937c-af49c2510aa0.png">](https://consensys.io/diligence)<br/>
<sup>
[[  🌐  ](https://consensys.io/diligence)  [  📩  ](mailto:diligence@consensys.net)  [  🔥  ](https://consensys.io/diligence/tools/)]
</sup><br/><br/>



# Solidity Metrics for 'CLI'

## Table of contents

- [Scope](#t-scope)
    - [Source Units in Scope](#t-source-Units-in-Scope)
        - [Deployable Logic Contracts](#t-deployable-contracts)
    - [Out of Scope](#t-out-of-scope)
        - [Excluded Source Units](#t-out-of-scope-excluded-source-units)
        - [Duplicate Source Units](#t-out-of-scope-duplicate-source-units)
        - [Doppelganger Contracts](#t-out-of-scope-doppelganger-contracts)
- [Report Overview](#t-report)
    - [Risk Summary](#t-risk)
    - [Source Lines](#t-source-lines)
    - [Inline Documentation](#t-inline-documentation)
    - [Components](#t-components)
    - [Exposed Functions](#t-exposed-functions)
    - [StateVariables](#t-statevariables)
    - [Capabilities](#t-capabilities)
    - [Dependencies](#t-package-imports)
    - [Totals](#t-totals)

## <span id=t-scope>Scope</span>

This section lists files that are in scope for the metrics report. 

- **Project:** `'CLI'`
- **Included Files:** 
    - ``
- **Excluded Paths:** 
    - ``
- **File Limit:** `undefined`
    - **Exclude File list Limit:** `undefined`

- **Workspace Repository:** `unknown` (`undefined`@`undefined`)

### <span id=t-source-Units-in-Scope>Source Units in Scope</span>

Source Units Analyzed: **`58`**<br>
Source Units in Scope: **`58`** (**100%**)

| Type | File   | Logic Contracts | Interfaces | Lines | nLines | nSLOC | Comment Lines | Complex. Score | Capabilities |
| ---- | ------ | --------------- | ---------- | ----- | ------ | ----- | ------------- | -------------- | ------------ | 
| 📝 | src/Blacklistable.sol | 1 | **** | 73 | 73 | 34 | 29 | 24 | **** |
| 🎨 | src/ExternalSwapRouterUpgradeable.sol | 1 | **** | 133 | 119 | 88 | 8 | 49 | **** |
| 📝 | src/NativePool.sol | 1 | **** | 483 | 455 | 384 | 10 | 232 | **<abbr title='Uses Hash-Functions'>🧮</abbr><abbr title='Unchecked Blocks'>Σ</abbr>** |
| 📝🔍 | src/NativePoolFactory.sol | 1 | 1 | 218 | 197 | 146 | 18 | 176 | **<abbr title='create/create2'>🌀</abbr><abbr title='doppelganger(IPool)'>🔆</abbr><abbr title='Unchecked Blocks'>Σ</abbr>** |
| 📝 | src/NativeRfqPool.sol | 1 | **** | 227 | 220 | 177 | 9 | 118 | **<abbr title='Payable Functions'>💰</abbr><abbr title='Uses Hash-Functions'>🧮</abbr>** |
| 📝 | src/NativeRouter.sol | 1 | **** | 529 | 508 | 423 | 16 | 323 | **<abbr title='Payable Functions'>💰</abbr><abbr title='Uses Hash-Functions'>🧮</abbr><abbr title='Unchecked Blocks'>Σ</abbr>** |
| 📝 | src/Registry.sol | 1 | **** | 68 | 54 | 43 | 3 | 34 | **<abbr title='Unchecked Blocks'>Σ</abbr>** |
| 📝🎨 | src/Aqua/AquaLpToken.sol | 2 | **** | 375 | 341 | 181 | 112 | 130 | **<abbr title='Payable Functions'>💰</abbr>** |
| 📝 | src/Aqua/AquaVault.sol | 1 | **** | 294 | 271 | 168 | 72 | 115 | **** |
| 📝 | src/Aqua/AquaVaultSignatureCheck.sol | 1 | **** | 154 | 142 | 107 | 25 | 63 | **<abbr title='Uses Hash-Functions'>🧮</abbr>** |
| 📝🔍 | src/Aqua/ChainlinkPriceOracle.sol | 1 | 2 | 77 | 62 | 41 | 12 | 33 | **<abbr title='doppelganger(IERC20Decimal)'>🔆</abbr>** |
| 🎨 | src/Aqua/PullModelPriceOracle.sol | 1 | **** | 14 | 9 | 6 | 1 | 8 | **<abbr title='Payable Functions'>💰</abbr>** |
| 📝🔍 | src/Aqua/PythPriceOracle.sol | 1 | 1 | 118 | 108 | 74 | 13 | 76 | **<abbr title='Uses Assembly'>🖥</abbr><abbr title='Payable Functions'>💰</abbr><abbr title='Initiates ETH Value Transfer'>📤</abbr><abbr title='doppelganger(IERC20)'>🔆</abbr>** |
| 📝🔍 | src/Aqua/RedStonePriceOracle.sol | 1 | 1 | 100 | 94 | 75 | 3 | 81 | **<abbr title='Payable Functions'>💰</abbr><abbr title='doppelganger(IERC20Decimals)'>🔆</abbr>** |
| 🎨 | src/Compound/BaseJumpRateModelV2.sol | 1 | **** | 154 | 139 | 50 | 69 | 26 | **** |
| 🔍🎨 | src/Compound/CErc20.sol | 1 | 1 | 127 | 115 | 48 | 58 | 47 | **<abbr title='Initiates ETH Value Transfer'>📤</abbr>** |
| 🎨 | src/Compound/CToken.sol | 1 | **** | 1047 | 1001 | 393 | 475 | 286 | **** |
| 📝🎨 | src/Compound/CTokenInterfaces.sol | 7 | **** | 293 | 240 | 60 | 135 | 109 | **** |
| 📝 | src/Compound/Comptroller.sol | 1 | **** | 1162 | 1107 | 582 | 358 | 378 | **** |
| 🎨 | src/Compound/ComptrollerInterface.sol | 1 | **** | 72 | 10 | 4 | 5 | 36 | **** |
| 📝 | src/Compound/ComptrollerStorage.sol | 5 | **** | 106 | 106 | 42 | 47 | 33 | **** |
| 🔍 | src/Compound/EIP20NonStandardInterface.sol | **** | 1 | 71 | 15 | 3 | 50 | 13 | **** |
| 📝 | src/Compound/ErrorReporter.sol | 2 | **** | 127 | 127 | 95 | 13 | 11 | **** |
| 📝 | src/Compound/ExponentialNoError.sol | 1 | **** | 171 | 171 | 107 | 31 | 49 | **** |
| 🎨 | src/Compound/InterestRateModel.sol | 1 | **** | 30 | 19 | 4 | 21 | 6 | **** |
| 📝 | src/Compound/JumpRateModelV2.sol | 1 | **** | 31 | 31 | 15 | 13 | 9 | **** |
| 🎨 | src/Compound/PriceOracle.sol | 1 | **** | 18 | 17 | 6 | 8 | 5 | **** |
| 🔍 | src/interfaces/IAquaLpToken.sol | **** | 1 | 22 | 15 | 12 | 1 | 9 | **** |
| 🔍 | src/interfaces/IAquaVault.sol | **** | 1 | 60 | 60 | 51 | 1 | 1 | **** |
| 🔍 | src/interfaces/IMulticall.sol | **** | 1 | 20 | 12 | 4 | 12 | 11 | **<abbr title='Payable Functions'>💰</abbr>** |
| 🔍 | src/interfaces/INativePool.sol | **** | 1 | 89 | 35 | 29 | 1 | 13 | **** |
| 🔍 | src/interfaces/INativePoolFactory.sol | **** | 1 | 63 | 48 | 36 | 5 | 17 | **** |
| 🔍 | src/interfaces/INativeRfqPool.sol | **** | 1 | 86 | 58 | 23 | 32 | 3 | **** |
| 🔍 | src/interfaces/INativeRouter.sol | **** | 1 | 89 | 52 | 36 | 13 | 26 | **<abbr title='Payable Functions'>💰</abbr>** |
| 🔍 | src/interfaces/INativeTreasury.sol | **** | 2 | 27 | 9 | 5 | 2 | 14 | **** |
| 🔍 | src/interfaces/IPeripheryState.sol | **** | 1 | 12 | 8 | 3 | 5 | 5 | **<abbr title='doppelganger(IPeripheryState)'>🔆</abbr>** |
| 🔍 | src/interfaces/IPricer.sol | **** | 1 | 11 | 5 | 3 | 1 | 3 | **** |
| 🔍 | src/interfaces/ISwapCallback.sol | **** | 1 | 17 | 16 | 3 | 12 | 3 | **** |
| 🔍 | src/interfaces/IUniswapV3SwapRouter.sol | **** | 1 | 22 | 21 | 12 | 7 | 6 | **<abbr title='Payable Functions'>💰</abbr>** |
| 🔍 | src/interfaces/IWETH9.sol | **** | 1 | 20 | 12 | 6 | 4 | 14 | **<abbr title='Payable Functions'>💰</abbr>** |
| 📚 | src/libraries/AquaVaultLogic.sol | 1 | **** | 422 | 362 | 268 | 49 | 187 | **<abbr title='Initiates ETH Value Transfer'>📤</abbr><abbr title='Unchecked Blocks'>Σ</abbr>** |
| 📚 | src/libraries/BytesLib.sol | 1 | **** | 105 | 105 | 57 | 29 | 150 | **<abbr title='Uses Assembly'>🖥</abbr>** |
| 📚 | src/libraries/CallbackValidation.sol | 1 | **** | 17 | 17 | 9 | 6 | 5 | **** |
| 📚 | src/libraries/FullMath.sol | 1 | **** | 121 | 121 | 59 | 60 | 103 | **<abbr title='Uses Assembly'>🖥</abbr><abbr title='Unchecked Blocks'>Σ</abbr>** |
| 🎨 | src/libraries/Multicall.sol | 1 | **** | 40 | 37 | 26 | 6 | 46 | **<abbr title='Uses Assembly'>🖥</abbr><abbr title='Payable Functions'>💰</abbr><abbr title='DelegateCall'>👥</abbr><abbr title='Unchecked Blocks'>Σ</abbr>** |
| 🎨 | src/libraries/NoDelegateCallUpgradable.sol | 1 | **** | 37 | 37 | 19 | 12 | 12 | **** |
| 📚 | src/libraries/Order.sol | 1 | **** | 66 | 66 | 53 | 3 | 24 | **** |
| 🎨 | src/libraries/PeripheryPayments.sol | 1 | **** | 41 | 41 | 27 | 8 | 28 | **<abbr title='Payable Functions'>💰</abbr>** |
| 🎨 | src/libraries/PeripheryState.sol | 1 | **** | 27 | 19 | 14 | 6 | 13 | **** |
| 🎨 | src/libraries/PeripheryValidation.sol | 1 | **** | 9 | 9 | 7 | 1 | 2 | **** |
| 📚 | src/libraries/SafeCast.sol | 1 | **** | 28 | 28 | 13 | 12 | 9 | **** |
| 📚 | src/libraries/TransferHelper.sol | 1 | **** | 45 | 45 | 22 | 16 | 22 | **** |
| 📝 | src/libraries/Weth9Unwrapper.sol | 1 | **** | 23 | 23 | 17 | 1 | 14 | **<abbr title='Payable Functions'>💰</abbr>** |
| 🎨 | src/storage/AquaVaultStorage.sol | 1 | **** | 51 | 51 | 18 | 19 | 14 | **** |
| 🎨 | src/storage/NativePoolFactoryStorage.sol | 1 | **** | 16 | 16 | 13 | 2 | 11 | **** |
| 🎨 | src/storage/NativePoolStorage.sol | 1 | **** | 27 | 27 | 21 | 2 | 18 | **** |
| 🎨 | src/storage/NativeRfqPoolStorage.sol | 1 | **** | 16 | 16 | 14 | 1 | 12 | **** |
| 🎨 | src/storage/NativeRouterStorage.sol | 1 | **** | 14 | 14 | 10 | 3 | 8 | **** |
| 📝📚🔍🎨 | **Totals** | **56** | **21** | **7915**  | **7136** | **4246** | **1946** | **3273** | **<abbr title='Uses Assembly'>🖥</abbr><abbr title='Payable Functions'>💰</abbr><abbr title='Initiates ETH Value Transfer'>📤</abbr><abbr title='DelegateCall'>👥</abbr><abbr title='Uses Hash-Functions'>🧮</abbr><abbr title='create/create2'>🌀</abbr><abbr title='doppelganger'>🔆</abbr><abbr title='Unchecked Blocks'>Σ</abbr>** |

<sub>
Legend: <a onclick="toggleVisibility('table-legend', this)">[➕]</a>
<div id="table-legend" style="display:none">

<ul>
<li> <b>Lines</b>: total lines of the source unit </li>
<li> <b>nLines</b>: normalized lines of the source unit (e.g. normalizes functions spanning multiple lines) </li>
<li> <b>nSLOC</b>: normalized source lines of code (only source-code lines; no comments, no blank lines) </li>
<li> <b>Comment Lines</b>: lines containing single or block comments </li>
<li> <b>Complexity Score</b>: a custom complexity score derived from code statements that are known to introduce code complexity (branches, loops, calls, external interfaces, ...) </li>
</ul>

</div>
</sub>


##### <span id=t-deployable-contracts>Deployable Logic Contracts</span>
Total: 13
* 📝 `NativePool`
* 📝 `NativePoolFactory`
* 📝 `NativeRfqPool`
* 📝 `NativeRouter`
* 📝 `Registry`
* <a onclick="toggleVisibility('deployables', this)">[➕]</a>
<div id="deployables" style="display:none">
<ul>
<li> 📝 <code>AquaLpToken</code></li>
<li> 📝 <code>AquaVault</code></li>
<li> 📝 <code>AquaVaultSignatureCheck</code></li>
<li> 📝 <code>ChainlinkPriceOracle</code></li>
<li> 📝 <code>PythPriceOracle</code></li>
<li> 📝 <code>RedStonePriceOracle</code></li>
<li> 📝 <code>JumpRateModelV2</code></li>
<li> 📝 <code>Weth9Unwrapper</code></li>
</ul>
</div>
            



#### <span id=t-out-of-scope>Out of Scope</span>

##### <span id=t-out-of-scope-excluded-source-units>Excluded Source Units</span>

Source Units Excluded: **`0`**

<a onclick="toggleVisibility('excluded-files', this)">[➕]</a>
<div id="excluded-files" style="display:none">
| File   |
| ------ |
| None |

</div>


##### <span id=t-out-of-scope-duplicate-source-units>Duplicate Source Units</span>

Duplicate Source Units Excluded: **`0`** 

<a onclick="toggleVisibility('duplicate-files', this)">[➕]</a>
<div id="duplicate-files" style="display:none">
| File   |
| ------ |
| None |

</div>

##### <span id=t-out-of-scope-doppelganger-contracts>Doppelganger Contracts</span>

Doppelganger Contracts: **`5`** 

<a onclick="toggleVisibility('doppelganger-contracts', this)">[➕]</a>
<div id="doppelganger-contracts" style="display:none">
| File   | Contract | Doppelganger | 
| ------ | -------- | ------------ |
| src/NativePoolFactory.sol | IPool | (fuzzy) [0](https://github.com/smartcontractkit/chainlink/blob/chores-explorer-tags-for-dockerhub/evm/contracts/interfaces/AggregatorInterface.sol), [1](https://github.com/smartcontractkit/chainlink/blob/chores-v0.0.1/evm/contracts/interfaces/AggregatorInterface.sol), [2](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.0.1/evm/contracts/interfaces/AggregatorInterface.sol), [3](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.7.0/evm/contracts/interfaces/AggregatorInterface.sol), [4](https://github.com/smartcontractkit/chainlink/blob/v0.6.0/evm/contracts/interfaces/AggregatorInterface.sol), [5](https://github.com/smartcontractkit/chainlink/blob/v0.6.0/examples/testnet/contracts/AggregatorProxy.sol), [6](https://github.com/smartcontractkit/chainlink/blob/v0.6.09/evm/contracts/interfaces/AggregatorInterface.sol), [7](https://github.com/smartcontractkit/chainlink/blob/v0.6.1/evm/contracts/interfaces/AggregatorInterface.sol), [8](https://github.com/smartcontractkit/chainlink/blob/v0.6.1/examples/testnet/contracts/AggregatorProxy.sol), [9](https://github.com/smartcontractkit/chainlink/blob/v0.6.10/evm/contracts/interfaces/AggregatorInterface.sol), [10](https://github.com/smartcontractkit/chainlink/blob/v0.6.2/evm/contracts/interfaces/AggregatorInterface.sol), [11](https://github.com/smartcontractkit/chainlink/blob/v0.6.2/examples/testnet/contracts/AggregatorProxy.sol), [12](https://github.com/smartcontractkit/chainlink/blob/v0.6.3/evm/contracts/interfaces/AggregatorInterface.sol), [13](https://github.com/smartcontractkit/chainlink/blob/v0.6.3/examples/testnet/contracts/AggregatorProxy.sol), [14](https://github.com/smartcontractkit/chainlink/blob/v0.6.4/evm/contracts/interfaces/AggregatorInterface.sol), [15](https://github.com/smartcontractkit/chainlink/blob/v0.6.4/examples/testnet/contracts/AggregatorProxy.sol), [16](https://github.com/smartcontractkit/chainlink/blob/v0.6.6/evm/contracts/interfaces/AggregatorInterface.sol), [17](https://github.com/smartcontractkit/chainlink/blob/v0.6.7/evm/contracts/interfaces/AggregatorInterface.sol), [18](https://github.com/smartcontractkit/chainlink/blob/v0.6.8/evm/contracts/interfaces/AggregatorInterface.sol), [19](https://github.com/smartcontractkit/chainlink/blob/v0.6.9/evm/contracts/interfaces/AggregatorInterface.sol), [20](https://github.com/smartcontractkit/chainlink/blob/v0.7.0/evm/contracts/interfaces/AggregatorInterface.sol) |
| src/Aqua/ChainlinkPriceOracle.sol | IERC20Decimal | (fuzzy) [0](https://github.com/smartcontractkit/chainlink/blob/0.8.0/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [1](https://github.com/smartcontractkit/chainlink/blob/0.8.0/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [2](https://github.com/smartcontractkit/chainlink/blob/0.8.0/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [3](https://github.com/smartcontractkit/chainlink/blob/chores-explorer-tags-for-dockerhub/evm/contracts/interfaces/PointerInterface.sol), [4](https://github.com/smartcontractkit/chainlink/blob/chores-explorer-tags-for-dockerhub/evm/v0.5/contracts/interfaces/PointerInterface.sol), [5](https://github.com/smartcontractkit/chainlink/blob/chores-v0.0.1/evm/contracts/interfaces/PointerInterface.sol), [6](https://github.com/smartcontractkit/chainlink/blob/chores-v0.0.1/evm/v0.5/contracts/interfaces/PointerInterface.sol), [7](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.0.1/evm/contracts/interfaces/PointerInterface.sol), [8](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.0.1/evm/v0.5/contracts/interfaces/PointerInterface.sol), [9](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.7.0/evm/contracts/interfaces/PointerInterface.sol), [10](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.7.0/evm/v0.5/contracts/interfaces/PointerInterface.sol), [11](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.0/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [12](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.0/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [13](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.0/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [14](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.1/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [15](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.1/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [16](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.1/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [17](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.2/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [18](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.2/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [19](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.2/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [20](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.3/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [21](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.3/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [22](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.3/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [23](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.4/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [24](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.4/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [25](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.4/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [26](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.5/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [27](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.5/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [28](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.5/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [29](https://github.com/smartcontractkit/chainlink/blob/upgrade/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [30](https://github.com/smartcontractkit/chainlink/blob/upgrade/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [31](https://github.com/smartcontractkit/chainlink/blob/upgrade/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [32](https://github.com/smartcontractkit/chainlink/blob/upgrade/evm-contracts/src/v0.7/interfaces/PointerInterface.sol), [33](https://github.com/smartcontractkit/chainlink/blob/v.0.8.12/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [34](https://github.com/smartcontractkit/chainlink/blob/v.0.8.12/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [35](https://github.com/smartcontractkit/chainlink/blob/v.0.8.12/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [36](https://github.com/smartcontractkit/chainlink/blob/v0.6.0/evm/contracts/interfaces/PointerInterface.sol), [37](https://github.com/smartcontractkit/chainlink/blob/v0.6.0/examples/testnet/contracts/Aggregator.sol), [38](https://github.com/smartcontractkit/chainlink/blob/v0.6.09/evm/contracts/interfaces/PointerInterface.sol), [39](https://github.com/smartcontractkit/chainlink/blob/v0.6.09/evm/v0.5/contracts/interfaces/PointerInterface.sol), [40](https://github.com/smartcontractkit/chainlink/blob/v0.6.1/evm/contracts/interfaces/PointerInterface.sol), [41](https://github.com/smartcontractkit/chainlink/blob/v0.6.1/examples/testnet/contracts/Aggregator.sol), [42](https://github.com/smartcontractkit/chainlink/blob/v0.6.10/evm/contracts/interfaces/PointerInterface.sol), [43](https://github.com/smartcontractkit/chainlink/blob/v0.6.10/evm/v0.5/contracts/interfaces/PointerInterface.sol), [44](https://github.com/smartcontractkit/chainlink/blob/v0.6.2/evm/contracts/interfaces/PointerInterface.sol), [45](https://github.com/smartcontractkit/chainlink/blob/v0.6.2/examples/testnet/contracts/Aggregator.sol), [46](https://github.com/smartcontractkit/chainlink/blob/v0.6.3/evm/contracts/interfaces/PointerInterface.sol), [47](https://github.com/smartcontractkit/chainlink/blob/v0.6.3/examples/testnet/contracts/Aggregator.sol), [48](https://github.com/smartcontractkit/chainlink/blob/v0.6.4/evm/contracts/interfaces/PointerInterface.sol), [49](https://github.com/smartcontractkit/chainlink/blob/v0.6.4/examples/testnet/contracts/Aggregator.sol), [50](https://github.com/smartcontractkit/chainlink/blob/v0.6.6/evm/contracts/interfaces/PointerInterface.sol), [51](https://github.com/smartcontractkit/chainlink/blob/v0.6.6/evm/v0.5/contracts/interfaces/PointerInterface.sol), [52](https://github.com/smartcontractkit/chainlink/blob/v0.6.7/evm/contracts/interfaces/PointerInterface.sol), [53](https://github.com/smartcontractkit/chainlink/blob/v0.6.7/evm/v0.5/contracts/interfaces/PointerInterface.sol), [54](https://github.com/smartcontractkit/chainlink/blob/v0.6.8/evm/contracts/interfaces/PointerInterface.sol), [55](https://github.com/smartcontractkit/chainlink/blob/v0.6.8/evm/v0.5/contracts/interfaces/PointerInterface.sol), [56](https://github.com/smartcontractkit/chainlink/blob/v0.6.9/evm/contracts/interfaces/PointerInterface.sol), [57](https://github.com/smartcontractkit/chainlink/blob/v0.6.9/evm/v0.5/contracts/interfaces/PointerInterface.sol), [58](https://github.com/smartcontractkit/chainlink/blob/v0.7.0/evm/contracts/interfaces/PointerInterface.sol), [59](https://github.com/smartcontractkit/chainlink/blob/v0.7.0/evm/v0.5/contracts/interfaces/PointerInterface.sol), [60](https://github.com/smartcontractkit/chainlink/blob/v0.7.1/evm/contracts/interfaces/PointerInterface.sol), [61](https://github.com/smartcontractkit/chainlink/blob/v0.7.1/evm/v0.5/contracts/interfaces/PointerInterface.sol), [62](https://github.com/smartcontractkit/chainlink/blob/v0.7.2/evm/contracts/interfaces/PointerInterface.sol), [63](https://github.com/smartcontractkit/chainlink/blob/v0.7.2/evm/v0.5/contracts/interfaces/PointerInterface.sol), [64](https://github.com/smartcontractkit/chainlink/blob/v0.7.3/evm/contracts/interfaces/PointerInterface.sol), [65](https://github.com/smartcontractkit/chainlink/blob/v0.7.3/evm/v0.5/contracts/interfaces/PointerInterface.sol), [66](https://github.com/smartcontractkit/chainlink/blob/v0.7.4/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [67](https://github.com/smartcontractkit/chainlink/blob/v0.7.4/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [68](https://github.com/smartcontractkit/chainlink/blob/v0.7.4/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [69](https://github.com/smartcontractkit/chainlink/blob/v0.7.5/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [70](https://github.com/smartcontractkit/chainlink/blob/v0.7.5/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [71](https://github.com/smartcontractkit/chainlink/blob/v0.7.5/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [72](https://github.com/smartcontractkit/chainlink/blob/v0.7.6/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [73](https://github.com/smartcontractkit/chainlink/blob/v0.7.6/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [74](https://github.com/smartcontractkit/chainlink/blob/v0.7.6/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [75](https://github.com/smartcontractkit/chainlink/blob/v0.7.7/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [76](https://github.com/smartcontractkit/chainlink/blob/v0.7.7/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [77](https://github.com/smartcontractkit/chainlink/blob/v0.7.7/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [78](https://github.com/smartcontractkit/chainlink/blob/v0.7.8/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [79](https://github.com/smartcontractkit/chainlink/blob/v0.7.8/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [80](https://github.com/smartcontractkit/chainlink/blob/v0.7.8/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [81](https://github.com/smartcontractkit/chainlink/blob/v0.8.0/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [82](https://github.com/smartcontractkit/chainlink/blob/v0.8.0/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [83](https://github.com/smartcontractkit/chainlink/blob/v0.8.0/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [84](https://github.com/smartcontractkit/chainlink/blob/v0.8.1/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [85](https://github.com/smartcontractkit/chainlink/blob/v0.8.1/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [86](https://github.com/smartcontractkit/chainlink/blob/v0.8.1/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [87](https://github.com/smartcontractkit/chainlink/blob/v0.8.10/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [88](https://github.com/smartcontractkit/chainlink/blob/v0.8.10/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [89](https://github.com/smartcontractkit/chainlink/blob/v0.8.10/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [90](https://github.com/smartcontractkit/chainlink/blob/v0.8.11/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [91](https://github.com/smartcontractkit/chainlink/blob/v0.8.11/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [92](https://github.com/smartcontractkit/chainlink/blob/v0.8.11/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [93](https://github.com/smartcontractkit/chainlink/blob/v0.8.12/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [94](https://github.com/smartcontractkit/chainlink/blob/v0.8.12/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [95](https://github.com/smartcontractkit/chainlink/blob/v0.8.12/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [96](https://github.com/smartcontractkit/chainlink/blob/v0.8.13/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [97](https://github.com/smartcontractkit/chainlink/blob/v0.8.13/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [98](https://github.com/smartcontractkit/chainlink/blob/v0.8.13/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [99](https://github.com/smartcontractkit/chainlink/blob/v0.8.14/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [100](https://github.com/smartcontractkit/chainlink/blob/v0.8.14/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [101](https://github.com/smartcontractkit/chainlink/blob/v0.8.14/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [102](https://github.com/smartcontractkit/chainlink/blob/v0.8.15/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [103](https://github.com/smartcontractkit/chainlink/blob/v0.8.15/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [104](https://github.com/smartcontractkit/chainlink/blob/v0.8.15/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [105](https://github.com/smartcontractkit/chainlink/blob/v0.8.16/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [106](https://github.com/smartcontractkit/chainlink/blob/v0.8.16/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [107](https://github.com/smartcontractkit/chainlink/blob/v0.8.16/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [108](https://github.com/smartcontractkit/chainlink/blob/v0.8.17/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [109](https://github.com/smartcontractkit/chainlink/blob/v0.8.17/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [110](https://github.com/smartcontractkit/chainlink/blob/v0.8.17/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [111](https://github.com/smartcontractkit/chainlink/blob/v0.8.18/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [112](https://github.com/smartcontractkit/chainlink/blob/v0.8.18/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [113](https://github.com/smartcontractkit/chainlink/blob/v0.8.18/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [114](https://github.com/smartcontractkit/chainlink/blob/v0.8.2/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [115](https://github.com/smartcontractkit/chainlink/blob/v0.8.2/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [116](https://github.com/smartcontractkit/chainlink/blob/v0.8.2/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [117](https://github.com/smartcontractkit/chainlink/blob/v0.8.3/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [118](https://github.com/smartcontractkit/chainlink/blob/v0.8.3/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [119](https://github.com/smartcontractkit/chainlink/blob/v0.8.3/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [120](https://github.com/smartcontractkit/chainlink/blob/v0.8.4/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [121](https://github.com/smartcontractkit/chainlink/blob/v0.8.4/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [122](https://github.com/smartcontractkit/chainlink/blob/v0.8.4/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [123](https://github.com/smartcontractkit/chainlink/blob/v0.8.5/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [124](https://github.com/smartcontractkit/chainlink/blob/v0.8.5/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [125](https://github.com/smartcontractkit/chainlink/blob/v0.8.5/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [126](https://github.com/smartcontractkit/chainlink/blob/v0.8.6/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [127](https://github.com/smartcontractkit/chainlink/blob/v0.8.6/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [128](https://github.com/smartcontractkit/chainlink/blob/v0.8.6/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [129](https://github.com/smartcontractkit/chainlink/blob/v0.8.7/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [130](https://github.com/smartcontractkit/chainlink/blob/v0.8.7/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [131](https://github.com/smartcontractkit/chainlink/blob/v0.8.7/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [132](https://github.com/smartcontractkit/chainlink/blob/v0.8.8/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [133](https://github.com/smartcontractkit/chainlink/blob/v0.8.8/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [134](https://github.com/smartcontractkit/chainlink/blob/v0.8.8/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [135](https://github.com/smartcontractkit/chainlink/blob/v0.8.9/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [136](https://github.com/smartcontractkit/chainlink/blob/v0.8.9/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [137](https://github.com/smartcontractkit/chainlink/blob/v0.8.9/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [138](https://github.com/smartcontractkit/chainlink/blob/v0.9.0/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [139](https://github.com/smartcontractkit/chainlink/blob/v0.9.0/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [140](https://github.com/smartcontractkit/chainlink/blob/v0.9.0/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [141](https://github.com/smartcontractkit/chainlink/blob/v0.9.2/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [142](https://github.com/smartcontractkit/chainlink/blob/v0.9.2/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [143](https://github.com/smartcontractkit/chainlink/blob/v0.9.2/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [144](https://github.com/smartcontractkit/chainlink/blob/v0.9.3/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [145](https://github.com/smartcontractkit/chainlink/blob/v0.9.3/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [146](https://github.com/smartcontractkit/chainlink/blob/v0.9.3/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [147](https://github.com/smartcontractkit/chainlink/blob/v0.9.4/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [148](https://github.com/smartcontractkit/chainlink/blob/v0.9.4/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [149](https://github.com/smartcontractkit/chainlink/blob/v0.9.4/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [150](https://github.com/smartcontractkit/chainlink/blob/v0.9.5/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [151](https://github.com/smartcontractkit/chainlink/blob/v0.9.5/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [152](https://github.com/smartcontractkit/chainlink/blob/v0.9.5/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [153](https://github.com/smartcontractkit/chainlink/blob/v0.9.6/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [154](https://github.com/smartcontractkit/chainlink/blob/v0.9.6/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [155](https://github.com/smartcontractkit/chainlink/blob/v0.9.6/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [156](https://github.com/smartcontractkit/chainlink/blob/v0.9.6/evm-contracts/src/v0.7/interfaces/PointerInterface.sol), [157](https://github.com/smartcontractkit/chainlink/blob/v0.9.7/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [158](https://github.com/smartcontractkit/chainlink/blob/v0.9.7/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [159](https://github.com/smartcontractkit/chainlink/blob/v0.9.7/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [160](https://github.com/smartcontractkit/chainlink/blob/v0.9.7/evm-contracts/src/v0.7/interfaces/PointerInterface.sol), [161](https://github.com/smartcontractkit/chainlink/blob/v0.9.8/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [162](https://github.com/smartcontractkit/chainlink/blob/v0.9.8/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [163](https://github.com/smartcontractkit/chainlink/blob/v0.9.8/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [164](https://github.com/smartcontractkit/chainlink/blob/v0.9.8/evm-contracts/src/v0.7/interfaces/PointerInterface.sol), [165](https://github.com/smartcontractkit/chainlink/blob/vtest-2020-03-03/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [166](https://github.com/smartcontractkit/chainlink/blob/vtest-2020-03-03/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [167](https://github.com/smartcontractkit/chainlink/blob/vtest-2020-03-03/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [168](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/v4.1.0/contracts/proxy/beacon/IBeaconUpgradeable.sol), [169](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/v4.1.0-rc.0/contracts/proxy/beacon/IBeaconUpgradeable.sol), [170](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/v4.2.0/contracts/proxy/beacon/IBeaconUpgradeable.sol) |
| src/Aqua/PythPriceOracle.sol | IERC20 | (fuzzy) [0](https://github.com/smartcontractkit/chainlink/blob/0.8.0/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [1](https://github.com/smartcontractkit/chainlink/blob/0.8.0/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [2](https://github.com/smartcontractkit/chainlink/blob/0.8.0/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [3](https://github.com/smartcontractkit/chainlink/blob/chores-explorer-tags-for-dockerhub/evm/contracts/interfaces/PointerInterface.sol), [4](https://github.com/smartcontractkit/chainlink/blob/chores-explorer-tags-for-dockerhub/evm/v0.5/contracts/interfaces/PointerInterface.sol), [5](https://github.com/smartcontractkit/chainlink/blob/chores-v0.0.1/evm/contracts/interfaces/PointerInterface.sol), [6](https://github.com/smartcontractkit/chainlink/blob/chores-v0.0.1/evm/v0.5/contracts/interfaces/PointerInterface.sol), [7](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.0.1/evm/contracts/interfaces/PointerInterface.sol), [8](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.0.1/evm/v0.5/contracts/interfaces/PointerInterface.sol), [9](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.7.0/evm/contracts/interfaces/PointerInterface.sol), [10](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.7.0/evm/v0.5/contracts/interfaces/PointerInterface.sol), [11](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.0/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [12](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.0/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [13](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.0/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [14](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.1/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [15](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.1/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [16](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.1/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [17](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.2/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [18](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.2/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [19](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.2/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [20](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.3/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [21](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.3/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [22](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.3/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [23](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.4/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [24](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.4/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [25](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.4/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [26](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.5/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [27](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.5/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [28](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.5/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [29](https://github.com/smartcontractkit/chainlink/blob/upgrade/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [30](https://github.com/smartcontractkit/chainlink/blob/upgrade/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [31](https://github.com/smartcontractkit/chainlink/blob/upgrade/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [32](https://github.com/smartcontractkit/chainlink/blob/upgrade/evm-contracts/src/v0.7/interfaces/PointerInterface.sol), [33](https://github.com/smartcontractkit/chainlink/blob/v.0.8.12/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [34](https://github.com/smartcontractkit/chainlink/blob/v.0.8.12/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [35](https://github.com/smartcontractkit/chainlink/blob/v.0.8.12/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [36](https://github.com/smartcontractkit/chainlink/blob/v0.6.0/evm/contracts/interfaces/PointerInterface.sol), [37](https://github.com/smartcontractkit/chainlink/blob/v0.6.0/examples/testnet/contracts/Aggregator.sol), [38](https://github.com/smartcontractkit/chainlink/blob/v0.6.09/evm/contracts/interfaces/PointerInterface.sol), [39](https://github.com/smartcontractkit/chainlink/blob/v0.6.09/evm/v0.5/contracts/interfaces/PointerInterface.sol), [40](https://github.com/smartcontractkit/chainlink/blob/v0.6.1/evm/contracts/interfaces/PointerInterface.sol), [41](https://github.com/smartcontractkit/chainlink/blob/v0.6.1/examples/testnet/contracts/Aggregator.sol), [42](https://github.com/smartcontractkit/chainlink/blob/v0.6.10/evm/contracts/interfaces/PointerInterface.sol), [43](https://github.com/smartcontractkit/chainlink/blob/v0.6.10/evm/v0.5/contracts/interfaces/PointerInterface.sol), [44](https://github.com/smartcontractkit/chainlink/blob/v0.6.2/evm/contracts/interfaces/PointerInterface.sol), [45](https://github.com/smartcontractkit/chainlink/blob/v0.6.2/examples/testnet/contracts/Aggregator.sol), [46](https://github.com/smartcontractkit/chainlink/blob/v0.6.3/evm/contracts/interfaces/PointerInterface.sol), [47](https://github.com/smartcontractkit/chainlink/blob/v0.6.3/examples/testnet/contracts/Aggregator.sol), [48](https://github.com/smartcontractkit/chainlink/blob/v0.6.4/evm/contracts/interfaces/PointerInterface.sol), [49](https://github.com/smartcontractkit/chainlink/blob/v0.6.4/examples/testnet/contracts/Aggregator.sol), [50](https://github.com/smartcontractkit/chainlink/blob/v0.6.6/evm/contracts/interfaces/PointerInterface.sol), [51](https://github.com/smartcontractkit/chainlink/blob/v0.6.6/evm/v0.5/contracts/interfaces/PointerInterface.sol), [52](https://github.com/smartcontractkit/chainlink/blob/v0.6.7/evm/contracts/interfaces/PointerInterface.sol), [53](https://github.com/smartcontractkit/chainlink/blob/v0.6.7/evm/v0.5/contracts/interfaces/PointerInterface.sol), [54](https://github.com/smartcontractkit/chainlink/blob/v0.6.8/evm/contracts/interfaces/PointerInterface.sol), [55](https://github.com/smartcontractkit/chainlink/blob/v0.6.8/evm/v0.5/contracts/interfaces/PointerInterface.sol), [56](https://github.com/smartcontractkit/chainlink/blob/v0.6.9/evm/contracts/interfaces/PointerInterface.sol), [57](https://github.com/smartcontractkit/chainlink/blob/v0.6.9/evm/v0.5/contracts/interfaces/PointerInterface.sol), [58](https://github.com/smartcontractkit/chainlink/blob/v0.7.0/evm/contracts/interfaces/PointerInterface.sol), [59](https://github.com/smartcontractkit/chainlink/blob/v0.7.0/evm/v0.5/contracts/interfaces/PointerInterface.sol), [60](https://github.com/smartcontractkit/chainlink/blob/v0.7.1/evm/contracts/interfaces/PointerInterface.sol), [61](https://github.com/smartcontractkit/chainlink/blob/v0.7.1/evm/v0.5/contracts/interfaces/PointerInterface.sol), [62](https://github.com/smartcontractkit/chainlink/blob/v0.7.2/evm/contracts/interfaces/PointerInterface.sol), [63](https://github.com/smartcontractkit/chainlink/blob/v0.7.2/evm/v0.5/contracts/interfaces/PointerInterface.sol), [64](https://github.com/smartcontractkit/chainlink/blob/v0.7.3/evm/contracts/interfaces/PointerInterface.sol), [65](https://github.com/smartcontractkit/chainlink/blob/v0.7.3/evm/v0.5/contracts/interfaces/PointerInterface.sol), [66](https://github.com/smartcontractkit/chainlink/blob/v0.7.4/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [67](https://github.com/smartcontractkit/chainlink/blob/v0.7.4/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [68](https://github.com/smartcontractkit/chainlink/blob/v0.7.4/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [69](https://github.com/smartcontractkit/chainlink/blob/v0.7.5/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [70](https://github.com/smartcontractkit/chainlink/blob/v0.7.5/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [71](https://github.com/smartcontractkit/chainlink/blob/v0.7.5/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [72](https://github.com/smartcontractkit/chainlink/blob/v0.7.6/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [73](https://github.com/smartcontractkit/chainlink/blob/v0.7.6/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [74](https://github.com/smartcontractkit/chainlink/blob/v0.7.6/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [75](https://github.com/smartcontractkit/chainlink/blob/v0.7.7/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [76](https://github.com/smartcontractkit/chainlink/blob/v0.7.7/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [77](https://github.com/smartcontractkit/chainlink/blob/v0.7.7/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [78](https://github.com/smartcontractkit/chainlink/blob/v0.7.8/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [79](https://github.com/smartcontractkit/chainlink/blob/v0.7.8/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [80](https://github.com/smartcontractkit/chainlink/blob/v0.7.8/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [81](https://github.com/smartcontractkit/chainlink/blob/v0.8.0/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [82](https://github.com/smartcontractkit/chainlink/blob/v0.8.0/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [83](https://github.com/smartcontractkit/chainlink/blob/v0.8.0/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [84](https://github.com/smartcontractkit/chainlink/blob/v0.8.1/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [85](https://github.com/smartcontractkit/chainlink/blob/v0.8.1/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [86](https://github.com/smartcontractkit/chainlink/blob/v0.8.1/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [87](https://github.com/smartcontractkit/chainlink/blob/v0.8.10/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [88](https://github.com/smartcontractkit/chainlink/blob/v0.8.10/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [89](https://github.com/smartcontractkit/chainlink/blob/v0.8.10/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [90](https://github.com/smartcontractkit/chainlink/blob/v0.8.11/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [91](https://github.com/smartcontractkit/chainlink/blob/v0.8.11/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [92](https://github.com/smartcontractkit/chainlink/blob/v0.8.11/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [93](https://github.com/smartcontractkit/chainlink/blob/v0.8.12/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [94](https://github.com/smartcontractkit/chainlink/blob/v0.8.12/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [95](https://github.com/smartcontractkit/chainlink/blob/v0.8.12/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [96](https://github.com/smartcontractkit/chainlink/blob/v0.8.13/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [97](https://github.com/smartcontractkit/chainlink/blob/v0.8.13/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [98](https://github.com/smartcontractkit/chainlink/blob/v0.8.13/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [99](https://github.com/smartcontractkit/chainlink/blob/v0.8.14/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [100](https://github.com/smartcontractkit/chainlink/blob/v0.8.14/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [101](https://github.com/smartcontractkit/chainlink/blob/v0.8.14/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [102](https://github.com/smartcontractkit/chainlink/blob/v0.8.15/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [103](https://github.com/smartcontractkit/chainlink/blob/v0.8.15/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [104](https://github.com/smartcontractkit/chainlink/blob/v0.8.15/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [105](https://github.com/smartcontractkit/chainlink/blob/v0.8.16/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [106](https://github.com/smartcontractkit/chainlink/blob/v0.8.16/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [107](https://github.com/smartcontractkit/chainlink/blob/v0.8.16/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [108](https://github.com/smartcontractkit/chainlink/blob/v0.8.17/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [109](https://github.com/smartcontractkit/chainlink/blob/v0.8.17/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [110](https://github.com/smartcontractkit/chainlink/blob/v0.8.17/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [111](https://github.com/smartcontractkit/chainlink/blob/v0.8.18/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [112](https://github.com/smartcontractkit/chainlink/blob/v0.8.18/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [113](https://github.com/smartcontractkit/chainlink/blob/v0.8.18/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [114](https://github.com/smartcontractkit/chainlink/blob/v0.8.2/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [115](https://github.com/smartcontractkit/chainlink/blob/v0.8.2/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [116](https://github.com/smartcontractkit/chainlink/blob/v0.8.2/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [117](https://github.com/smartcontractkit/chainlink/blob/v0.8.3/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [118](https://github.com/smartcontractkit/chainlink/blob/v0.8.3/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [119](https://github.com/smartcontractkit/chainlink/blob/v0.8.3/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [120](https://github.com/smartcontractkit/chainlink/blob/v0.8.4/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [121](https://github.com/smartcontractkit/chainlink/blob/v0.8.4/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [122](https://github.com/smartcontractkit/chainlink/blob/v0.8.4/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [123](https://github.com/smartcontractkit/chainlink/blob/v0.8.5/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [124](https://github.com/smartcontractkit/chainlink/blob/v0.8.5/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [125](https://github.com/smartcontractkit/chainlink/blob/v0.8.5/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [126](https://github.com/smartcontractkit/chainlink/blob/v0.8.6/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [127](https://github.com/smartcontractkit/chainlink/blob/v0.8.6/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [128](https://github.com/smartcontractkit/chainlink/blob/v0.8.6/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [129](https://github.com/smartcontractkit/chainlink/blob/v0.8.7/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [130](https://github.com/smartcontractkit/chainlink/blob/v0.8.7/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [131](https://github.com/smartcontractkit/chainlink/blob/v0.8.7/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [132](https://github.com/smartcontractkit/chainlink/blob/v0.8.8/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [133](https://github.com/smartcontractkit/chainlink/blob/v0.8.8/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [134](https://github.com/smartcontractkit/chainlink/blob/v0.8.8/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [135](https://github.com/smartcontractkit/chainlink/blob/v0.8.9/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [136](https://github.com/smartcontractkit/chainlink/blob/v0.8.9/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [137](https://github.com/smartcontractkit/chainlink/blob/v0.8.9/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [138](https://github.com/smartcontractkit/chainlink/blob/v0.9.0/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [139](https://github.com/smartcontractkit/chainlink/blob/v0.9.0/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [140](https://github.com/smartcontractkit/chainlink/blob/v0.9.0/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [141](https://github.com/smartcontractkit/chainlink/blob/v0.9.2/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [142](https://github.com/smartcontractkit/chainlink/blob/v0.9.2/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [143](https://github.com/smartcontractkit/chainlink/blob/v0.9.2/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [144](https://github.com/smartcontractkit/chainlink/blob/v0.9.3/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [145](https://github.com/smartcontractkit/chainlink/blob/v0.9.3/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [146](https://github.com/smartcontractkit/chainlink/blob/v0.9.3/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [147](https://github.com/smartcontractkit/chainlink/blob/v0.9.4/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [148](https://github.com/smartcontractkit/chainlink/blob/v0.9.4/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [149](https://github.com/smartcontractkit/chainlink/blob/v0.9.4/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [150](https://github.com/smartcontractkit/chainlink/blob/v0.9.5/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [151](https://github.com/smartcontractkit/chainlink/blob/v0.9.5/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [152](https://github.com/smartcontractkit/chainlink/blob/v0.9.5/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [153](https://github.com/smartcontractkit/chainlink/blob/v0.9.6/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [154](https://github.com/smartcontractkit/chainlink/blob/v0.9.6/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [155](https://github.com/smartcontractkit/chainlink/blob/v0.9.6/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [156](https://github.com/smartcontractkit/chainlink/blob/v0.9.6/evm-contracts/src/v0.7/interfaces/PointerInterface.sol), [157](https://github.com/smartcontractkit/chainlink/blob/v0.9.7/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [158](https://github.com/smartcontractkit/chainlink/blob/v0.9.7/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [159](https://github.com/smartcontractkit/chainlink/blob/v0.9.7/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [160](https://github.com/smartcontractkit/chainlink/blob/v0.9.7/evm-contracts/src/v0.7/interfaces/PointerInterface.sol), [161](https://github.com/smartcontractkit/chainlink/blob/v0.9.8/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [162](https://github.com/smartcontractkit/chainlink/blob/v0.9.8/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [163](https://github.com/smartcontractkit/chainlink/blob/v0.9.8/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [164](https://github.com/smartcontractkit/chainlink/blob/v0.9.8/evm-contracts/src/v0.7/interfaces/PointerInterface.sol), [165](https://github.com/smartcontractkit/chainlink/blob/vtest-2020-03-03/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [166](https://github.com/smartcontractkit/chainlink/blob/vtest-2020-03-03/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [167](https://github.com/smartcontractkit/chainlink/blob/vtest-2020-03-03/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [168](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/v4.1.0/contracts/proxy/beacon/IBeaconUpgradeable.sol), [169](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/v4.1.0-rc.0/contracts/proxy/beacon/IBeaconUpgradeable.sol), [170](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/v4.2.0/contracts/proxy/beacon/IBeaconUpgradeable.sol) |
| src/Aqua/RedStonePriceOracle.sol | IERC20Decimals | (fuzzy) [0](https://github.com/smartcontractkit/chainlink/blob/0.8.0/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [1](https://github.com/smartcontractkit/chainlink/blob/0.8.0/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [2](https://github.com/smartcontractkit/chainlink/blob/0.8.0/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [3](https://github.com/smartcontractkit/chainlink/blob/chores-explorer-tags-for-dockerhub/evm/contracts/interfaces/PointerInterface.sol), [4](https://github.com/smartcontractkit/chainlink/blob/chores-explorer-tags-for-dockerhub/evm/v0.5/contracts/interfaces/PointerInterface.sol), [5](https://github.com/smartcontractkit/chainlink/blob/chores-v0.0.1/evm/contracts/interfaces/PointerInterface.sol), [6](https://github.com/smartcontractkit/chainlink/blob/chores-v0.0.1/evm/v0.5/contracts/interfaces/PointerInterface.sol), [7](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.0.1/evm/contracts/interfaces/PointerInterface.sol), [8](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.0.1/evm/v0.5/contracts/interfaces/PointerInterface.sol), [9](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.7.0/evm/contracts/interfaces/PointerInterface.sol), [10](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.7.0/evm/v0.5/contracts/interfaces/PointerInterface.sol), [11](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.0/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [12](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.0/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [13](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.0/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [14](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.1/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [15](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.1/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [16](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.1/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [17](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.2/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [18](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.2/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [19](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.2/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [20](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.3/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [21](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.3/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [22](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.3/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [23](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.4/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [24](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.4/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [25](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.4/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [26](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.5/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [27](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.5/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [28](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.8.5/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [29](https://github.com/smartcontractkit/chainlink/blob/upgrade/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [30](https://github.com/smartcontractkit/chainlink/blob/upgrade/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [31](https://github.com/smartcontractkit/chainlink/blob/upgrade/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [32](https://github.com/smartcontractkit/chainlink/blob/upgrade/evm-contracts/src/v0.7/interfaces/PointerInterface.sol), [33](https://github.com/smartcontractkit/chainlink/blob/v.0.8.12/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [34](https://github.com/smartcontractkit/chainlink/blob/v.0.8.12/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [35](https://github.com/smartcontractkit/chainlink/blob/v.0.8.12/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [36](https://github.com/smartcontractkit/chainlink/blob/v0.6.0/evm/contracts/interfaces/PointerInterface.sol), [37](https://github.com/smartcontractkit/chainlink/blob/v0.6.0/examples/testnet/contracts/Aggregator.sol), [38](https://github.com/smartcontractkit/chainlink/blob/v0.6.09/evm/contracts/interfaces/PointerInterface.sol), [39](https://github.com/smartcontractkit/chainlink/blob/v0.6.09/evm/v0.5/contracts/interfaces/PointerInterface.sol), [40](https://github.com/smartcontractkit/chainlink/blob/v0.6.1/evm/contracts/interfaces/PointerInterface.sol), [41](https://github.com/smartcontractkit/chainlink/blob/v0.6.1/examples/testnet/contracts/Aggregator.sol), [42](https://github.com/smartcontractkit/chainlink/blob/v0.6.10/evm/contracts/interfaces/PointerInterface.sol), [43](https://github.com/smartcontractkit/chainlink/blob/v0.6.10/evm/v0.5/contracts/interfaces/PointerInterface.sol), [44](https://github.com/smartcontractkit/chainlink/blob/v0.6.2/evm/contracts/interfaces/PointerInterface.sol), [45](https://github.com/smartcontractkit/chainlink/blob/v0.6.2/examples/testnet/contracts/Aggregator.sol), [46](https://github.com/smartcontractkit/chainlink/blob/v0.6.3/evm/contracts/interfaces/PointerInterface.sol), [47](https://github.com/smartcontractkit/chainlink/blob/v0.6.3/examples/testnet/contracts/Aggregator.sol), [48](https://github.com/smartcontractkit/chainlink/blob/v0.6.4/evm/contracts/interfaces/PointerInterface.sol), [49](https://github.com/smartcontractkit/chainlink/blob/v0.6.4/examples/testnet/contracts/Aggregator.sol), [50](https://github.com/smartcontractkit/chainlink/blob/v0.6.6/evm/contracts/interfaces/PointerInterface.sol), [51](https://github.com/smartcontractkit/chainlink/blob/v0.6.6/evm/v0.5/contracts/interfaces/PointerInterface.sol), [52](https://github.com/smartcontractkit/chainlink/blob/v0.6.7/evm/contracts/interfaces/PointerInterface.sol), [53](https://github.com/smartcontractkit/chainlink/blob/v0.6.7/evm/v0.5/contracts/interfaces/PointerInterface.sol), [54](https://github.com/smartcontractkit/chainlink/blob/v0.6.8/evm/contracts/interfaces/PointerInterface.sol), [55](https://github.com/smartcontractkit/chainlink/blob/v0.6.8/evm/v0.5/contracts/interfaces/PointerInterface.sol), [56](https://github.com/smartcontractkit/chainlink/blob/v0.6.9/evm/contracts/interfaces/PointerInterface.sol), [57](https://github.com/smartcontractkit/chainlink/blob/v0.6.9/evm/v0.5/contracts/interfaces/PointerInterface.sol), [58](https://github.com/smartcontractkit/chainlink/blob/v0.7.0/evm/contracts/interfaces/PointerInterface.sol), [59](https://github.com/smartcontractkit/chainlink/blob/v0.7.0/evm/v0.5/contracts/interfaces/PointerInterface.sol), [60](https://github.com/smartcontractkit/chainlink/blob/v0.7.1/evm/contracts/interfaces/PointerInterface.sol), [61](https://github.com/smartcontractkit/chainlink/blob/v0.7.1/evm/v0.5/contracts/interfaces/PointerInterface.sol), [62](https://github.com/smartcontractkit/chainlink/blob/v0.7.2/evm/contracts/interfaces/PointerInterface.sol), [63](https://github.com/smartcontractkit/chainlink/blob/v0.7.2/evm/v0.5/contracts/interfaces/PointerInterface.sol), [64](https://github.com/smartcontractkit/chainlink/blob/v0.7.3/evm/contracts/interfaces/PointerInterface.sol), [65](https://github.com/smartcontractkit/chainlink/blob/v0.7.3/evm/v0.5/contracts/interfaces/PointerInterface.sol), [66](https://github.com/smartcontractkit/chainlink/blob/v0.7.4/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [67](https://github.com/smartcontractkit/chainlink/blob/v0.7.4/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [68](https://github.com/smartcontractkit/chainlink/blob/v0.7.4/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [69](https://github.com/smartcontractkit/chainlink/blob/v0.7.5/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [70](https://github.com/smartcontractkit/chainlink/blob/v0.7.5/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [71](https://github.com/smartcontractkit/chainlink/blob/v0.7.5/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [72](https://github.com/smartcontractkit/chainlink/blob/v0.7.6/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [73](https://github.com/smartcontractkit/chainlink/blob/v0.7.6/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [74](https://github.com/smartcontractkit/chainlink/blob/v0.7.6/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [75](https://github.com/smartcontractkit/chainlink/blob/v0.7.7/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [76](https://github.com/smartcontractkit/chainlink/blob/v0.7.7/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [77](https://github.com/smartcontractkit/chainlink/blob/v0.7.7/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [78](https://github.com/smartcontractkit/chainlink/blob/v0.7.8/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [79](https://github.com/smartcontractkit/chainlink/blob/v0.7.8/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [80](https://github.com/smartcontractkit/chainlink/blob/v0.7.8/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [81](https://github.com/smartcontractkit/chainlink/blob/v0.8.0/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [82](https://github.com/smartcontractkit/chainlink/blob/v0.8.0/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [83](https://github.com/smartcontractkit/chainlink/blob/v0.8.0/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [84](https://github.com/smartcontractkit/chainlink/blob/v0.8.1/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [85](https://github.com/smartcontractkit/chainlink/blob/v0.8.1/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [86](https://github.com/smartcontractkit/chainlink/blob/v0.8.1/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [87](https://github.com/smartcontractkit/chainlink/blob/v0.8.10/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [88](https://github.com/smartcontractkit/chainlink/blob/v0.8.10/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [89](https://github.com/smartcontractkit/chainlink/blob/v0.8.10/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [90](https://github.com/smartcontractkit/chainlink/blob/v0.8.11/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [91](https://github.com/smartcontractkit/chainlink/blob/v0.8.11/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [92](https://github.com/smartcontractkit/chainlink/blob/v0.8.11/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [93](https://github.com/smartcontractkit/chainlink/blob/v0.8.12/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [94](https://github.com/smartcontractkit/chainlink/blob/v0.8.12/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [95](https://github.com/smartcontractkit/chainlink/blob/v0.8.12/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [96](https://github.com/smartcontractkit/chainlink/blob/v0.8.13/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [97](https://github.com/smartcontractkit/chainlink/blob/v0.8.13/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [98](https://github.com/smartcontractkit/chainlink/blob/v0.8.13/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [99](https://github.com/smartcontractkit/chainlink/blob/v0.8.14/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [100](https://github.com/smartcontractkit/chainlink/blob/v0.8.14/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [101](https://github.com/smartcontractkit/chainlink/blob/v0.8.14/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [102](https://github.com/smartcontractkit/chainlink/blob/v0.8.15/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [103](https://github.com/smartcontractkit/chainlink/blob/v0.8.15/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [104](https://github.com/smartcontractkit/chainlink/blob/v0.8.15/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [105](https://github.com/smartcontractkit/chainlink/blob/v0.8.16/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [106](https://github.com/smartcontractkit/chainlink/blob/v0.8.16/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [107](https://github.com/smartcontractkit/chainlink/blob/v0.8.16/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [108](https://github.com/smartcontractkit/chainlink/blob/v0.8.17/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [109](https://github.com/smartcontractkit/chainlink/blob/v0.8.17/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [110](https://github.com/smartcontractkit/chainlink/blob/v0.8.17/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [111](https://github.com/smartcontractkit/chainlink/blob/v0.8.18/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [112](https://github.com/smartcontractkit/chainlink/blob/v0.8.18/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [113](https://github.com/smartcontractkit/chainlink/blob/v0.8.18/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [114](https://github.com/smartcontractkit/chainlink/blob/v0.8.2/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [115](https://github.com/smartcontractkit/chainlink/blob/v0.8.2/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [116](https://github.com/smartcontractkit/chainlink/blob/v0.8.2/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [117](https://github.com/smartcontractkit/chainlink/blob/v0.8.3/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [118](https://github.com/smartcontractkit/chainlink/blob/v0.8.3/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [119](https://github.com/smartcontractkit/chainlink/blob/v0.8.3/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [120](https://github.com/smartcontractkit/chainlink/blob/v0.8.4/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [121](https://github.com/smartcontractkit/chainlink/blob/v0.8.4/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [122](https://github.com/smartcontractkit/chainlink/blob/v0.8.4/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [123](https://github.com/smartcontractkit/chainlink/blob/v0.8.5/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [124](https://github.com/smartcontractkit/chainlink/blob/v0.8.5/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [125](https://github.com/smartcontractkit/chainlink/blob/v0.8.5/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [126](https://github.com/smartcontractkit/chainlink/blob/v0.8.6/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [127](https://github.com/smartcontractkit/chainlink/blob/v0.8.6/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [128](https://github.com/smartcontractkit/chainlink/blob/v0.8.6/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [129](https://github.com/smartcontractkit/chainlink/blob/v0.8.7/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [130](https://github.com/smartcontractkit/chainlink/blob/v0.8.7/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [131](https://github.com/smartcontractkit/chainlink/blob/v0.8.7/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [132](https://github.com/smartcontractkit/chainlink/blob/v0.8.8/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [133](https://github.com/smartcontractkit/chainlink/blob/v0.8.8/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [134](https://github.com/smartcontractkit/chainlink/blob/v0.8.8/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [135](https://github.com/smartcontractkit/chainlink/blob/v0.8.9/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [136](https://github.com/smartcontractkit/chainlink/blob/v0.8.9/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [137](https://github.com/smartcontractkit/chainlink/blob/v0.8.9/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [138](https://github.com/smartcontractkit/chainlink/blob/v0.9.0/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [139](https://github.com/smartcontractkit/chainlink/blob/v0.9.0/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [140](https://github.com/smartcontractkit/chainlink/blob/v0.9.0/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [141](https://github.com/smartcontractkit/chainlink/blob/v0.9.2/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [142](https://github.com/smartcontractkit/chainlink/blob/v0.9.2/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [143](https://github.com/smartcontractkit/chainlink/blob/v0.9.2/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [144](https://github.com/smartcontractkit/chainlink/blob/v0.9.3/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [145](https://github.com/smartcontractkit/chainlink/blob/v0.9.3/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [146](https://github.com/smartcontractkit/chainlink/blob/v0.9.3/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [147](https://github.com/smartcontractkit/chainlink/blob/v0.9.4/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [148](https://github.com/smartcontractkit/chainlink/blob/v0.9.4/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [149](https://github.com/smartcontractkit/chainlink/blob/v0.9.4/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [150](https://github.com/smartcontractkit/chainlink/blob/v0.9.5/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [151](https://github.com/smartcontractkit/chainlink/blob/v0.9.5/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [152](https://github.com/smartcontractkit/chainlink/blob/v0.9.5/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [153](https://github.com/smartcontractkit/chainlink/blob/v0.9.6/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [154](https://github.com/smartcontractkit/chainlink/blob/v0.9.6/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [155](https://github.com/smartcontractkit/chainlink/blob/v0.9.6/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [156](https://github.com/smartcontractkit/chainlink/blob/v0.9.6/evm-contracts/src/v0.7/interfaces/PointerInterface.sol), [157](https://github.com/smartcontractkit/chainlink/blob/v0.9.7/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [158](https://github.com/smartcontractkit/chainlink/blob/v0.9.7/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [159](https://github.com/smartcontractkit/chainlink/blob/v0.9.7/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [160](https://github.com/smartcontractkit/chainlink/blob/v0.9.7/evm-contracts/src/v0.7/interfaces/PointerInterface.sol), [161](https://github.com/smartcontractkit/chainlink/blob/v0.9.8/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [162](https://github.com/smartcontractkit/chainlink/blob/v0.9.8/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [163](https://github.com/smartcontractkit/chainlink/blob/v0.9.8/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [164](https://github.com/smartcontractkit/chainlink/blob/v0.9.8/evm-contracts/src/v0.7/interfaces/PointerInterface.sol), [165](https://github.com/smartcontractkit/chainlink/blob/vtest-2020-03-03/evm-contracts/src/v0.4/interfaces/PointerInterface.sol), [166](https://github.com/smartcontractkit/chainlink/blob/vtest-2020-03-03/evm-contracts/src/v0.5/interfaces/PointerInterface.sol), [167](https://github.com/smartcontractkit/chainlink/blob/vtest-2020-03-03/evm-contracts/src/v0.6/interfaces/PointerInterface.sol), [168](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/v4.1.0/contracts/proxy/beacon/IBeaconUpgradeable.sol), [169](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/v4.1.0-rc.0/contracts/proxy/beacon/IBeaconUpgradeable.sol), [170](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/v4.2.0/contracts/proxy/beacon/IBeaconUpgradeable.sol) |
| src/interfaces/IPeripheryState.sol | IPeripheryState | (fuzzy) [0](https://github.com/smartcontractkit/chainlink/blob/chores-explorer-tags-for-dockerhub/evm/contracts/interfaces/AggregatorInterface.sol), [1](https://github.com/smartcontractkit/chainlink/blob/chores-v0.0.1/evm/contracts/interfaces/AggregatorInterface.sol), [2](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.0.1/evm/contracts/interfaces/AggregatorInterface.sol), [3](https://github.com/smartcontractkit/chainlink/blob/explorer-v0.7.0/evm/contracts/interfaces/AggregatorInterface.sol), [4](https://github.com/smartcontractkit/chainlink/blob/v0.6.0/evm/contracts/interfaces/AggregatorInterface.sol), [5](https://github.com/smartcontractkit/chainlink/blob/v0.6.0/examples/testnet/contracts/AggregatorProxy.sol), [6](https://github.com/smartcontractkit/chainlink/blob/v0.6.09/evm/contracts/interfaces/AggregatorInterface.sol), [7](https://github.com/smartcontractkit/chainlink/blob/v0.6.1/evm/contracts/interfaces/AggregatorInterface.sol), [8](https://github.com/smartcontractkit/chainlink/blob/v0.6.1/examples/testnet/contracts/AggregatorProxy.sol), [9](https://github.com/smartcontractkit/chainlink/blob/v0.6.10/evm/contracts/interfaces/AggregatorInterface.sol), [10](https://github.com/smartcontractkit/chainlink/blob/v0.6.2/evm/contracts/interfaces/AggregatorInterface.sol), [11](https://github.com/smartcontractkit/chainlink/blob/v0.6.2/examples/testnet/contracts/AggregatorProxy.sol), [12](https://github.com/smartcontractkit/chainlink/blob/v0.6.3/evm/contracts/interfaces/AggregatorInterface.sol), [13](https://github.com/smartcontractkit/chainlink/blob/v0.6.3/examples/testnet/contracts/AggregatorProxy.sol), [14](https://github.com/smartcontractkit/chainlink/blob/v0.6.4/evm/contracts/interfaces/AggregatorInterface.sol), [15](https://github.com/smartcontractkit/chainlink/blob/v0.6.4/examples/testnet/contracts/AggregatorProxy.sol), [16](https://github.com/smartcontractkit/chainlink/blob/v0.6.6/evm/contracts/interfaces/AggregatorInterface.sol), [17](https://github.com/smartcontractkit/chainlink/blob/v0.6.7/evm/contracts/interfaces/AggregatorInterface.sol), [18](https://github.com/smartcontractkit/chainlink/blob/v0.6.8/evm/contracts/interfaces/AggregatorInterface.sol), [19](https://github.com/smartcontractkit/chainlink/blob/v0.6.9/evm/contracts/interfaces/AggregatorInterface.sol), [20](https://github.com/smartcontractkit/chainlink/blob/v0.7.0/evm/contracts/interfaces/AggregatorInterface.sol) |

</div>


## <span id=t-report>Report</span>

### Overview

The analysis finished with **`0`** errors and **`0`** duplicate files.





#### <span id=t-risk>Risk</span>

<div class="wrapper" style="max-width: 512px; margin: auto">
			<canvas id="chart-risk-summary"></canvas>
</div>

#### <span id=t-source-lines>Source Lines (sloc vs. nsloc)</span>

<div class="wrapper" style="max-width: 512px; margin: auto">
    <canvas id="chart-nsloc-total"></canvas>
</div>

#### <span id=t-inline-documentation>Inline Documentation</span>

- **Comment-to-Source Ratio:** On average there are`2.49` code lines per comment (lower=better).
- **ToDo's:** `0` 

#### <span id=t-components>Components</span>

| 📝Contracts   | 📚Libraries | 🔍Interfaces | 🎨Abstract |
| ------------- | ----------- | ------------ | ---------- |
| 26 | 7  | 21  | 23 |

#### <span id=t-exposed-functions>Exposed Functions</span>

This section lists functions that are explicitly declared public or payable. Please note that getter methods for public stateVars are not included.  

| 🌐Public   | 💰Payable |
| ---------- | --------- |
| 317 | 29  | 

| External   | Internal | Private | Pure | View |
| ---------- | -------- | ------- | ---- | ---- |
| 249 | 403  | 10 | 49 | 98 |

#### <span id=t-statevariables>StateVariables</span>

| Total      | 🌐Public  |
| ---------- | --------- |
| 183  | 134 |

#### <span id=t-capabilities>Capabilities</span>

| Solidity Versions observed | 🧪 Experimental Features | 💰 Can Receive Funds | 🖥 Uses Assembly | 💣 Has Destroyable Contracts | 
| -------------------------- | ------------------------ | -------------------- | ---------------- | ---------------------------- |
| `0.8.17`<br/>`^0.8.10` |  | `yes` | `yes` <br/>(13 asm blocks) | **** | 

| 📤 Transfers ETH | ⚡ Low-Level Calls | 👥 DelegateCall | 🧮 Uses Hash Functions | 🔖 ECRecover | 🌀 New/Create/Create2 |
| ---------------- | ----------------- | --------------- | ---------------------- | ------------ | --------------------- |
| `yes` | **** | `yes` | `yes` | **** | `yes`<br>→ `NewContract:ERC1967Proxy` | 

| ♻️ TryCatch | Σ Unchecked |
| ---------- | ----------- |
| **** | `yes` |

#### <span id=t-package-imports>Dependencies / External Imports</span>

| Dependency / Import Path | Count  | 
| ------------------------ | ------ |
| @openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol | 4 |
| @openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol | 3 |
| @openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol | 6 |
| @openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol | 3 |
| @openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol | 3 |
| @openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol | 3 |
| @openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol | 2 |
| @openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol | 3 |
| @openzeppelin/contracts/access/Ownable.sol | 3 |
| @openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol | 1 |
| @openzeppelin/contracts/token/ERC20/IERC20.sol | 6 |
| @openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol | 4 |
| @openzeppelin/contracts/utils/Context.sol | 1 |
| @openzeppelin/contracts/utils/cryptography/EIP712.sol | 1 |
| @openzeppelin/contracts/utils/math/SafeCast.sol | 3 |
| @pythnetwork/pyth-sdk-solidity/IPyth.sol | 1 |
| @pythnetwork/pyth-sdk-solidity/PythStructs.sol | 1 |
| @redstone-finance/evm-connector/contracts/data-services/PrimaryProdDataServiceConsumerBase.sol | 1 |

#### <span id=t-totals>Totals</span>

##### Summary

<div class="wrapper" style="max-width: 90%; margin: auto">
    <canvas id="chart-num-bar"></canvas>
</div>

##### AST Node Statistics

###### Function Calls

<div class="wrapper" style="max-width: 90%; margin: auto">
    <canvas id="chart-num-bar-ast-funccalls"></canvas>
</div>

###### Assembly Calls

<div class="wrapper" style="max-width: 90%; margin: auto">
    <canvas id="chart-num-bar-ast-asmcalls"></canvas>
</div>

###### AST Total

<div class="wrapper" style="max-width: 90%; margin: auto">
    <canvas id="chart-num-bar-ast"></canvas>
</div>

##### Inheritance Graph

<a onclick="toggleVisibility('surya-inherit', this)">[➕]</a>
<div id="surya-inherit" style="display:none">
<div class="wrapper" style="max-width: 512px; margin: auto">
    <div id="surya-inheritance" style="text-align: center;"></div> 
</div>
</div>

##### CallGraph

<a onclick="toggleVisibility('surya-call', this)">[➕]</a>
<div id="surya-call" style="display:none">
<div class="wrapper" style="max-width: 512px; margin: auto">
    <div id="surya-callgraph" style="text-align: center;"></div>
</div>
</div>

###### Contract Summary

<a onclick="toggleVisibility('surya-mdreport', this)">[➕]</a>
<div id="surya-mdreport" style="display:none">
 Sūrya's Description Report

 Files Description Table


|  File Name  |  SHA-1 Hash  |
|-------------|--------------|
| src/Blacklistable.sol | [object Promise] |
| src/ExternalSwapRouterUpgradeable.sol | [object Promise] |
| src/NativePool.sol | [object Promise] |
| src/NativePoolFactory.sol | [object Promise] |
| src/NativeRfqPool.sol | [object Promise] |
| src/NativeRouter.sol | [object Promise] |
| src/Registry.sol | [object Promise] |
| src/Aqua/AquaLpToken.sol | [object Promise] |
| src/Aqua/AquaVault.sol | [object Promise] |
| src/Aqua/AquaVaultSignatureCheck.sol | [object Promise] |
| src/Aqua/ChainlinkPriceOracle.sol | [object Promise] |
| src/Aqua/PullModelPriceOracle.sol | [object Promise] |
| src/Aqua/PythPriceOracle.sol | [object Promise] |
| src/Aqua/RedStonePriceOracle.sol | [object Promise] |
| src/Compound/BaseJumpRateModelV2.sol | [object Promise] |
| src/Compound/CErc20.sol | [object Promise] |
| src/Compound/CToken.sol | [object Promise] |
| src/Compound/CTokenInterfaces.sol | [object Promise] |
| src/Compound/Comptroller.sol | [object Promise] |
| src/Compound/ComptrollerInterface.sol | [object Promise] |
| src/Compound/ComptrollerStorage.sol | [object Promise] |
| src/Compound/EIP20NonStandardInterface.sol | [object Promise] |
| src/Compound/ErrorReporter.sol | [object Promise] |
| src/Compound/ExponentialNoError.sol | [object Promise] |
| src/Compound/InterestRateModel.sol | [object Promise] |
| src/Compound/JumpRateModelV2.sol | [object Promise] |
| src/Compound/PriceOracle.sol | [object Promise] |
| src/interfaces/IAquaLpToken.sol | [object Promise] |
| src/interfaces/IAquaVault.sol | [object Promise] |
| src/interfaces/IMulticall.sol | [object Promise] |
| src/interfaces/INativePool.sol | [object Promise] |
| src/interfaces/INativePoolFactory.sol | [object Promise] |
| src/interfaces/INativeRfqPool.sol | [object Promise] |
| src/interfaces/INativeRouter.sol | [object Promise] |
| src/interfaces/INativeTreasury.sol | [object Promise] |
| src/interfaces/IPeripheryState.sol | [object Promise] |
| src/interfaces/IPricer.sol | [object Promise] |
| src/interfaces/ISwapCallback.sol | [object Promise] |
| src/interfaces/IUniswapV3SwapRouter.sol | [object Promise] |
| src/interfaces/IWETH9.sol | [object Promise] |
| src/libraries/AquaVaultLogic.sol | [object Promise] |
| src/libraries/BytesLib.sol | [object Promise] |
| src/libraries/CallbackValidation.sol | [object Promise] |
| src/libraries/FullMath.sol | [object Promise] |
| src/libraries/Multicall.sol | [object Promise] |
| src/libraries/NoDelegateCallUpgradable.sol | [object Promise] |
| src/libraries/Order.sol | [object Promise] |
| src/libraries/PeripheryPayments.sol | [object Promise] |
| src/libraries/PeripheryState.sol | [object Promise] |
| src/libraries/PeripheryValidation.sol | [object Promise] |
| src/libraries/SafeCast.sol | [object Promise] |
| src/libraries/TransferHelper.sol | [object Promise] |
| src/libraries/Weth9Unwrapper.sol | [object Promise] |
| src/storage/AquaVaultStorage.sol | [object Promise] |
| src/storage/NativePoolFactoryStorage.sol | [object Promise] |
| src/storage/NativePoolStorage.sol | [object Promise] |
| src/storage/NativeRfqPoolStorage.sol | [object Promise] |
| src/storage/NativeRouterStorage.sol | [object Promise] |


 Contracts Description Table


|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     └      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **Blacklistable** | Implementation | OwnableUpgradeable |||
| └ | isBlacklisted | External ❗️ |   |NO❗️ |
| └ | blacklist | External ❗️ | 🛑  | onlyBlacklister |
| └ | unBlacklist | External ❗️ | 🛑  | onlyBlacklister |
| └ | updateBlacklister | External ❗️ | 🛑  | onlyOwner |
||||||
| **ExternalSwapRouterUpgradeable** | Implementation | Initializable |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | calculateTokenAmount | Private 🔐 |   | |
| └ | externalSwap | Internal 🔒 | 🛑  | |
| └ | emitExternalSwapEvent | Private 🔐 | 🛑  | |
| └ | prepareTokenIn | Internal 🔒 | 🛑  | |
||||||
| **NativePool** | Implementation | INativePool, EIP712Upgradeable, ReentrancyGuardUpgradeable, OwnableUpgradeable, PausableUpgradeable, NoDelegateCallUpgradable, Blacklistable, UUPSUpgradeable, NativePoolStorage |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | initialize | External ❗️ | 🛑  | initializer |
| └ | _authorizeUpgrade | Internal 🔒 |   | |
| └ | getImplementation | Public ❗️ |   |NO❗️ |
| └ | setRouter | Internal 🔒 | 🛑  | |
| └ | isOnChainPricing | Public ❗️ |   |NO❗️ |
| └ | setPauser | External ❗️ | 🛑  | onlyOwner |
| └ | pause | External ❗️ | 🛑  | onlyOwnerOrPauserOrPoolFactory |
| └ | unpause | External ❗️ | 🛑  | onlyOwner |
| └ | setTreasury | External ❗️ | 🛑  | onlyOwner |
| └ | addSigner | External ❗️ | 🛑  | onlyOwner whenNotPaused |
| └ | removeSigner | External ❗️ | 🛑  | onlyOwner whenNotPaused |
| └ | swap | External ❗️ | 🛑  | nonReentrant whenNotPaused onlyRouter |
| └ | pairExist | Public ❗️ |   |NO❗️ |
| └ | getTokenAs | Public ❗️ |   |NO❗️ |
| └ | getTokenBs | Public ❗️ |   |NO❗️ |
| └ | getPairPricingModel | Public ❗️ |   |NO❗️ |
| └ | getPairFee | Public ❗️ |   |NO❗️ |
| └ | executeUpdatePairs | Private 🔐 | 🛑  | |
| └ | updatePairs | Public ❗️ | 🛑  | whenNotPaused onlyPrivateTreasury |
| └ | removePair | Public ❗️ | 🛑  | whenNotPaused |
| └ | getAmountOut | Public ❗️ |   |NO❗️ |
| └ | getPricingModelRegistry | Public ❗️ |   |NO❗️ |
| └ | calculateTokenAmount | Private 🔐 |   | |
| └ | executeSwap | Private 🔐 | 🛑  | |
| └ | getMessageHash | Internal 🔒 |   | |
| └ | verifySignature | Internal 🔒 |   | |
| └ | executeSwapFromTreasury | Internal 🔒 | 🛑  | |
| └ | executeSwapToTreasury | Internal 🔒 | 🛑  | |
||||||
| **IPool** | Interface |  |||
| └ | poolFactory | External ❗️ |   |NO❗️ |
| └ | getImplementation | External ❗️ |   |NO❗️ |
||||||
| **NativePoolFactory** | Implementation | INativePoolFactory, OwnableUpgradeable, NoDelegateCallUpgradable, PausableUpgradeable, UUPSUpgradeable, NativePoolFactoryStorage, ReentrancyGuardUpgradeable |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | initialize | Public ❗️ | 🛑  | initializer |
| └ | _authorizeUpgrade | Internal 🔒 | 🛑  | onlyOwner |
| └ | getImplementation | Public ❗️ |   |NO❗️ |
| └ | setPauser | External ❗️ | 🛑  | onlyOwner |
| └ | pause | External ❗️ | 🛑  | onlyOwnerOrPauser |
| └ | pausePools | External ❗️ | 🛑  | onlyOwnerOrPauser |
| └ | unpause | External ❗️ | 🛑  | onlyOwner |
| └ | addMultiPoolTreasury | External ❗️ | 🛑  | onlyOwner whenNotPaused |
| └ | removeMultiPoolTreasury | External ❗️ | 🛑  | onlyOwner whenNotPaused |
| └ | createNewPool | External ❗️ | 🛑  | whenNotPaused nonReentrant nonZeroAddressInput |
| └ | upgradePools | External ❗️ | 🛑  | onlyOwner |
| └ | upgradePool | External ❗️ | 🛑  | onlyOwner |
| └ | setPoolImplementation | External ❗️ | 🛑  | onlyOwner |
| └ | _upgradePool | Internal 🔒 | 🛑  | |
| └ | setRegistry | Public ❗️ | 🛑  | onlyOwner nonZeroAddressInput |
| └ | getPool | Public ❗️ |   |NO❗️ |
| └ | verifyPool | Public ❗️ |   |NO❗️ |
| └ | isRfqPool | Public ❗️ |   |NO❗️ |
| └ | createNewRfqPool | Public ❗️ | 🛑  | whenNotPaused onlyOwner |
||||||
| **NativeRfqPool** | Implementation | INativeRfqPool, Initializable, Context, UUPSUpgradeable, EIP712Upgradeable, NativeRfqPoolStorage |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | <Receive Ether> | External ❗️ |  💵 |NO❗️ |
| └ | _authorizeUpgrade | Internal 🔒 |   | |
| └ | getImplementation | Public ❗️ |   |NO❗️ |
| └ | initialize | Public ❗️ | 🛑  | initializer |
| └ | setPendingOwner | Public ❗️ | 🛑  | onlyOwner |
| └ | acceptOwner | Public ❗️ | 🛑  |NO❗️ |
| └ | setTreasury | Public ❗️ | 🛑  | onlyOwner |
| └ | tradeRFQT | External ❗️ | 🛑  | onlyRouter |
| └ | updateSigner | External ❗️ | 🛑  | onlyOwner |
| └ | setPostTradeCallback | External ❗️ | 🛑  | onlyOwner |
| └ | setPause | External ❗️ | 🛑  | onlyOwner |
| └ | _updateNonce | Internal 🔒 | 🛑  | |
| └ | _transferFromTreasury | Private 🔐 | 🛑  | |
| └ | verifySignature | Internal 🔒 |   | |
||||||
| **NativeRouter** | Implementation | INativeRouter, PeripheryPayments, ReentrancyGuardUpgradeable, OwnableUpgradeable, UUPSUpgradeable, EIP712Upgradeable, Multicall, NativeRouterStorage, PausableUpgradeable, ExternalSwapRouterUpgradeable |||
| └ | initialize | Public ❗️ | 🛑  | initializer |
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | getImplementation | Public ❗️ |   |NO❗️ |
| └ | _authorizeUpgrade | Internal 🔒 | 🛑  | onlyOwner |
| └ | setWeth9Unwrapper | Public ❗️ | 🛑  | onlyOwner |
| └ | setPauser | External ❗️ | 🛑  | onlyOwner |
| └ | pause | External ❗️ | 🛑  | onlyOwnerOrPauser |
| └ | unpause | External ❗️ | 🛑  | onlyOwner |
| └ | setWidgetFeeSigner | Public ❗️ | 🛑  | onlyOwner |
| └ | swapCallback | External ❗️ | 🛑  | whenNotPaused |
| └ | setContractCallerWhitelistToggle | External ❗️ | 🛑  | onlyOwner |
| └ | setContractCallerWhitelist | External ❗️ | 🛑  | onlyOwner |
| └ | setExternalRouterWhitelist | External ❗️ | 🛑  | onlyOwner |
| └ | exactInputSingle | External ❗️ |  💵 | nonReentrant whenNotPaused onlyEOAorWhitelistContract |
| └ | exactInput | External ❗️ |  💵 | nonReentrant whenNotPaused onlyEOAorWhitelistContract |
| └ | refundResidual | Internal 🔒 | 🛑  | |
| └ | processWidgetFee | Internal 🔒 | 🛑  | |
| └ | exactInputInternal | Private 🔐 | 🛑  | |
| └ | getExactInputMessageHash | Internal 🔒 |   | |
| └ | verifyWidgetFeeSignature | Internal 🔒 |   | |
| └ | sweepToken | Public ❗️ |  💵 | onlyOwner |
| └ | refundETHRecipient | Public ❗️ |  💵 | onlyOwner |
| └ | unwrapWETH9 | Public ❗️ |  💵 | nonReentrant |
| └ | unwrapWETH9 | External ❗️ |  💵 | nonReentrant |
| └ | tradeRFQT | External ❗️ |  💵 |NO❗️ |
| └ | _validateRFQTQuote | Private 🔐 |   | |
| └ | verifyRfqWidgetFeeSignature | Private 🔐 |   | |
||||||
| **Registry** | Implementation | Ownable |||
| └ | <Constructor> | Public ❗️ | 🛑  | Ownable |
| └ | registerPricer | Public ❗️ | 🛑  | onlyOwner |
| └ | getAmountOut | Public ❗️ |   |NO❗️ |
| └ | _getAmountOut | Internal 🔒 |   | |
||||||
| **AquaLpTokenStorage** | Implementation |  |||
||||||
| **AquaLpToken** | Implementation | CErc20, UUPSUpgradeable, AquaLpTokenStorage |||
| └ | initialize | Public ❗️ | 🛑  | initializer |
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | getImplementation | Public ❗️ |   |NO❗️ |
| └ | _authorizeUpgrade | Internal 🔒 |   | onlyAdmin |
| └ | setAquaVault | Public ❗️ | 🛑  | onlyAdmin |
| └ | updateNetBorrow | External ❗️ | 🛑  | onlyAquaVault |
| └ | updateReserve | External ❗️ | 🛑  | onlyAquaVault |
| └ | exchangeRateStoredInternal | Internal 🔒 |   | |
| └ | getCashPrior | Internal 🔒 |   | |
| └ | doTransferIn | Internal 🔒 | 🛑  | |
| └ | doTransferOut | Internal 🔒 | 🛑  | |
| └ | accrueInterest | Public ❗️ | 🛑  |NO❗️ |
| └ | borrowRatePerTimestamp | External ❗️ |   |NO❗️ |
| └ | supplyRatePerTimestamp | External ❗️ |   |NO❗️ |
| └ | updatePrices | Public ❗️ |  💵 |NO❗️ |
| └ | updatePricesAndBorrow | Public ❗️ |  💵 |NO❗️ |
| └ | updatePricesAndRedeem | Public ❗️ |  💵 |NO❗️ |
| └ | updatePricesAndRedeemUnderlying | Public ❗️ |  💵 |NO❗️ |
| └ | updatePricesAndLiquidateBorrow | Public ❗️ |  💵 |NO❗️ |
||||||
| **AquaVault** | Implementation | Comptroller, INativeTreasuryV2, UUPSUpgradeable, IAquaVault, AquaVaultStorage |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | getImplementation | Public ❗️ |   |NO❗️ |
| └ | _authorizeUpgrade | Internal 🔒 |   | onlyAdmin |
| └ | initialize | Public ❗️ | 🛑  | initializer ensureNonZeroAddress |
| └ | nativeTreasuryCallback | External ❗️ | 🛑  |NO❗️ |
| └ | pay | External ❗️ | 🛑  |NO❗️ |
| └ | setPendingAdmin | External ❗️ | 🛑  | ensureNonZeroAddress |
| └ | acceptAdmin | External ❗️ | 🛑  |NO❗️ |
| └ | setNativePool | External ❗️ | 🛑  | onlyAdmin ensureNonZeroAddress |
| └ | setSignatureCheck | External ❗️ | 🛑  | onlyAdmin ensureNonZeroAddress |
| └ | setAllowance | External ❗️ | 🛑  | onlyAdmin |
| └ | setTrader | External ❗️ | 🛑  | onlyAdmin |
| └ | setSigner | External ❗️ | 🛑  | onlyAdmin ensureNonZeroAddress |
| └ | setEpochUpdater | External ❗️ | 🛑  | onlyAdmin ensureNonZeroAddress |
| └ | supportMarket | External ❗️ | 🛑  | onlyAdmin |
| └ | positionEpochUpdate | External ❗️ | 🛑  |NO❗️ |
| └ | repay | External ❗️ | 🛑  |NO❗️ |
| └ | settle | External ❗️ | 🛑  | onlyTraderOrSettler |
| └ | addCollateral | External ❗️ | 🛑  |NO❗️ |
| └ | removeCollateral | External ❗️ | 🛑  | onlyTraderOrSettler |
| └ | liquidate | External ❗️ | 🛑  | onlyLiquidator |
||||||
| **AquaVaultSignatureCheck** | Implementation | EIP712 |||
| └ | <Constructor> | Public ❗️ | 🛑  | EIP712 |
| └ | setAquaVault | External ❗️ | 🛑  |NO❗️ |
| └ | verifySettleSignature | External ❗️ | 🛑  | onlyAquaVault |
| └ | verifyRemoveCollateralSignature | External ❗️ | 🛑  | onlyAquaVault |
| └ | verifyLiquidationSignature | External ❗️ | 🛑  | onlyAquaVault |
||||||
| **ChainlinkAggregator** | Interface |  |||
| └ | decimals | External ❗️ |   |NO❗️ |
| └ | latestRoundData | External ❗️ |   |NO❗️ |
||||||
| **IERC20Decimal** | Interface |  |||
| └ | decimals | External ❗️ |   |NO❗️ |
||||||
| **ChainlinkPriceOracle** | Implementation | PriceOracle |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | getUnderlyingPrice | External ❗️ |   |NO❗️ |
| └ | setPriceFeed | External ❗️ | 🛑  |NO❗️ |
||||||
| **PullModelPriceOracle** | Implementation | PriceOracle |||
| └ | updatePrices | External ❗️ |  💵 |NO❗️ |
||||||
| **PythPriceOracle** | Implementation | PullModelPriceOracle, Ownable |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | updatePrices | External ❗️ |  💵 |NO❗️ |
| └ | setPriceId | External ❗️ | 🛑  | onlyOwner |
| └ | setPriceExpiryTime | External ❗️ | 🛑  | onlyOwner |
| └ | getUnderlyingPrice | External ❗️ |   |NO❗️ |
| └ | withdrawStuckEth | External ❗️ | 🛑  | onlyOwner |
| └ | _transferETHAndWrapIfFailWithGasLimit | Internal 🔒 | 🛑  | |
||||||
| **IERC20** | Interface |  |||
| └ | decimals | External ❗️ |   |NO❗️ |
||||||
| **RedStonePriceOracle** | Implementation | PullModelPriceOracle, Ownable, PrimaryProdDataServiceConsumerBase |||
| └ | extractPrice | Public ❗️ |   |NO❗️ |
| └ | updatePrices | External ❗️ |  💵 |NO❗️ |
| └ | setPriceId | External ❗️ | 🛑  | onlyOwner |
| └ | setPriceExpiryTime | External ❗️ | 🛑  | onlyOwner |
| └ | getUnderlyingPrice | External ❗️ |   |NO❗️ |
||||||
| **IERC20Decimals** | Interface |  |||
| └ | decimals | External ❗️ |   |NO❗️ |
||||||
| **BaseJumpRateModelV2** | Implementation | InterestRateModel |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | updateJumpRateModel | External ❗️ | 🛑  |NO❗️ |
| └ | utilizationRate | Public ❗️ |   |NO❗️ |
| └ | getBorrowRateInternal | Internal 🔒 |   | |
| └ | getSupplyRate | Public ❗️ |   |NO❗️ |
| └ | updateJumpRateModelInternal | Internal 🔒 | 🛑  | |
||||||
| **CompLike** | Interface |  |||
| └ | delegate | External ❗️ | 🛑  |NO❗️ |
||||||
| **CErc20** | Implementation | CToken, CErc20Interface |||
| └ | mint | External ❗️ | 🛑  |NO❗️ |
| └ | redeem | External ❗️ | 🛑  |NO❗️ |
| └ | redeemUnderlying | External ❗️ | 🛑  |NO❗️ |
| └ | borrow | External ❗️ | 🛑  |NO❗️ |
| └ | repayBorrow | External ❗️ | 🛑  |NO❗️ |
| └ | repayBorrowBehalf | External ❗️ | 🛑  |NO❗️ |
| └ | liquidateBorrow | External ❗️ | 🛑  |NO❗️ |
| └ | sweepToken | External ❗️ | 🛑  |NO❗️ |
| └ | _addReserves | External ❗️ | 🛑  |NO❗️ |
||||||
| **CToken** | Implementation | CTokenInterface, ExponentialNoError, TokenErrorReporter |||
| └ | transferTokens | Internal 🔒 | 🛑  | |
| └ | transfer | External ❗️ | 🛑  | nonReentrant |
| └ | transferFrom | External ❗️ | 🛑  | nonReentrant |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
| └ | allowance | External ❗️ |   |NO❗️ |
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | balanceOfUnderlying | External ❗️ | 🛑  |NO❗️ |
| └ | getAccountSnapshot | External ❗️ |   |NO❗️ |
| └ | getBlockTimestamp | Internal 🔒 |   | |
| └ | totalBorrowsCurrent | External ❗️ | 🛑  | nonReentrant |
| └ | borrowBalanceCurrent | External ❗️ | 🛑  | nonReentrant |
| └ | borrowBalanceStored | Public ❗️ |   |NO❗️ |
| └ | borrowBalanceStoredInternal | Internal 🔒 |   | |
| └ | exchangeRateCurrent | Public ❗️ | 🛑  | nonReentrant |
| └ | exchangeRateStored | Public ❗️ |   |NO❗️ |
| └ | exchangeRateStoredInternal | Internal 🔒 |   | |
| └ | getCash | External ❗️ |   |NO❗️ |
| └ | accrueInterest | Public ❗️ | 🛑  |NO❗️ |
| └ | mintInternal | Internal 🔒 | 🛑  | nonReentrant |
| └ | mintFresh | Internal 🔒 | 🛑  | |
| └ | redeemInternal | Internal 🔒 | 🛑  | nonReentrant |
| └ | redeemUnderlyingInternal | Internal 🔒 | 🛑  | nonReentrant |
| └ | redeemFresh | Internal 🔒 | 🛑  | |
| └ | borrowInternal | Internal 🔒 | 🛑  | nonReentrant |
| └ | borrowFresh | Internal 🔒 | 🛑  | |
| └ | repayBorrowInternal | Internal 🔒 | 🛑  | nonReentrant |
| └ | repayBorrowBehalfInternal | Internal 🔒 | 🛑  | nonReentrant |
| └ | repayBorrowFresh | Internal 🔒 | 🛑  | |
| └ | liquidateBorrowInternal | Internal 🔒 | 🛑  | nonReentrant |
| └ | liquidateBorrowFresh | Internal 🔒 | 🛑  | |
| └ | seize | External ❗️ | 🛑  | nonReentrant |
| └ | seizeInternal | Internal 🔒 | 🛑  | |
| └ | _setPendingAdmin | External ❗️ | 🛑  |NO❗️ |
| └ | _acceptAdmin | External ❗️ | 🛑  |NO❗️ |
| └ | _setComptroller | Public ❗️ | 🛑  |NO❗️ |
| └ | _setReserveFactor | External ❗️ | 🛑  | nonReentrant |
| └ | _setReserveFactorFresh | Internal 🔒 | 🛑  | |
| └ | _addReservesInternal | Internal 🔒 | 🛑  | nonReentrant |
| └ | _addReservesFresh | Internal 🔒 | 🛑  | |
| └ | _reduceReserves | External ❗️ | 🛑  | nonReentrant |
| └ | _reduceReservesFresh | Internal 🔒 | 🛑  | |
| └ | _setInterestRateModel | Public ❗️ | 🛑  |NO❗️ |
| └ | _setInterestRateModelFresh | Internal 🔒 | 🛑  | |
| └ | getCashPrior | Internal 🔒 |   | |
| └ | doTransferIn | Internal 🔒 | 🛑  | |
| └ | doTransferOut | Internal 🔒 | 🛑  | |
||||||
| **CTokenStorage** | Implementation |  |||
||||||
| **CTokenInterface** | Implementation | CTokenStorage |||
| └ | transfer | External ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | External ❗️ | 🛑  |NO❗️ |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
| └ | allowance | External ❗️ |   |NO❗️ |
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | balanceOfUnderlying | External ❗️ | 🛑  |NO❗️ |
| └ | getAccountSnapshot | External ❗️ |   |NO❗️ |
| └ | borrowRatePerTimestamp | External ❗️ |   |NO❗️ |
| └ | supplyRatePerTimestamp | External ❗️ |   |NO❗️ |
| └ | totalBorrowsCurrent | External ❗️ | 🛑  |NO❗️ |
| └ | borrowBalanceCurrent | External ❗️ | 🛑  |NO❗️ |
| └ | borrowBalanceStored | External ❗️ |   |NO❗️ |
| └ | exchangeRateCurrent | External ❗️ | 🛑  |NO❗️ |
| └ | exchangeRateStored | External ❗️ |   |NO❗️ |
| └ | getCash | External ❗️ |   |NO❗️ |
| └ | accrueInterest | External ❗️ | 🛑  |NO❗️ |
| └ | seize | External ❗️ | 🛑  |NO❗️ |
| └ | _setPendingAdmin | External ❗️ | 🛑  |NO❗️ |
| └ | _acceptAdmin | External ❗️ | 🛑  |NO❗️ |
| └ | _setComptroller | External ❗️ | 🛑  |NO❗️ |
| └ | _setReserveFactor | External ❗️ | 🛑  |NO❗️ |
| └ | _reduceReserves | External ❗️ | 🛑  |NO❗️ |
| └ | _setInterestRateModel | External ❗️ | 🛑  |NO❗️ |
||||||
| **CErc20Storage** | Implementation |  |||
||||||
| **CErc20Interface** | Implementation | CErc20Storage |||
| └ | mint | External ❗️ | 🛑  |NO❗️ |
| └ | redeem | External ❗️ | 🛑  |NO❗️ |
| └ | redeemUnderlying | External ❗️ | 🛑  |NO❗️ |
| └ | borrow | External ❗️ | 🛑  |NO❗️ |
| └ | repayBorrow | External ❗️ | 🛑  |NO❗️ |
| └ | repayBorrowBehalf | External ❗️ | 🛑  |NO❗️ |
| └ | liquidateBorrow | External ❗️ | 🛑  |NO❗️ |
| └ | sweepToken | External ❗️ | 🛑  |NO❗️ |
| └ | _addReserves | External ❗️ | 🛑  |NO❗️ |
||||||
| **CDelegationStorage** | Implementation |  |||
||||||
| **CDelegatorInterface** | Implementation | CDelegationStorage |||
| └ | _setImplementation | External ❗️ | 🛑  |NO❗️ |
||||||
| **CDelegateInterface** | Implementation | CDelegationStorage |||
| └ | _becomeImplementation | External ❗️ | 🛑  |NO❗️ |
| └ | _resignImplementation | External ❗️ | 🛑  |NO❗️ |
||||||
| **Comptroller** | Implementation | ComptrollerV4Storage, ComptrollerInterface, ComptrollerErrorReporter, ExponentialNoError, Initializable |||
| └ | __Comptroller_init | Internal 🔒 | 🛑  | onlyInitializing |
| └ | getAssetsIn | External ❗️ |   |NO❗️ |
| └ | checkMembership | External ❗️ |   |NO❗️ |
| └ | enterMarkets | Public ❗️ | 🛑  |NO❗️ |
| └ | addToMarketInternal | Internal 🔒 | 🛑  | |
| └ | exitMarket | External ❗️ | 🛑  |NO❗️ |
| └ | mintAllowed | External ❗️ | 🛑  |NO❗️ |
| └ | mintVerify | External ❗️ | 🛑  |NO❗️ |
| └ | redeemAllowed | External ❗️ | 🛑  |NO❗️ |
| └ | redeemAllowedInternal | Internal 🔒 |   | |
| └ | redeemVerify | External ❗️ | 🛑  |NO❗️ |
| └ | borrowAllowed | Public ❗️ | 🛑  |NO❗️ |
| └ | borrowVerify | External ❗️ | 🛑  |NO❗️ |
| └ | repayBorrowAllowed | External ❗️ | 🛑  |NO❗️ |
| └ | repayBorrowVerify | External ❗️ | 🛑  |NO❗️ |
| └ | liquidateBorrowAllowed | External ❗️ | 🛑  |NO❗️ |
| └ | liquidateBorrowVerify | External ❗️ | 🛑  |NO❗️ |
| └ | seizeAllowed | External ❗️ | 🛑  |NO❗️ |
| └ | seizeVerify | External ❗️ | 🛑  |NO❗️ |
| └ | transferAllowed | External ❗️ | 🛑  |NO❗️ |
| └ | transferVerify | External ❗️ | 🛑  |NO❗️ |
| └ | getAccountLiquidity | Public ❗️ |   |NO❗️ |
| └ | getAccountLiquidityInternal | Internal 🔒 |   | |
| └ | getHypotheticalAccountLiquidity | Public ❗️ |   |NO❗️ |
| └ | getHypotheticalAccountLiquidityInternal | Internal 🔒 |   | |
| └ | liquidateCalculateSeizeTokens | External ❗️ |   |NO❗️ |
| └ | _setPriceOracle | Public ❗️ | 🛑  |NO❗️ |
| └ | _setCloseFactor | External ❗️ | 🛑  |NO❗️ |
| └ | _setCollateralFactor | External ❗️ | 🛑  |NO❗️ |
| └ | _setLiquidationIncentive | External ❗️ | 🛑  |NO❗️ |
| └ | _supportMarket | Internal 🔒 | 🛑  | |
| └ | _addMarketInternal | Internal 🔒 | 🛑  | |
| └ | _setMarketBorrowCaps | External ❗️ | 🛑  |NO❗️ |
| └ | _setBorrowCapGuardian | External ❗️ | 🛑  |NO❗️ |
| └ | _setPauseGuardian | Public ❗️ | 🛑  |NO❗️ |
| └ | _setMintPaused | Public ❗️ | 🛑  |NO❗️ |
| └ | _setBorrowPaused | Public ❗️ | 🛑  |NO❗️ |
| └ | _setRedeemPaused | Public ❗️ | 🛑  |NO❗️ |
| └ | _setSeizePaused | Public ❗️ | 🛑  |NO❗️ |
| └ | getAllMarkets | Public ❗️ |   |NO❗️ |
| └ | isDeprecated | Public ❗️ |   |NO❗️ |
| └ | getBlockTimestamp | Public ❗️ |   |NO❗️ |
||||||
| **ComptrollerInterface** | Implementation |  |||
| └ | enterMarkets | External ❗️ | 🛑  |NO❗️ |
| └ | exitMarket | External ❗️ | 🛑  |NO❗️ |
| └ | mintAllowed | External ❗️ | 🛑  |NO❗️ |
| └ | mintVerify | External ❗️ | 🛑  |NO❗️ |
| └ | redeemAllowed | External ❗️ | 🛑  |NO❗️ |
| └ | redeemVerify | External ❗️ | 🛑  |NO❗️ |
| └ | borrowAllowed | External ❗️ | 🛑  |NO❗️ |
| └ | borrowVerify | External ❗️ | 🛑  |NO❗️ |
| └ | repayBorrowAllowed | External ❗️ | 🛑  |NO❗️ |
| └ | repayBorrowVerify | External ❗️ | 🛑  |NO❗️ |
| └ | liquidateBorrowAllowed | External ❗️ | 🛑  |NO❗️ |
| └ | liquidateBorrowVerify | External ❗️ | 🛑  |NO❗️ |
| └ | seizeAllowed | External ❗️ | 🛑  |NO❗️ |
| └ | seizeVerify | External ❗️ | 🛑  |NO❗️ |
| └ | transferAllowed | External ❗️ | 🛑  |NO❗️ |
| └ | transferVerify | External ❗️ | 🛑  |NO❗️ |
| └ | liquidateCalculateSeizeTokens | External ❗️ |   |NO❗️ |
||||||
| **UnitrollerAdminStorage** | Implementation |  |||
||||||
| **ComptrollerV1Storage** | Implementation | UnitrollerAdminStorage |||
||||||
| **ComptrollerV2Storage** | Implementation | ComptrollerV1Storage |||
||||||
| **ComptrollerV3Storage** | Implementation | ComptrollerV2Storage |||
||||||
| **ComptrollerV4Storage** | Implementation | ComptrollerV3Storage |||
||||||
| **EIP20NonStandardInterface** | Interface |  |||
| └ | totalSupply | External ❗️ |   |NO❗️ |
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | transfer | External ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | External ❗️ | 🛑  |NO❗️ |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
| └ | allowance | External ❗️ |   |NO❗️ |
||||||
| **ComptrollerErrorReporter** | Implementation |  |||
| └ | fail | Internal 🔒 | 🛑  | |
| └ | failOpaque | Internal 🔒 | 🛑  | |
||||||
| **TokenErrorReporter** | Implementation |  |||
||||||
| **ExponentialNoError** | Implementation |  |||
| └ | truncate | Internal 🔒 |   | |
| └ | mul_ScalarTruncate | Internal 🔒 |   | |
| └ | mul_ScalarTruncateAddUInt | Internal 🔒 |   | |
| └ | lessThanExp | Internal 🔒 |   | |
| └ | lessThanOrEqualExp | Internal 🔒 |   | |
| └ | greaterThanExp | Internal 🔒 |   | |
| └ | isZeroExp | Internal 🔒 |   | |
| └ | safe224 | Internal 🔒 |   | |
| └ | safe32 | Internal 🔒 |   | |
| └ | add_ | Internal 🔒 |   | |
| └ | add_ | Internal 🔒 |   | |
| └ | add_ | Internal 🔒 |   | |
| └ | sub_ | Internal 🔒 |   | |
| └ | sub_ | Internal 🔒 |   | |
| └ | sub_ | Internal 🔒 |   | |
| └ | mul_ | Internal 🔒 |   | |
| └ | mul_ | Internal 🔒 |   | |
| └ | mul_ | Internal 🔒 |   | |
| └ | mul_ | Internal 🔒 |   | |
| └ | mul_ | Internal 🔒 |   | |
| └ | mul_ | Internal 🔒 |   | |
| └ | mul_ | Internal 🔒 |   | |
| └ | div_ | Internal 🔒 |   | |
| └ | div_ | Internal 🔒 |   | |
| └ | div_ | Internal 🔒 |   | |
| └ | div_ | Internal 🔒 |   | |
| └ | div_ | Internal 🔒 |   | |
| └ | div_ | Internal 🔒 |   | |
| └ | div_ | Internal 🔒 |   | |
| └ | fraction | Internal 🔒 |   | |
||||||
| **InterestRateModel** | Implementation |  |||
| └ | getBorrowRate | External ❗️ |   |NO❗️ |
| └ | getSupplyRate | External ❗️ |   |NO❗️ |
||||||
| **JumpRateModelV2** | Implementation | InterestRateModel, BaseJumpRateModelV2 |||
| └ | getBorrowRate | External ❗️ |   |NO❗️ |
| └ | <Constructor> | Public ❗️ | 🛑  | BaseJumpRateModelV2 |
||||||
| **PriceOracle** | Implementation |  |||
| └ | getUnderlyingPrice | External ❗️ |   |NO❗️ |
||||||
| **IAquaLpToken** | Interface |  |||
| └ | mint | External ❗️ | 🛑  |NO❗️ |
| └ | redeem | External ❗️ | 🛑  |NO❗️ |
| └ | redeemUnderlying | External ❗️ | 🛑  |NO❗️ |
| └ | repay | External ❗️ | 🛑  |NO❗️ |
||||||
| **IAquaVault** | Interface |  |||
||||||
| **IMulticall** | Interface |  |||
| └ | multicall | External ❗️ |  💵 |NO❗️ |
| └ | multicall | External ❗️ |  💵 |NO❗️ |
||||||
| **INativePool** | Interface |  |||
| └ | initialize | External ❗️ | 🛑  |NO❗️ |
| └ | setTreasury | External ❗️ | 🛑  |NO❗️ |
| └ | addSigner | External ❗️ | 🛑  |NO❗️ |
| └ | removeSigner | External ❗️ | 🛑  |NO❗️ |
| └ | swap | External ❗️ | 🛑  |NO❗️ |
| └ | setPauser | External ❗️ | 🛑  |NO❗️ |
||||||
| **INativePoolFactory** | Interface |  |||
| └ | createNewPool | External ❗️ | 🛑  |NO❗️ |
| └ | upgradePools | External ❗️ | 🛑  |NO❗️ |
| └ | upgradePool | External ❗️ | 🛑  |NO❗️ |
| └ | getPool | External ❗️ |   |NO❗️ |
| └ | verifyPool | External ❗️ |   |NO❗️ |
| └ | setPoolImplementation | External ❗️ | 🛑  |NO❗️ |
| └ | setPauser | External ❗️ | 🛑  |NO❗️ |
| └ | isRfqPool | External ❗️ |   |NO❗️ |
||||||
| **INativeRfqPool** | Interface |  |||
| └ | tradeRFQT | External ❗️ | 🛑  |NO❗️ |
||||||
| **INativeRouter** | Interface | ISwapCallback |||
| └ | setWidgetFeeSigner | External ❗️ | 🛑  |NO❗️ |
| └ | setPauser | External ❗️ | 🛑  |NO❗️ |
| └ | setContractCallerWhitelistToggle | External ❗️ | 🛑  |NO❗️ |
| └ | setContractCallerWhitelist | External ❗️ | 🛑  |NO❗️ |
| └ | exactInputSingle | External ❗️ |  💵 |NO❗️ |
| └ | tradeRFQT | External ❗️ |  💵 |NO❗️ |
| └ | exactInput | External ❗️ |  💵 |NO❗️ |
||||||
| **INativeTreasury** | Interface |  |||
| └ | syncReserve | External ❗️ | 🛑  |NO❗️ |
| └ | getReserves | External ❗️ |   |NO❗️ |
| └ | setPoolAddress | External ❗️ | 🛑  |NO❗️ |
| └ | token0 | External ❗️ |   |NO❗️ |
| └ | token1 | External ❗️ |   |NO❗️ |
||||||
| **INativeTreasuryV2** | Interface |  |||
| └ | nativeTreasuryCallback | External ❗️ | 🛑  |NO❗️ |
||||||
| **IPeripheryState** | Interface |  |||
| └ | factory | External ❗️ |   |NO❗️ |
| └ | WETH9 | External ❗️ |   |NO❗️ |
||||||
| **IPricer** | Interface |  |||
| └ | getAmountOut | External ❗️ |   |NO❗️ |
||||||
| **ISwapCallback** | Interface |  |||
| └ | swapCallback | External ❗️ | 🛑  |NO❗️ |
||||||
| **IUniswapV3SwapRouter** | Interface |  |||
| └ | exactInputSingle | External ❗️ |  💵 |NO❗️ |
||||||
| **IWETH9** | Interface | IERC20 |||
| └ | deposit | External ❗️ |  💵 |NO❗️ |
| └ | withdraw | External ❗️ | 🛑  |NO❗️ |
| └ | symbol | External ❗️ |   |NO❗️ |
| └ | decimals | External ❗️ |   |NO❗️ |
||||||
| **AquaVaultLogic** | Library |  |||
| └ | swapCallback | External ❗️ | 🛑  |NO❗️ |
| └ | pay | External ❗️ | 🛑  |NO❗️ |
| └ | setAllowance | External ❗️ | 🛑  |NO❗️ |
| └ | positionEpochUpdate | External ❗️ | 🛑  |NO❗️ |
| └ | repay | External ❗️ | 🛑  |NO❗️ |
| └ | settle | External ❗️ | 🛑  |NO❗️ |
| └ | addCollateral | External ❗️ | 🛑  |NO❗️ |
| └ | removeCollateral | External ❗️ | 🛑  |NO❗️ |
| └ | liquidate | External ❗️ | 🛑  |NO❗️ |
| └ | updatePositions | Internal 🔒 | 🛑  | |
| └ | validateCredit | Internal 🔒 |   | |
| └ | getCredit | Internal 🔒 |   | |
||||||
| **BytesLib** | Library |  |||
| └ | slice | Internal 🔒 |   | |
| └ | toAddress | Internal 🔒 |   | |
| └ | toUint24 | Internal 🔒 |   | |
| └ | toUint256 | Internal 🔒 |   | |
||||||
| **CallbackValidation** | Library |  |||
| └ | verifyCallback | Internal 🔒 |   | |
||||||
| **FullMath** | Library |  |||
| └ | mulDiv | Internal 🔒 |   | |
| └ | mulDivRoundingUp | Internal 🔒 |   | |
||||||
| **Multicall** | Implementation | IMulticall, PeripheryValidation |||
| └ | multicall | Public ❗️ |  💵 |NO❗️ |
| └ | multicall | External ❗️ |  💵 | checkDeadline |
||||||
| **NoDelegateCallUpgradable** | Implementation | Initializable |||
| └ | __NoDelegateCall_init | Internal 🔒 | 🛑  | onlyInitializing |
| └ | __NoDelegateCall_init_unchained | Internal 🔒 | 🛑  | onlyInitializing |
| └ | checkNotDelegateCall | Private 🔐 |   | |
||||||
| **Orders** | Library |  |||
| └ | hasMultiplePools | Internal 🔒 |   | |
| └ | numPools | Internal 🔒 |   | |
| └ | decodeFirstOrder | Internal 🔒 |   | |
| └ | getFirstOrder | Internal 🔒 |   | |
| └ | skipOrder | Internal 🔒 |   | |
||||||
| **PeripheryPayments** | Implementation | PeripheryState |||
| └ | <Receive Ether> | External ❗️ |  💵 |NO❗️ |
| └ | wrapETH | External ❗️ |  💵 |NO❗️ |
| └ | pull | External ❗️ |  💵 |NO❗️ |
| └ | pay | Internal 🔒 | 🛑  | |
||||||
| **PeripheryState** | Implementation | IPeripheryState |||
| └ | initializeState | Internal 🔒 | 🛑  | |
| └ | setWeth9Unwrapper | Public ❗️ | 🛑  |NO❗️ |
||||||
| **PeripheryValidation** | Implementation |  |||
||||||
| **SafeCast** | Library |  |||
| └ | toUint160 | Internal 🔒 |   | |
| └ | toInt128 | Internal 🔒 |   | |
| └ | toInt256 | Internal 🔒 |   | |
||||||
| **TransferHelper** | Library |  |||
| └ | safeTransferFrom | Internal 🔒 | 🛑  | |
| └ | safeTransfer | Internal 🔒 | 🛑  | |
| └ | safeIncreaseAllowance | Internal 🔒 | 🛑  | |
| └ | safeDecreaseAllowance | Internal 🔒 | 🛑  | |
| └ | safeTransferETH | Internal 🔒 | 🛑  | |
||||||
| **Weth9Unwrapper** | Implementation |  |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | <Receive Ether> | External ❗️ |  💵 |NO❗️ |
| └ | unwrapWeth9 | Public ❗️ | 🛑  |NO❗️ |
||||||
| **AquaVaultStorage** | Implementation |  |||
||||||
| **NativePoolFactoryStorage** | Implementation |  |||
||||||
| **NativePoolStorage** | Implementation |  |||
||||||
| **NativeRfqPoolStorage** | Implementation |  |||
||||||
| **NativeRouterStorage** | Implementation |  |||


 Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |
 

</div>
____
<sub>
Thinking about smart contract security? We can provide training, ongoing advice, and smart contract auditing. [Contact us](https://consensys.io/diligence/contact/).
</sub>


