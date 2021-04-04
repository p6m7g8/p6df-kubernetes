# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

### [2.1.1](https://github.com/p6m7g8/p6df-kubernetes/compare/v2.1.0...v2.1.1) (2021-04-04)


* **link:** remove rendundant symlinks; echo for now ([#25](https://github.com/p6m7g8/p6df-kubernetes/issues/25)) ([12c0736](https://github.com/p6m7g8/p6df-kubernetes/commit/12c07367ccf4d330851e5f54e1b28d682f3c4f1b))
* **README:** updates generator ([#24](https://github.com/p6m7g8/p6df-kubernetes/issues/24)) ([6c3d08c](https://github.com/p6m7g8/p6df-kubernetes/commit/6c3d08c11a4129d6dc7e81ae52a357cea7838eb7))
* **vscode:** splits vscode extensions to their languages ([#26](https://github.com/p6m7g8/p6df-kubernetes/issues/26)) ([fddd9a9](https://github.com/p6m7g8/p6df-kubernetes/commit/fddd9a915e7b9e2c25706f8176322989e6c5d23e))
* Coc -> .github ([21155f4](https://github.com/p6m7g8/p6df-kubernetes/commit/21155f40d2146e8989ca8216e08b5813185192d9))

## [2.1.0](https://github.com/p6m7g8/p6df-kubernetes/compare/v2.0.0...v2.1.0) (2020-12-06)


### Features

* **api:** centralize ::version() ([4155525](https://github.com/p6m7g8/p6df-kubernetes/commit/4155525f4da513c3352e2d4ffc68535ce2ef91f6))
* **community:** adds CODE_OF_CONDUCT ([47aaf65](https://github.com/p6m7g8/p6df-kubernetes/commit/47aaf65e0afb6a3d2611469c74c3632b5ecfdc32))
* **github:** adds ISSUE_TEMPLATEs ([47cef20](https://github.com/p6m7g8/p6df-kubernetes/commit/47cef208f01746706c03aa158faf89211974c90f))


### Bug Fixes

* **brew:** cask -> --cask ([#22](https://github.com/p6m7g8/p6df-kubernetes/issues/22)) ([562dc8a](https://github.com/p6m7g8/p6df-kubernetes/commit/562dc8aff8ac74b4647c79f0a5ee216c63b06911))
* **p6df::modules::kubernetes::off:** correct `p6_env_unexport` -> `p6_env_export_un()` ([#13](https://github.com/p6m7g8/p6df-kubernetes/issues/13)) ([64d537f](https://github.com/p6m7g8/p6df-kubernetes/commit/64d537fdf7bf1af227c965d79edb0e838f8d46b1))


* **community:** rely on the .github/ in the org ([#20](https://github.com/p6m7g8/p6df-kubernetes/issues/20)) ([120471d](https://github.com/p6m7g8/p6df-kubernetes/commit/120471d0279fd3d4fa7c4c695e152d802a3c3430))
* **docs:** fixes whitespace ([339d649](https://github.com/p6m7g8/p6df-kubernetes/commit/339d6491b656fbf235619aff85f7de38d87ab088))
* **README:** fixes module expansion, adds CodeCov and Synk badges ([#21](https://github.com/p6m7g8/p6df-kubernetes/issues/21)) ([3d76cb1](https://github.com/p6m7g8/p6df-kubernetes/commit/3d76cb17cbd3eff6cadfd1435dbfba62ab907727))
* **README:** updates to template v2.0 ([bdf733f](https://github.com/p6m7g8/p6df-kubernetes/commit/bdf733f00a6efee4270c2cdbb952c5ae78c72334))
* **semantic:** no longer needed, defaults are fine ([cbd2325](https://github.com/p6m7g8/p6df-kubernetes/commit/cbd232578899f6d6f73f9f7a76ae8abfcf128caa))

## [2.0.0](https://github.com/p6m7g8/p6df-kubernetes/compare/v1.0.2...v2.0.0) (2020-10-11)


### Features

* **api:** use `p6_run_code()` ([#11](https://github.com/p6m7g8/p6df-kubernetes/issues/11)) ([141c03a](https://github.com/p6m7g8/p6df-kubernetes/commit/141c03a802bde18bd9aab4eaea0907c5e70ecfb4))
* **brew:** adds minishift ([#10](https://github.com/p6m7g8/p6df-kubernetes/issues/10)) ([38c8045](https://github.com/p6m7g8/p6df-kubernetes/commit/38c8045bcf8dca07cdcef46091690a8dd9761907))

### [1.0.2](https://github.com/p6m7g8/p6df-kubernetes/compare/v1.0.1...v1.0.2) (2020-09-27)


### Bug Fixes

* **module:** robbyrussell -> ohmyzsh ([#9](https://github.com/p6m7g8/p6df-kubernetes/issues/9)) ([c7ed104](https://github.com/p6m7g8/p6df-kubernetes/commit/c7ed10401c16ccc86a434c45f671be1870ebd29a))

### 1.0.1 (2020-09-20)


### Features

* **api:** move non shell glue out to lib ([#8](https://github.com/p6m7g8/p6df-kubernetes/issues/8)) ([1047d72](https://github.com/p6m7g8/p6df-kubernetes/commit/1047d721f372adf791cd953d63e160c572c95201))
* **api:** remove cruft ([#7](https://github.com/p6m7g8/p6df-kubernetes/issues/7)) ([3e9c793](https://github.com/p6m7g8/p6df-kubernetes/commit/3e9c7937f717866b35ac9b7c829a8e043de23529))
* **eks:** fargate, managed nodes, coredns, metrics, dashboard, prometheus, jenkins ([#5](https://github.com/p6m7g8/p6df-kubernetes/issues/5)) ([927f344](https://github.com/p6m7g8/p6df-kubernetes/commit/927f344a9889966424ccb82be7019a54b3cedee7))
* **prompt:** clean rooms prompt, drops kube-ps1, +p6_kubernetes_minikube_docker() ([#4](https://github.com/p6m7g8/p6df-kubernetes/issues/4)) ([ffa87a0](https://github.com/p6m7g8/p6df-kubernetes/commit/ffa87a096081b1e92aae151258a51242947354f9))
* **prompt:** sets up prompt integration, adds aliases, deconflicts brews ([#1](https://github.com/p6m7g8/p6df-kubernetes/issues/1)) ([babbd7c](https://github.com/p6m7g8/p6df-kubernetes/commit/babbd7cf2e198ada28ec5eabd0f890c8190b5be3))


### Bug Fixes

* **envs:** moved to p6df-core due to load order ([#3](https://github.com/p6m7g8/p6df-kubernetes/issues/3)) ([cdcb9a0](https://github.com/p6m7g8/p6df-kubernetes/commit/cdcb9a045e2c2e0c2c22800bf7f9662e4610da0a))
* **oh-my-zsh:** adds required variable ([#2](https://github.com/p6m7g8/p6df-kubernetes/issues/2)) ([e0f3a81](https://github.com/p6m7g8/p6df-kubernetes/commit/e0f3a811c653f2c7d70fcc5e381ec786d590e4c7))


* **api:** dispersed ([#6](https://github.com/p6m7g8/p6df-kubernetes/issues/6)) ([c70b6a8](https://github.com/p6m7g8/p6df-kubernetes/commit/c70b6a8f68d08a45de86df384ddb7d32c36f3b8f))

## 1.0.0 (2020-06-07)


### Features

* **cicd:** setups semantic-version ([#3](https://github.com/p6m7g8/p6df-docker/issues/3)) ([3acd335](https://github.com/p6m7g8/p6df-docker/commit/3acd335c1acf3dbaba30a0f3852922903364c45c))


* **doc:** regens ([#4](https://github.com/p6m7g8/p6df-docker/issues/4)) ([942c6b0](https://github.com/p6m7g8/p6df-docker/commit/942c6b01dd87eacaae7b38755569cd8dfa476822))
* **mergify:** adds config ([8c2ca08](https://github.com/p6m7g8/p6df-docker/commit/8c2ca0824ae1ca108c4fe218c50273face73ac47))
* **prompt:** standardize on _prompt_info ([#1](https://github.com/p6m7g8/p6df-docker/issues/1)) ([2e65974](https://github.com/p6m7g8/p6df-docker/commit/2e6597472f38ed1eb71fe92ca4179304dacf7820))
* **semqntic:** adds semantic.yml ([#2](https://github.com/p6m7g8/p6df-docker/issues/2)) ([1eb79ca](https://github.com/p6m7g8/p6df-docker/commit/1eb79ca1d44ccaf1a9d918f65fd15b48d0d1f3ee))
