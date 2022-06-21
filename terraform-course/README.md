```
terraform init -upgrade
```
Permite atualizar a versão dos providers caso o Lock File de dependências tenha um provider de versão inferior. É possível criar uma restrição de versões utilizando o operador 

```
~> V.V.X
~> V.X
```
Que nesse caso irá incrementar apenas versões de fix no primeiro exemplo, e minors no segundo.
