## Trabalho Big Data 2 - Parte B

Professor, este trabalho ficou super bacana, ele dá um pouco de experiência de mercado de trabalho para os alunos, ficou show.

Vou listar aqui passo a passo como eu fiz com alguns comentários de correção/melhoria:
Eu não vi os vídeos por já estar familiarizado com o ambiente, então segui diretamente o seu script:

### Criando Cluster

1. Ativar conta na GCP (pessoa tem que inserir cartão de crédito).

2. Criar o projeto **ufam-bgd-2020** (isso vem antes de criar o cluster)

3. Criar o **bucket** (isso vem antes de criar o bucket)
```gsutil mb -c standard -l us-central1 gs://ufam-bucket-1-lucas-citolin```

**Observações:** Não sei se tem a ver comigo tendo usado o **dominio do Icomp** (usei o GMAIL do Icomp) mas o nome ufam-bucket-1 estava ocupado.

4. Instalar o SDK da GCP na máquina.

5. Executar o comando:
```
gcloud dataproc clusters create lucas-citolin-0809 \
		--project ufam-bgd-2020-267617 \
		--region us-central1 \
		--subnet default \
		--zone us-central1-c \
		--master-machine-type n1-standard-1 \
		--master-boot-disk-size 32 \
		--num-workers 3 \
		--worker-machine-type n1-standard-1 \
		--worker-boot-disk-size 32 \
		--image-version 1.4-ubuntu18 \
		--optional-components ANACONDA,JUPYTER \
		--bucket ufam-bucket-1-lucas-citolin
```

**Observações:**
- Mesmo informando o projeto no script de criação do cluster, tive que setar o projeto no meu SDK:
``` gcloud config set project ufam-bgd-2020-267617``` 
- No ``` --project ``` não deve-se dar o nome do projeto, mas sim o ID do projeto. (nome + número) 
- Nome do cluster segue um Regex que obriga a começar com letra minúscula.  

**ERRO NESTA ETAPA**:
- Não conseguia criar o cluster em hipótese alguma. Retornava o seguinte erro:
```
ERROR: (gcloud.dataproc.clusters.create) INVALID_ARGUMENT: Insufficient 'IN_USE_ADDRESSES' quota. Requested 6.0, available 4.0.
```
Por algum motivo a GCP só libera 4.0 IPs de controle, logo, eu só poderia subir 4 máquinas.
**NÃO SEI se isso é devido eu ter usado a conta do Icomp**

De qualquer forma, tive que entrar na UI da GCP e fazer uma **solicitação** de mudança (além de fazer upgrade da conta). A solicitação foi enviada para análise ---> tô pagando bixo <--- (???).

Por isso eu: **tive que criar um cluster com apenas 4 máquinas:**
- 1 master
- 3 workers



Neste momento o cluster estava criado e ready to go.
---

### Executando o WordCount

Baixar o arquivo do WordCount em python faltou o diretório de destino no final do comando:
Essa é bem óbvia dado o comando **cp** mas é bom explicitar.
```
gsutil cp gs://la-gcp-labs-resources/data-engineer/dataproc/wordcount.py ./
```

Tive que informar a região no comando, se não ele não encontrava o cluster:
```
gcloud dataproc jobs submit pyspark wordcount.py \
		--region=us-central1 \
		--cluster=lucas-citolin-0809 -- \
		gs://la-gcp-labs-resources/data-engineer/dataproc/romeoandjuliet.txt \
		gs://ufam-bucket-1-lucas-citolin/output/
```
Ler os arquivos deu tudo certo!
- -- 

### O SSH no cluster com Jupyter deu tudo certo de primeira! Show demais.

--- 

Segue as imagens neste diretório.
