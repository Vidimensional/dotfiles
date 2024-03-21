# Kubetools Role

Installs `kubectl` and other tools needed to work with Kubernetes projects:
 * [`kubectx`](https://github.com/ahmetb/kubectx) and [`kubens`](https://github.com/ahmetb/kubectx) using [`krew`](https://krew.sigs.k8s.io/)
 * [`helm`](https://helm.sh/)

Also configures bash with related aliases.

## Variables

* __kubectl_install_kubectx__: (default:`true`) if true will install [krew](https://krew.sigs.k8s.io/) and then use it to install [kubectx](https://github.com/ahmetb/kubectx) and [kubens](https://github.com/ahmetb/kubectx).
* __kubectl_install_helm__: (default:`true`) if true will install [helm](https://helm.sh/).

## Examples

```yaml
roles:
  - name: Install kubectl, kubectx, kubens and helm
    role: kubectl

  - name: Install only kubectl
    role: kubectl
    vars: 
      kubectl_install_kubectx: false
      kubectl_install_helm: false
```
