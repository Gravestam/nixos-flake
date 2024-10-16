{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mkcert
    skaffold
    kubernetes-helm
    minikube
  ];
}
