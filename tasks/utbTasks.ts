import {
  addParams,
  buildScriptCmd,
  chainParam,
  chainsParam,
  getForknetDeployerAddress,
  getForknetTestClient,
  ParamAdder,
  Runtime,
  runtimeParam,
  srcDstParam,
  TaskType,
  uncensor,
} from "../lib/decent-bridge/src/hardhat";
import { task } from "hardhat/config";
import { exec } from "shelljs";
import { getAddress, parseEther, parseUnits } from "viem";

export const valueParam = (targetTask: TaskType): TaskType =>
  targetTask.addParam<string>("value", "value");

const scriptPath = (name: string) => `script/OnchainScripts.s.sol:${name}`;

const makeSimpleScript = ({
  taskName,
  scriptName,
  paramAdders,
}: {
  taskName: string;
  scriptName: string;
  paramAdders: ParamAdder[];
}) =>
  addParams(
    paramAdders,
    task<{
      runtime: Runtime;
      [key: string]: string;
    }>(taskName, async ({ runtime, ...envs }, hre) => {
      let cmd = buildScriptCmd(envs, scriptPath(scriptName), runtime);
      console.log(`running cmd: "${cmd}"`);
      cmd = uncensor(cmd, runtime);
      exec(cmd);
    }),
  );

const makeXChainScript = (taskName: string, scriptName: string) =>
  makeSimpleScript({
    taskName,
    scriptName,
    paramAdders: [runtimeParam, srcDstParam],
  });

const makeDeployScript = (taskName: string, scriptName: string) =>
  makeSimpleScript({
    taskName,
    scriptName,
    paramAdders: [runtimeParam, chainParam],
  });

const scriptWithChainParam = makeDeployScript;

addParams(
  [chainParam],
  task<{
    chain: string;
    user: string;
    amount: string;
  }>("set-balance", async ({ chain, user, amount }, hre) => {
    const testClient = await getForknetTestClient({ hre, chain });
    await testClient.setBalance({
      address: getAddress(user),
      value: parseEther(amount),
    });
  })
    .addParam<string>("user", "address of the user to set the balance for")
    .addParam<string>("amount", "amount (in eth)"),
);

addParams(
  [runtimeParam, chainParam],
  task<{
    runtime: Runtime;
    chain: string;
    to: string;
    amount: string;
  }>("mint-usdc", async ({ runtime, chain, to, amount }, hre) => {
    const envs = {
      chain,
      to,
      amount: parseUnits(amount, 6).toString(),
    };
    let cmd = buildScriptCmd(envs, scriptPath("MintUsdcTo"), runtime);
    console.log(`running cmd: "${cmd}"`);
    cmd = uncensor(cmd, runtime);
    exec(cmd);
  })
    .addParam<string>("amount", "amount (in usd)")
    .addParam<string>("to", "user to mint usdc to "),
);

addParams(
  [runtimeParam, srcDstParam],
  task<{
    runtime: Runtime;
    src: string;
    dst: string;
  }>("wire-up-utb", async ({ runtime, src, dst }, hre) => {
    await Promise.all([
      hre.run("wire-up-utb-src-to-dst", { runtime, src, dst }),
      hre.run("wire-up-utb-src-to-dst", { runtime, src: dst, dst: src }),
    ]);
  }),
);

makeDeployScript("deploy-everything", "DeployEverything");
makeDeployScript("deploy-utb", "DeployUTB");
makeDeployScript("deploy-nft", "DeployNft");
makeDeployScript("debug-decent-bridge", "DeployDecentBridge");
scriptWithChainParam("bobs-balance", "GetBobsBalance");
makeXChainScript("mint-nft-xchain", "MintNftXchain");

export const deployDecentBridgeParam = (targetTask: TaskType): TaskType =>
  targetTask.addOptionalParam<string>(
    "deployDecentBridge",
    "If you want to deploy decent bridge as well",
    "false",
  );

export const wireUpDecentBridgeParam = (targetTask: TaskType): TaskType =>
  targetTask.addOptionalParam<string>(
    "wireUpDecentBridge",
    "If you want to wire up decent bridge contracts as well",
    "false",
  );

addParams(
  [runtimeParam, srcDstParam, wireUpDecentBridgeParam],
  task<{
    runtime: Runtime;
    src: string;
    dst: string;
    wireUpDecentBridge: string;
  }>(
    "wire-up-utb-src-to-dst",
    async ({ runtime, src, dst, wireUpDecentBridge }, hre) => {
      let cmd = buildScriptCmd(
        {
          runtime,
          src,
          dst,
          wireUpDecentBridge,
        },
        scriptPath("WireUpUTB"),
        runtime,
      );
      console.log(`running cmd: "${cmd}"`);
      cmd = uncensor(cmd, runtime);
      exec(cmd);
    },
  ),
);

addParams(
  [runtimeParam, chainsParam, deployDecentBridgeParam],
  task<{
    runtime: Runtime;
    chains: string;
    deployDecentBridge: string;
  }>(
    "deploy-chains-utb",
    async ({ runtime, chains, deployDecentBridge: _decent }, hre) => {
      const deployDecentBridge = Boolean(_decent);
      await Promise.all(
        chains.split(",").map((chain) =>
          hre.run(deployDecentBridge ? "deploy-everything" : "deploy-utb", {
            runtime,
            chain,
          }),
        ),
      );
    },
  ),
);

