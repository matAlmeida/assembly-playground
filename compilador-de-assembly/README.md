# Trabalho de Software Básico

Feito por Adrian Garcia, Alexandre Pedrecal e Matheus Almeida.

## Requisitos:

-   `Python 3.x`
-   Comando `xxd` disponível (Já vem por padrão no linux)

## Arquivos do projeto

| arquivo         | conteúdo                                            |
| --------------- | --------------------------------------------------- |
| `door.asm`      | Código Fonte em assembly do projeto da únidade 1    |
| `compilator.py` | Código principal que converte o assembly em binário |
| `mapper.py`     | Mapa para apoio na conversão dos OPCODE             |

## Funcionamento

O `compilator.py` cria o arquivo `objeto.o` que possui o binário montado, pré linkagem.

Para executar seguir as instruções abaixo:

```sh
$ python3 compilator.py
$ ld object.o
$ ./a.out
```

## Como chegamos nesse resultado

O código em hexadecimal principal gerado pelo `compilator.py` apartir do arquivo `door.asm` contém os códigos da seção `data` e seção `text`.

Foi feito o uso do editor de hexadecimal chamado **`bless`** para conseguir acesso ao cabeçalho e rodapé do código gerado pelo nasm. E esse hexadecimal foi incrementado ao código gerado anteriormente. No caso do nosso código ainda foi necessario a adição de um padding de 22 bytes para indicar o inicio da label `_start`.

O hexadecimal gerado é passado pela ferramenta **`xxd`** que permite fazer a operação reversa do hexdump. Apos passar pelo xxd é gerado o código binário montado de nome `object.o` que está pronto para ser linkado.
