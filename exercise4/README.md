# Ejercicio 4 (2 puntos)

> Instale el compilador de Solidity (si aún no lo tiene instalado).
>
> Obtenga un contrato inteligente que haya utilizado anteriormente o desarrolle uno tan
> simple como pueda.
>
> A partir del compilador de Solidity y habilitando siempre la optimización (--optimize).
>
> Obtenga:
> - Códigos de operación del contrato inteligente.
> - Identificadores de las funciones que existan dentro del contrato inteligente.
> - Estimación del gas utilizado por cada función.
>
> Entrega: Debe entregar el código del contrato inteligente. Puede entregar un documento
> .md donde se encuentre tanto la instrucción utilizada como la respuesta en consola. Si lo
> prefiere puede utilizar pantallazos y hacer referencia en ese mismo documento .md.


El contrato inteligente se puede encontrar [aquí](./example.sol).

Para obtener los opcodes se ha ejecutado el siguiente comando:

```
$ solc --optimize --opcodes example.sol
  
  ======= example.sol:Example =======
  Opcodes:
  PUSH1 0x80 PUSH1 0x40 MSTORE CALLVALUE DUP1 ISZERO PUSH1 0xF JUMPI PUSH1 0x0 DUP1 REVERT JUMPDEST POP PUSH1 0x0 DUP1 SLOAD PUSH1 0x1 PUSH1 0x1 PUSH1 0xA0 SHL SUB NOT AND CALLER OR SWAP1 SSTORE PUSH1 0x7E DUP1 PUSH2 0x30 PUSH1 0x0 CODECOPY PUSH1 0x0 RETURN INVALID PUSH1 0x80 PUSH1 0x40 MSTORE CALLVALUE DUP1 ISZERO PUSH1 0xF JUMPI PUSH1 0x0 DUP1 REVERT JUMPDEST POP PUSH1 0x4 CALLDATASIZE LT PUSH1 0x28 JUMPI PUSH1 0x0 CALLDATALOAD PUSH1 0xE0 SHR DUP1 PUSH4 0x62A09477 EQ PUSH1 0x2D JUMPI JUMPDEST PUSH1 0x0 DUP1 REVERT JUMPDEST PUSH1 0x33 PUSH1 0x35 JUMP JUMPDEST STOP JUMPDEST PUSH1 0x0 DUP1 SLOAD PUSH1 0x1 PUSH1 0x1 PUSH1 0xA0 SHL SUB NOT AND CALLER OR SWAP1 SSTORE JUMP INVALID LOG2 PUSH6 0x627A7A723058 KECCAK256 SDIV 0xe1 0x4a DIV SWAP10 0xaf 0xe1 SIGNEXTEND CALLER MSTORE8 0xb7 STOP 0xfc ADDMOD 0xc8 SWAP13 0xd3 BLOCKHASH 0xc6 PUSH24 0xDC7FD543DBCA91DFB952618C64736F6C6343000509003200
```


Para obtener el ABI se ha ejecutado el siguiente comando:

```
$ solc --optimize --abi example.sol
  
  ======= example.sol:Example =======
  Contract JSON ABI
  [{"constant":false,"inputs":[],"name":"changeOwner","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]
```


Para la estimación del gas se ha usado el siguiente comando:

```
$ solc --optimize --gas example.sol
  
  ======= example.sol:Example =======
  Gas estimation:
  construction:
     20310 + 25200 = 45510
  external:
     changeOwner():	20357
```