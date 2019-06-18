# Ejercicio 1 (2 puntos)

> Construya y configure su propia blockchain a partir de un archivo génesis que usted
> mismo debe definir. Se recomienda el uso del cliente Geth.
>
> - Cree una cuenta mediante el cliente Geth.
> - Consiga su propio Ether a partir de la minería.
>
> Si realiza instrucciones adicionales dentro del cliente, se valorará positivamente.
>
> Entrega: Debe desarrollar un archivo .md donde describa el procedimiento realizado para
> resolver el ejercicio. Además en el mismo repositorio debe alojar el archivo génesis y los
> pantallazos que considere necesarios. Haga referencia a éstos a partir del archivo .md.


Para la realización del ejercicio se ha creado el archivo [genesis.json](./genesis.json) con la configuración inicial
del primer bloque de la blockchain. Seguidamente se ha ejecutado el siguiente comando para su inicialización
usando el cliente _geth_:

```
$ geth --datadir . init ./genesis.json 

INFO [06-18|13:58:09.944] Maximum peer count                       ETH=25 LES=0 total=25
INFO [06-18|13:58:09.970] Allocated cache and file handles         database=/Users/molina/workspace/uah/pec1/exercise1/geth/chaindata cache=16 handles=16
INFO [06-18|13:58:10.011] Writing custom genesis block
INFO [06-18|13:58:10.011] Persisted trie from memory database      nodes=0 size=0.00B time=12.962µs gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [06-18|13:58:10.012] Successfully wrote genesis state         database=chaindata                                                 hash=9b8d4a…9021ba
INFO [06-18|13:58:10.012] Allocated cache and file handles         database=/Users/molina/workspace/uah/pec1/exercise1/geth/lightchaindata cache=16 handles=16
INFO [06-18|13:58:10.049] Writing custom genesis block
INFO [06-18|13:58:10.049] Persisted trie from memory database      nodes=0 size=0.00B time=3.288µs  gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [06-18|13:58:10.049] Successfully wrote genesis state         database=lightchaindata                                                 hash=9b8d4a…9021ba                                   hash=9b8d4a…9021ba
```

Posteriormente ejecutamos el siguiente comando para crear una cuenta:

```
$ geth --datadir . account new

INFO [06-18|14:01:35.427] Maximum peer count                       ETH=25 LES=0 total=25
Your new account is locked with a password. Please give a password. Do not forget this password.
Passphrase:
Repeat passphrase:
Address: {19bc75fe9569c09f9e06500ea0bbb4d189f2b514}
```

Una vez creada la cuenta ejecutamos el siguiente comando para minar ether en el blockchain local:

