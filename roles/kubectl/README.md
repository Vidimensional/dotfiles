# kubectl Role

Installs `kubectl` (and, optionally, [`kubectx`](https://github.com/ahmetb/kubectx) and [`kubens`](https://github.com/ahmetb/kubectx) using [`krew`](https://krew.sigs.k8s.io/)).

Also configures bash with related aliases.

## Variables

* __kubectl_install_kubectx__: (default:`true`) if true will install [krew](https://krew.sigs.k8s.io/) and then use it to install [kubectx](https://github.com/ahmetb/kubectx) and [kubens](https://github.com/ahmetb/kubectx).

## Examples

```yaml
  roles:
    - name: Install kubectl and kubectx and kubens
      role: kubectl

    - name: Install only kubectl
      role: kubectl
      vars: 
        kubectl_install_kubectx: false
```