addParams(
  [runtimeParam, chainsParam, wireUpDecentBridgeParam],
  task<{
    runtime: Runtime;
    chains: string;
    wireUpDecentBridge: string;
  }>("wire-up-chains", async ({ runtime, chains, wireUpDecentBridge }, hre) => {
    await Promise.all(
      chains.split(",").flatMap((src) =>
        chains
          .split(",")
          .filter((dst) => dst !== src)
          .map((dst) =>
            hre.run("wire-up-utb-src-to-dst", {
              runtime,
              src,
              dst,
              wireUpDecentBridge,
            }),
          ),
      ),
    );
  }),
);

addParams(
  [runtimeParam, chainsParam, deployDecentBridgeParam],
  task<{
    runtime: Runtime;
    chains: string;
    deployDecentBridge: string;
  }>(
    "deploy-and-wireup-chains-utb",
    async ({ runtime, chains, deployDecentBridge }, hre) => {
      await hre.run("deploy-chains-utb", {
        runtime,
        chains,
        deployDecentBridge,
      });
      await hre.run("wire-up-chains", {
        runtime,
        chains,
        wireUpDecentBridge: deployDecentBridge,
      });
    },
  ),
);

addParams(
  [runtimeParam, chainsParam],
  task<{
    runtime: Runtime;
    chains: string;
  }>(
    "dev",
    async ({ runtime, chains }, hre) => {
      await hre.run("kill-forks");
      await hre.run("start-forknets");
      await hre.run("deploy-chains-utb", {
        runtime,
        chains,
        deployDecentBridge: "true",
      });
      await hre.run("wire-up-chains", {
        runtime,
        chains,
        wireUpDecentBridge: "true",
      });
    },
  ),
);

addParams(
  [runtimeParam, chainParam],
  task<{
    runtime: Runtime;
    chain: string;
  }>("set-balance-alice", async ({ runtime, chain }, hre) => {
    const alice = getAddress("0x" + "0".repeat(35) + "a11ce");
    await hre.run("set-balance", { chain, user: alice, amount: "10" });
  }),
);

addParams(
  [runtimeParam, srcDstParam],
  task<{
    runtime: Runtime;
    src: string;
    dst: string;
  }>("end-to-end", async ({ runtime, src, dst }, hre) => {
    const chainsArray = [src, dst];
    const chains = chainsArray.join(",");
    const alice = getAddress("0x" + "0".repeat(35) + "a11ce");
    await Promise.all([
      hre.run("deploy-chains-utb", {
        runtime,
        chains,
        deployDecentBridge: "true",
      }),
      hre.run("deploy-nft", { runtime, chain: dst }),
      hre.run("set-balance", { chain: src, user: alice, amount: "10" }),
      hre.run("mint-usdc", {
        runtime,
        chain: src,
        to: getForknetDeployerAddress(),
        amount: "500",
      }),
      hre.run("mint-usdc", {
        runtime,
        chain: dst,
        to: getForknetDeployerAddress(),
        amount: "500",
      }),
    ]);
    await hre.run("wire-up-chains", {
      runtime,
      chains,
      wireUpDecentBridge: "true",
    });
    await hre.run("mint-nft-xchain", { runtime, src, dst });
  }),
);

addParams(
  [runtimeParam, chainParam, valueParam],
  task<{
    runtime: Runtime;
    chain: string;
    value: string;
    payload: string;
  }>("simulate-call", async ({ runtime, chain, value, payload }, hre) => {
    let cmd = buildScriptCmd(
      { chain, value, payload },
      scriptPath("Simulate"),
      runtime,
    );
    console.log(`running cmd: "${cmd}"`);
    cmd = uncensor(cmd, runtime);
    exec(cmd);
  }).addParam<string>("payload", "payload in hex"),
);

addParams(
  [runtimeParam, srcDstParam, valueParam],
  task<{
    runtime: Runtime;
    src: string;
    dst: string;
    gas: string;
    value: string;
    payload: string;
  }>(
    "simulate-xchain",
    async ({ runtime, src, dst, value, payload, gas }, hre) => {
      let cmd = buildScriptCmd(
        { src, dst, value, payload, gas },
        scriptPath("SimulateXChain"),
        runtime,
      );
      console.log(`running cmd: "${cmd}"`);
      cmd = uncensor(cmd, runtime);
      exec(cmd);
    },
  )
    .addParam<string>("payload", "payload in hex")
    .addOptionalParam<string>("gas", "gas for x-chain call", "2000000"),
);

addParams(
  [runtimeParam, srcDstParam],
  task<{
    runtime: Runtime;
    src: string;
    dst: string;
    blocks: string;
  }>("set-block-confirmations", async ({ runtime, src, dst, blocks }, hre) => {
    let cmd = buildScriptCmd(
      { src, dst, num_confirmations: blocks },
      scriptPath("SetNumBlockConfirmations"),
      runtime,
    );
    console.log(`running cmd: "${cmd}"`);
    cmd = uncensor(cmd, runtime);
    exec(cmd);
  }).addParam<string>("blocks", "number of blocks"),
);
