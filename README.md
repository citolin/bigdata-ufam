# Big Data Project 1

## Observações

Professor, utilizar a máquina virtual da Cloudera é um pouco desgastante dado que nada funciona de forma straightforward.
- Maven na VM da Cloudera precisou ser atualizado.
- Git precisa ser atualizado.
- **RECENTEMENTE** em 15 de Janeiro de 2020 os repositórios da Sonatype transitaram para HTTPS e a VM da Cloudera não acompanhou a atualização. Podes ver a noticia [aqui](https://blog.sonatype.com/central-repository-moving-to-https).
- E muitas outras mini dor de cabeça que enfretamos que não incrementam pro core do aprendizado.

**SOLUÇÃO:**
- A ideia de usar a máquina de Quickstart da Cloudera é para facilitar as instalações do hadoop single-node cluster.
- O próprio [site do Hadoop na Apache](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html) provê um tutorial de como setar esse ambiente no próprio sistem operacional. Eu achei muito mais fácil e interessante, te ensina a "formatar" e "começar" o HDFS.


## Código WordCount original

**Questão 1**
- Qual é o primeiro termo no arquivo part-r-00000 e quantas vezes ele ocorre?

a-breeding 1

Output do arquivo part-r-00000
```
    head part-r-00000

    a-breeding	1
    a-down	2
    a-field	2
    a-foot	2
    a-growing	1
    a-hungry	1
    a-ripening	1
    a-weeping	1
    aaron	96
    abate	14
```


**Questão 2**
- Qual é o terceiro termo antes do último em part-r-00004 e quantas vezes ele ocorre?

zeals 1

Output do arquivo part-r-00004
```
    tail part-r-00004

    youngling	2
    younglings	1
    your	6654
    yours	255
    youths	4
    zeal	33
    zeals	1
    zed	1
    zo	1
    zodiac	1
```


**Questão 3**
- Quantos termos únicos existem?

Comando de contagem por Regex:
```
    cat part-r-0000* | grep "[\w ]*\s1$" | wc -l
```
Resultado: 12664


## Código WordCount modificado

**Questão 4**
- Qual é o primeiro termo no arquivo part-r-00000 e quantas vezes ele ocorre?

aaron 96

Output do arquivo part-r-00000
```
    head part-r-00000

    aaron	96
    abate	14
    abatements	1
    abel	1
    abergavenny	8
    abhor	19
    abject	11
    able	59
    aboard	28
    aboded	1
```

**Questão 5**
- Qual é o terceiro termo antes do último em part-r-00004 e quantas vezes ele ocorre?

zeals 1

Output do arquivo part-r-00004
```
    tail part-r-00004

    youngling	2
    younglings	1
    your	6654
    yours	255
    youths	4
    zeal	33
    zeals	1
    zed	1
    zo	1
    zodiac	1
```


**Questão 6**
- Quantos termos únicos existem?

Comando de contagem por Regex:
```
    cat part-r-0000* | grep "[\w ]*\s1$" | wc -l
```
Resultado: 8027