```
$ geth --datadir . --mine --miner.threads 4

INFO [06-18|14:08:10.401] Maximum peer count                       ETH=25 LES=0 total=25
INFO [06-18|14:08:10.427] Starting peer-to-peer node               instance=Geth/v1.8.27-stable/darwin-amd64/go1.12.4
INFO [06-18|14:08:10.427] Allocated cache and file handles         database=/Users/molina/workspace/uah/pec1/exercise1/geth/chaindata cache=512 handles=5120
INFO [06-18|14:08:10.487] Initialised chain configuration          config="{ChainID: 15 Homestead: 0 DAO: <nil> DAOSupport: false EIP150: <nil> EIP155: 0 EIP158: 0 Byzantium: <nil> Constantinople: <nil>  ConstantinopleFix: <nil> Engine: unknown}"
INFO [06-18|14:08:10.487] Disk storage enabled for ethash caches   dir=/Users/molina/workspace/uah/pec1/exercise1/geth/ethash count=3
INFO [06-18|14:08:10.488] Disk storage enabled for ethash DAGs     dir=/Users/molina/.ethash                                  count=2
INFO [06-18|14:08:10.488] Initialising Ethereum protocol           versions="[63 62]" network=1
INFO [06-18|14:08:10.556] Loaded most recent local header          number=0 hash=9b8d4a…9021ba td=131072 age=50y2mo5d
INFO [06-18|14:08:10.556] Loaded most recent local full block      number=0 hash=9b8d4a…9021ba td=131072 age=50y2mo5d
INFO [06-18|14:08:10.556] Loaded most recent local fast block      number=0 hash=9b8d4a…9021ba td=131072 age=50y2mo5d
INFO [06-18|14:08:10.556] Loaded local transaction journal         transactions=0 dropped=0
INFO [06-18|14:08:10.558] Regenerated local transaction journal    transactions=0 accounts=0
INFO [06-18|14:08:10.622] New local node record                    seq=3 id=565df4c30eb4075e ip=127.0.0.1 udp=30303 tcp=30303
INFO [06-18|14:08:10.622] Started P2P networking                   self=enode://83807ff99c8047a293ac2d325d453646fced7c42e22a84cdac308d4349ad9e7cb9c9ed2949819c1203ee8440afaf4ced9df5996a076c8193a8f8440db8ef3554@127.0.0.1:30303
INFO [06-18|14:08:10.625] IPC endpoint opened                      url=/Users/molina/workspace/uah/pec1/exercise1/geth.ipc
INFO [06-18|14:08:10.625] Transaction pool price threshold updated price=1000000000
INFO [06-18|14:08:10.625] Updated mining threads                   threads=4
INFO [06-18|14:08:10.625] Transaction pool price threshold updated price=1000000000
INFO [06-18|14:08:10.625] Etherbase automatically configured       address=0x19bc75fe9569c09F9e06500Ea0bbb4D189F2B514
INFO [06-18|14:08:10.626] Commit new mining work                   number=1 sealhash=c21735…e98070 uncles=0 txs=0 gas=0 fees=0 elapsed=141.033µs
INFO [06-18|14:08:12.086] Generating DAG in progress               epoch=0 percentage=0 elapsed=824.583ms

...

INFO [06-18|14:09:36.067] Generating DAG in progress               epoch=0 percentage=99 elapsed=1m24.803s
INFO [06-18|14:09:36.069] Generated ethash verification cache      epoch=0 elapsed=1m24.805s
INFO [06-18|14:09:36.540] Successfully sealed new block            number=1 sealhash=c21735…e98070 hash=da3580…d83025 elapsed=1m25.911s
INFO [06-18|14:09:36.540] 🔨 mined potential block                  number=1 hash=da3580…d83025
INFO [06-18|14:09:36.541] Commit new mining work                   number=2 sealhash=eb48ba…b32ae3 uncles=0 txs=0 gas=0 fees=0 elapsed=1.127ms
INFO [06-18|14:09:37.543] Successfully sealed new block            number=2 sealhash=eb48ba…b32ae3 hash=2d41d4…23f519 elapsed=1.001s
INFO [06-18|14:09:37.553] 🔨 mined potential block                  number=2 hash=2d41d4…23f519
INFO [06-18|14:09:37.564] Commit new mining work                   number=3 sealhash=068b7b…d20bbf uncles=0 txs=0 gas=0 fees=0 elapsed=11.201ms
INFO [06-18|14:09:38.299] Generating DAG in progress               epoch=1 percentage=0  elapsed=1.277s
INFO [06-18|14:09:38.566] Successfully sealed new block            number=3 sealhash=068b7b…d20bbf hash=a5e78e…692b78 elapsed=1.013s
INFO [06-18|14:09:38.567] 🔨 mined potential block                  number=3 hash=a5e78e…692b78
INFO [06-18|14:09:38.577] Commit new mining work                   number=4 sealhash=112c79…23fb52 uncles=0 txs=0 gas=0 fees=0 elapsed=9.206ms
INFO [06-18|14:09:39.594] Generating DAG in progress               epoch=1 percentage=1  elapsed=2.572s
INFO [06-18|14:09:40.788] Successfully sealed new block            number=4 sealhash=112c79…23fb52 hash=928f65…75c79b elapsed=2.220s
INFO [06-18|14:09:40.798] 🔨 mined potential block                  number=4 hash=928f65…75c79b
INFO [06-18|14:09:40.811] Commit new mining work                   number=5 sealhash=4836ac…3c72b6 uncles=0 txs=0 gas=0 fees=0 elapsed=12.291ms
INFO [06-18|14:09:40.916] Generating DAG in progress               epoch=1 percentage=2  elapsed=3.894s
INFO [06-18|14:09:41.035] Successfully sealed new block            number=5 sealhash=4836ac…3c72b6 hash=164da3…ed141d elapsed=231.415ms
INFO [06-18|14:09:41.047] 🔨 mined potential block                  number=5 hash=164da3…ed141d
INFO [06-18|14:09:41.059] Commit new mining work                   number=6 sealhash=7bb7e9…a4bb1e uncles=0 txs=0 gas=0 fees=0 elapsed=12.124ms

...
```

Para comprobar que efectivamente se ha minado comprobamos el saldo de la cuenta creada usando la consola:

```
$ geth --datadir . console

> web3.fromWei(eth.getBalance(eth.coinbase), "ether")
90
````

Y podemos ver que actualmente tiene un saldo de 90 ETH.