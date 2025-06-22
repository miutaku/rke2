# 扱えるIPレンジを広げる

```shell
$ kubectl apply -f ipaddresspool.yaml --kubeconfig=/tmp/kubeconfig
$ kubectl patch ippool default-ipv4-ippool --type merge -p '{"spec":{"blockSize":24}}' --kubeconfig=/tmp/kubeconfig
$ kubectl get ippool default-ipv4-ippool -o yaml --kubeconfig=/tmp/kubeconfig | grep blockSize
  blockSize: 24
```

# helmでmetallbを入れる

```shell
$ kubectl create ns metallb-system --kubeconfig=/tmp/kubeconfig
namespace/metallb-system created

$ helm repo add metallb https://metallb.github.io/metallb --kubeconfig=/tmp/kubeconfig
$ helm install metallb metallb/metallb --namespace metallb-system --kubeconfig=/tmp/kubeconfig
NAME: metallb
LAST DEPLOYED: Sun Jun  8 17:50:04 2025
NAMESPACE: metallb-system
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
MetalLB is now running in the cluster.

Now you can configure it via its CRs. Please refer to the metallb official docs
on how to use the CRs.

$ kubectl get pods -n metallb-system --kubeconfig=/tmp/kubeconfig
NAME                                  READY   STATUS              RESTARTS   AGE
metallb-controller-5754956df6-zjqsj   1/1     Running             0          110s
metallb-speaker-2cvbt                 4/4     Running             0          110s
metallb-speaker-wqxqc                 4/4     Running             0          110s
```

## metallbでBGPで経路交換が走らないとき

なぜかBGPで経路交換ができない時がある。
ルータを見るといけてそうなのに…
```
show ip bgp
BGP table version is 22, local router ID is 192.168.8.254
Local AS number 64512
Status codes: s - suppressed, * - valid, h - history, l - looped
              > - best, i - internal
Origin codes: i - IGP, e - EGP, ? - incomplete

   Network            Next Hop            Metric     LocPrf  Path
*  192.168.0.200/32   192.168.0.130            0             64520 i
*>                    192.168.0.129            0             64520 i
```

こういうときは、
1. `L2Advertisement`(コメントアウトされている箇所)を有効化して、`BGPPeer`と`BGPAdvertisement`の設定をコメントアウト。
2. 再度`BGPPeer`と`BGPAdvertisement`の設定を有効化して、`L2Advertisement`をコメントアウトして戻す。
3. 以下コマンド実行
```
$ kubectl rollout restart daemonset metallb-speaker -n metallb-system

daemonset.apps/metallb-speaker restarted
```
これで直るかもしれない。IX2215ではこれでなんとかなった。