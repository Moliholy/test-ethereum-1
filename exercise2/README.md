# Ejercicio 2 (2 puntos)

> 1. A partir del ejercicio anterior, cree una nueva cuenta en su blockchain.
> Realice mediante el propio cliente Geth una transferencia de 1 Ether entre dos
> cuentas de esta blockchain.
>
> 2. Realice mediante la consola de Truffle y conectado a una blockchain desplegada
> con Ganache una transferencia de 1 Ether entre dos cuentas de esta blockchain.
> Puede aprovechar el entorno creado en la actividad primera del bloque 1 (Truffle
> Pet Shop).
>
> Entrega: Debe desarrollar un archivo .md donde describa el procedimiento realizado para
> resolver el ejercicio y los balances de las cuentas. Además en el mismo repositorio debe
> alojar los pantallazos que considere necesarios. Haga referencia a éstos a partir del
> archivo .md.


Primeramente procedemos a crear una nueva cuenta:

```
$ geth --datadir . account new

INFO [06-18|14:20:24.918] Maximum peer count                       ETH=25 LES=0 total=25
Your new account is locked with a password. Please give a password. Do not forget this password.
Passphrase:
Repeat passphrase:
Address: {9c2b412dc2e8d203b8ea62d2922cd6e7feb2999c}
```

Y pasamos a comprobar que actualmente existen dos cuentas:

```
$ geth --datadir . account list

INFO [06-18|14:21:18.181] Maximum peer count                       ETH=25 LES=0 total=25
Account #0: {19bc75fe9569c09f9e06500ea0bbb4d189f2b514} keystore:///Users/molina/workspace/uah/pec1/exercise1/keystore/UTC--2019-06-18T12-01-37.134494000Z--19bc75fe9569c09f9e06500ea0bbb4d189f2b514
Account #1: {9c2b412dc2e8d203b8ea62d2922cd6e7feb2999c} keystore:///Users/molina/workspace/uah/pec1/exercise1/keystore/UTC--2019-06-18T12-20-26.820853000Z--9c2b412dc2e8d203b8ea62d2922cd6e7feb2999c
```

Seguidamente vamos a enviar 1 ETH desde la primera cuenta a la segunda. Para ello usaremos el cliente
javascript con web3:

```
$ geth --datadir . console

INFO [06-18|14:26:58.217] Maximum peer count                       ETH=25 LES=0 total=25
INFO [06-18|14:26:58.237] Starting peer-to-peer node               instance=Geth/v1.8.27-stable/darwin-amd64/go1.12.4
INFO [06-18|14:26:58.238] Allocated cache and file handles         database=/Users/molina/workspace/uah/pec1/exercise1/geth/chaindata cache=512 handles=5120
INFO [06-18|14:26:58.300] Initialised chain configuration          config="{ChainID: 15 Homestead: 0 DAO: <nil> DAOSupport: false EIP150: <nil> EIP155: 0 EIP158: 0 Byzantium: <nil> Constantinople: <nil>  ConstantinopleFix: <nil> Engine: unknown}"
INFO [06-18|14:26:58.300] Disk storage enabled for ethash caches   dir=/Users/molina/workspace/uah/pec1/exercise1/geth/ethash count=3
INFO [06-18|14:26:58.300] Disk storage enabled for ethash DAGs     dir=/Users/molina/.ethash                                  count=2
INFO [06-18|14:26:58.301] Initialising Ethereum protocol           versions="[63 62]" network=1
WARN [06-18|14:26:58.377] Head state missing, repairing chain      number=19 hash=2ab7a5…5ca081
INFO [06-18|14:26:58.377] Rewound blockchain to past state         number=18 hash=f52d2a…66ea2f
INFO [06-18|14:26:58.380] Loaded most recent local header          number=18 hash=f52d2a…66ea2f td=2499072 age=17m2s
INFO [06-18|14:26:58.380] Loaded most recent local full block      number=18 hash=f52d2a…66ea2f td=2499072 age=17m2s
INFO [06-18|14:26:58.380] Loaded most recent local fast block      number=18 hash=f52d2a…66ea2f td=2499072 age=17m2s
INFO [06-18|14:26:58.380] Loaded local transaction journal         transactions=0 dropped=0
INFO [06-18|14:26:58.380] Regenerated local transaction journal    transactions=0 accounts=0
WARN [06-18|14:26:58.380] Blockchain not empty, fast sync disabled
INFO [06-18|14:26:58.466] New local node record                    seq=5 id=565df4c30eb4075e ip=127.0.0.1 udp=30303 tcp=30303
INFO [06-18|14:26:58.466] Started P2P networking                   self=enode://83807ff99c8047a293ac2d325d453646fced7c42e22a84cdac308d4349ad9e7cb9c9ed2949819c1203ee8440afaf4ced9df5996a076c8193a8f8440db8ef3554@127.0.0.1:30303
INFO [06-18|14:26:58.486] IPC endpoint opened                      url=/Users/molina/workspace/uah/pec1/exercise1/geth.ipc
Welcome to the Geth JavaScript console!

instance: Geth/v1.8.27-stable/darwin-amd64/go1.12.4
INFO [06-18|14:26:58.577] Etherbase automatically configured       address=0x19bc75fe9569c09F9e06500Ea0bbb4D189F2B514
coinbase: 0x19bc75fe9569c09f9e06500ea0bbb4d189f2b514
at block: 18 (Tue, 18 Jun 2019 14:09:56 CEST)
 datadir: /Users/molina/workspace/uah/pec1/exercise1
 modules: admin:1.0 debug:1.0 eth:1.0 ethash:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

> INFO [06-18|14:27:02.470] New local node record                    seq=6 id=565df4c30eb4075e ip=37.11.138.20 udp=30303 tcp=30303
> personal.unlockAccount(eth.coinbase, '')
true
> eth.sendTransaction({from:eth.coinbase, to:eth.accounts[1], value: web3.toWei(1, "ether")})
INFO [06-18|14:29:49.205] Setting new local account                address=0x19bc75fe9569c09F9e06500Ea0bbb4D189F2B514
INFO [06-18|14:29:49.211] Submitted transaction                    fullhash=0x6df0c28855ee96dc9f837b3028306e73765ea1f1cac884a61ce85cc2f3811cfc recipient=0x9C2b412Dc2E8D203B8eA62d2922CD6e7FEB2999c
"0x6df0c28855ee96dc9f837b3028306e73765ea1f1cac884a61ce85cc2f3811cfc"
```

