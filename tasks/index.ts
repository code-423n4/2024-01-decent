import { task, subtask } from 'hardhat/config';
import { exec } from 'shelljs';
import { parseEther } from 'viem';

const getRpcUrl = (chain: string) => `${chain.toUpperCase()}_RPC_URL`;
const getPrivateKey = (account: string) => `${account.toUpperCase()}_PRIVATE_KEY`;

task("deploy", "deploy bridge and utb")
  .addParam("chain", "the chain to deploy to")
  .addParam("account", "the account to use (mainnet, testnet)")
  .setAction(async ({ chain, account }) => {
    const script = 'script/Scripts.sol:Deploy';
    const rpcUrl = getRpcUrl(chain);
    const privateKey = getPrivateKey(account);
    const env = `CHAIN=${chain} PRIVATE_KEY=${privateKey}`;
    const cmd = `${env} forge script ${script} --rpc-url $${rpcUrl} --broadcast -vvvv`;
    console.log(cmd);
    exec(cmd);
  });

task("add-liquidity", "add liquidity to bridge")
  .addParam("chain", "the chain to add liquidity to")
  .addParam("amount", "the amount of liquidity to add (in eth)")
  .addParam("account", "the account to use (mainnet, testnet)")
  .setAction(async ({ chain, amount, account }) => {
    const script = 'script/Scripts.sol:AddLiquidity';
    const rpcUrl = getRpcUrl(chain);
    const privateKey = getPrivateKey(account);
    const amountInWei = parseEther(amount).toString();
    const env = `CHAIN=${chain} AMOUNT=${amountInWei} PRIVATE_KEY=${privateKey}`;
    const cmd = `${env} forge script ${script} --rpc-url $${rpcUrl} --broadcast -vvvv`;
    console.log(cmd);
    exec(cmd);
  });

task("remove-liquidity", "remove liquidity from bridge")
  .addParam("chain", "the chain to remove liquidity from")
  .addParam("amount", "the amount of liquidity to remove (in eth)")
  .addParam("account", "the account to use (mainnet, testnet)")
  .setAction(async ({ chain, amount, account }) => {
    const script = 'script/Scripts.sol:RemoveLiquidity';
    const rpcUrl = getRpcUrl(chain);
    const privateKey = getPrivateKey(account);
    const amountInWei = parseEther(amount).toString();
    const env = `CHAIN=${chain} AMOUNT=${amountInWei} PRIVATE_KEY=${privateKey}`;
    const cmd = `${env} forge script ${script} --rpc-url $${rpcUrl} --broadcast -vvvv`;
    console.log(cmd);
    exec(cmd);
  });

task("connect", "connect bridge and utb between chains")
  .addParam("src", "the src chain")
  .addParam("dst", "the dst chain")
  .addParam("account", "the account to use (mainnet, testnet)")
  .setAction(async ({ src, dst, account }) => {
      await hre.run("_connect", { src, dst, account });
      await hre.run("_connect", { src: dst, dst: src, account });
  });

subtask("_connect")
  .addParam("src", "the src chain")
  .addParam("dst", "the dst chain")
  .addParam("account", "the account to use (mainnet, testnet)")
  .setAction(async ({ src, dst, account }) => {
    const script = 'script/Scripts.sol:Connect';
    const rpcUrl = getRpcUrl(src);
    const privateKey = getPrivateKey(account);
    const env = `SRC=${src} DST=${dst} PRIVATE_KEY=${privateKey}`;
    const cmd = `${env} forge script ${script} --rpc-url $${rpcUrl} --broadcast -vvvv`;
    console.log(cmd);
    exec(cmd);
  });
