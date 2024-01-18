include .env

.phony: deploy-chain

COMMON_PARAMS := --broadcast -vvvv

ifeq ($(MAINNET),true)
    COMMON_PARAMS += --private-key=$(MAINNET_ACCOUNT) --verify --slow
else ifeq ($(TESTNET),true)
    COMMON_PARAMS += --private-key=$(TESTNET_ACCOUNT) --verify --slow
else
    COMMON_PARAMS += --unlocked --sender=$(TESTNET_ACCOUNT_ADDRESS)
endif

ANVIL_PRIVATE_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

DECIMALS := 1000000000000000000 # for convenience

add-liquidity:
	$(eval liquidity=$(shell echo "scale=10; $(amount) * $(DECIMALS)" | bc | sed 's/\..*//'))
	liquidity=$(liquidity) \
	forge script script/Scripts.s.sol:AddLiquidity $(COMMON_PARAMS)

run-script:
	forge script script/OnchainScripts.s.sol:$(script) $(COMMON_PARAMS)

deploy-chain:
	script=DeployEverything make run-script

wire-up:
	script=WireUpUTB make run-script

deploy-nft:
	script=DeployNft make run-script

mint-nft:
	script=MintNftXchain make run-script

deal-to-alice:
	script=DealToAlice make run-script

playground:
	script=Playground make run-script
