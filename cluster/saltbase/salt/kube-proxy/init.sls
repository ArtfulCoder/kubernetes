/usr/local/bin/kube-proxy:
  file.managed:
    - source: salt://kube-bins/kube-proxy
    - user: root
    - group: root
    - mode: 755

/var/lib/kube-proxy/kubeconfig:
  file.managed:
    - source: salt://kube-proxy/kubeconfig
    - user: root
    - group: root
    - mode: 400
    - makedirs: true

/var/log/kube-proxy.log:
  file.managed:
     - user: root
     - group: root
     - mode: 644

# Copy kube-proxy manifest to manifests folder.
/etc/kubernetes/manifests/kube-proxy.manifest:
  file.managed:
    - source: salt://kube-proxy/kube-proxy.manifest
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - makedirs: true
    - dir_mode: 755

#stop legacy kube-proxy service
stop_kube-proxy:
  service.dead:
    - name: kube-proxy
    - enable: None
