# Ejercicio 5 (2 puntos)

> Obtenga sin utilizar el compilador de Solidity el identificador de cada una de las
> siguientes funciones y justifique cómo los ha obtenido. Muestre mediante un pantallazo la
> obtención de los identificadores.
>
> - function sumValues (uint _a, uint _b) public view returns (uint _c) {}
> - function getGasDetails() public payable{}
> - function __callback(bytes32 id, string memory result) public{}
> - function abr(uint8 _a, address _address) internal{}
>   - Debe modificar “abr” por sus iniciales (nombre y apellidos).
>
> *La resolución del ejercicio se debe realizar aplicando un procedimiento manual, es decir,
> sin utilizar herramientas que obtengan automáticamente los identificadores.
>
> Entrega: Debe entregar un documento .md donde se encuentre la justificación y los
> identificadores obtenidos. Además en el mismo repositorio debe alojar los pantallazos
> que considere necesarios.


Siguiendo las indicaciones obtenidas en la [documentación de solidity](https://solidity.readthedocs.io/en/latest/abi-spec.html#examples)
para obtener el identificador de una función cogeremos los cuatro primeros bytes del resultado de aplicar la función
de hash ``sha3`` al string formado por el nombre del método más el tipo de los parámetros separados por coma.

- `function sumValues (uint _a, uint _b) public view returns (uint _c) {}`

_sha3("sumValues(uint256,uint256)")_ = "0x**27b57fcc**13dafc8e83ae46798da0c4c32ac0b86c1f24ef37538b0fc8b50875f8"

Hay que tener en cuenta que _uint_ es en realidad un alias del tipo _uint256_.


- `function getGasDetails() public payable{}`

_sha3("getGasDetails()")_ = "0x**3d86f4af**2d0b73fb4f46e0f668f472b5ea2669e6c34cf4e04648d8bc930a8395"


- `function __callback(bytes32 id, string memory result) public{}`

_sha3("\_\_callback(bytes32,string)")_ = "0x**27dc297e**ab4e0fe19b1c27421a866f28afc57b7f56076d987944d10e83b1a57d"

En este caso no es necesario considerar el hecho que el segundo parámetro es tipo _memory_.


- `function joseMolinaColmenero(uint8 _a, address _address) internal{}`

_sha3("joseMolinaColmenero(uint8,address)")_ = "0x**dd3b4b4d**f060f8eb68bb558332dcad3fae2f4154f537cbda537b3306a2f61f0e"

Sin embargo es interesante mencionar que el compilador no generaría ningún idenficador para este método, dado que es
de tipo _internal_ y por tanto no puede ser invocado por los usuarios.


Para comprobar que los resultados son correctos he creado el siguiente contrato:

```
pragma solidity ^0.5.9;

contract Example {
    function sumValues(uint _a, uint _b) public view returns (uint _c) {}
    function getGasDetails() public payable {}
    function __callback(bytes32 id, string memory result) public {}
    function joseMolinaColmenero(uint8 _a, address _address) internal {}
}
```

Y he comprobado las firmas generadas por el compilador:

```
$ solc --optimize --hashes example.sol
  
======= example.sol:Example =======
Function signatures:
27dc297e: __callback(bytes32,string)
3d86f4af: getGasDetails()
27b57fcc: sumValues(uint256,uint256)
```

Como se puede apreciar todas las firmas coinciden.