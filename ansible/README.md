# about

ansibleで各ノードを構成する。

# requirements

- python3
- Pip3

# usage

環境をセットアップするためにインストールする。(一度のみ)
- `pipenv install`
- `pipenv run ansible-galaxy install -r requirements.yml`

環境変数を設定する。
```shell
export BWS_ACCESS_TOKEN=<ACCESS_TOKEN_VALUE>
```

```shell
# lint
pipenv run ansible-playbook -i hosts/inventory playbook.yml --syntax-check
# dry-run
pipenv run ansible-playbook -i hosts/inventory playbook.yml -e bw_passwd=BW_MASTER_PASSWORD --check
# run
pipenv run ansible-playbook -i hosts/inventory playbook.yml -e bw_passwd=BW_MASTER_PASSWORD
```