Nótese que primeramente ha sido necesario desbloquear la primera cuenta creada.

A continuación vamos a comprobar los fondos de ambas cuentas, aunque previamente es necesario mencionar que para
poder ejercutar la transacción ha sido necesario volver a minar al menos un bloque, aunque de hecho se
han minado varios:

```
$ geth --datadir .  console

INFO [06-18|14:39:21.892] Maximum peer count                       ETH=25 LES=0 total=25
INFO [06-18|14:39:21.915] Starting peer-to-peer node               instance=Geth/v1.8.27-stable/darwin-amd64/go1.12.4
INFO [06-18|14:39:21.915] Allocated cache and file handles         database=/Users/molina/workspace/uah/pec1/exercise1/geth/chaindata cache=512 handles=5120
INFO [06-18|14:39:21.971] Initialised chain configuration          config="{ChainID: 15 Homestead: 0 DAO: <nil> DAOSupport: false EIP150: <nil> EIP155: 0 EIP158: 0 Byzantium: <nil> Constantinople: <nil>  ConstantinopleFix: <nil> Engine: unknown}"
INFO [06-18|14:39:21.973] Disk storage enabled for ethash caches   dir=/Users/molina/workspace/uah/pec1/exercise1/geth/ethash count=3
INFO [06-18|14:39:21.973] Disk storage enabled for ethash DAGs     dir=/Users/molina/.ethash                                  count=2
INFO [06-18|14:39:21.973] Initialising Ethereum protocol           versions="[63 62]" network=1
INFO [06-18|14:39:22.048] Loaded most recent local header          number=39 hash=9abe30…784fde td=5263936 age=19s
INFO [06-18|14:39:22.049] Loaded most recent local full block      number=39 hash=9abe30…784fde td=5263936 age=19s
INFO [06-18|14:39:22.049] Loaded most recent local fast block      number=39 hash=9abe30…784fde td=5263936 age=19s
INFO [06-18|14:39:22.049] Loaded local transaction journal         transactions=0 dropped=0
INFO [06-18|14:39:22.049] Regenerated local transaction journal    transactions=0 accounts=0
WARN [06-18|14:39:22.049] Blockchain not empty, fast sync disabled
INFO [06-18|14:39:22.125] New local node record                    seq=11 id=565df4c30eb4075e ip=127.0.0.1 udp=30303 tcp=30303
INFO [06-18|14:39:22.126] Started P2P networking                   self=enode://83807ff99c8047a293ac2d325d453646fced7c42e22a84cdac308d4349ad9e7cb9c9ed2949819c1203ee8440afaf4ced9df5996a076c8193a8f8440db8ef3554@127.0.0.1:30303
INFO [06-18|14:39:22.127] IPC endpoint opened                      url=/Users/molina/workspace/uah/pec1/exercise1/geth.ipc
Welcome to the Geth JavaScript console!

instance: Geth/v1.8.27-stable/darwin-amd64/go1.12.4
INFO [06-18|14:39:22.205] Etherbase automatically configured       address=0x19bc75fe9569c09F9e06500Ea0bbb4D189F2B514
coinbase: 0x19bc75fe9569c09f9e06500ea0bbb4d189f2b514
at block: 39 (Tue, 18 Jun 2019 14:39:03 CEST)
 datadir: /Users/molina/workspace/uah/pec1/exercise1
 modules: admin:1.0 debug:1.0 eth:1.0 ethash:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

> INFO [06-18|14:39:25.975] New local node record                    seq=12 id=565df4c30eb4075e ip=37.11.138.20 udp=30303 tcp=30303
> web3.fromWei(eth.getBalance(eth.coinbase), "ether")
194
> web3.fromWei(eth.getBalance(eth.accounts[1]), "ether")
1
```

Podemos comprobar que la primera cuenta tiene un saldo mayor que en el ejercicio 1 dado que acabamos de minar
unos cuantos bloques. Aún así se puede apreciar que la cuenta 2 tiene un saldo de 1 ETH, tal y como se esperaba.