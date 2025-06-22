# about

ansibleで各ノードを構成する。

# requirements

- sshpass
- python3
- Pip3
- Pipenv

# usage

## 環境をセットアップするためにインストールする。(一度のみ)

- `pipenv install`
- `pipenv run ansible-galaxy install -r requirements.yml`

## セットアップする。

```shell
# lint
pipenv run ansible-playbook -i hosts/inventory playbook.yml --syntax-check
# dry-run
pipenv run ansible-playbook -i hosts/inventory playbook.yml -e bw_passwd=BW_MASTER_PASSWORD --ask-become-pass --check
# run
pipenv run ansible-playbook -i hosts/inventory playbook.yml -e bw_passwd=BW_MASTER_PASSWORD --ask-become-pass
```

# deploy

別のレポジトリにてデプロイをしているので手動でデプロイはしない。

# tips

rke2のagentノードに対し、このように指定すると、ROLESに`<none>`と表示されていたものが`agent`になってくれる
```shell
kubectl label nodes $(kubectl get nodes --no-headers | awk '$3 == "<none>" { print $1 }') kubernetes.io/role=agent --overwrite=true
```
