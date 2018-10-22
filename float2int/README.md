# Float2nt:

## OBS1: Não está compilando

-   Eu preciso fazer 2 shifts que dependem de um cálculo. Dai eu não posso fazer um shift passando um `registrador` como argumento, ele pede um `imédiato`.

## OBS2: Não está funcionando corretamente

-   Está com algum erro na conversão de binario para inteiro. No teste de mesa a lógica funciona. Não sei oque pode estar causando o erro.

# Usage

```
Uso - Float2Int
Ao rodar o Script voce digita na tela o Float IEEE 754 no seguinte formato:
FLOAT IEEE 754 (Modificado)
	Sinal:		1 bit
	Expoente:	7 bits
	Fração:		8 bits
Ao apertar enter será printado na tela o número correspondente como um Inteiro
```

## eg:

```sh
$ ./assemble.sh float2int/float2int.asm float2int
$ ./float2int
$ Float: 0100010111101100
$ Decimal: 123
```
