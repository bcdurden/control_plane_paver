# Control Plane Paver
This is a bit of a thought-experiment on what a bootstrap-system might look like for building a control plane in an IaaS without needing manual installation of an OpsManager. I've used AWS here as that is what I'm most experienced with.

## Tools Used
This experiment uses a combination of tools to achieve the desired outcome
* Minikube -- Runs singleton-K8S on almost anything
* Helm -- Package manager for K8S
* Concourse 6.x -- CI/CD tool for managing/running automated pipelines
* Terraform -- IaaS-agnostic tool for building cloud infrastructures
* K8S Cert-Manager -- K8S-native way of managing TLS certificate lifecycles

## How to Start
Since this is an experiment, the init script is written with a Mac or Ubuntu user in mind as those are my primary development environments. If you're using Windows, I feel bad for you for several reasons but this should be reproducible there too. Just disect the init script and it should highlight the packages you need to get installed.

- Edit the k8s_objs/values.yml file and ensure that you've replaced every instance of demo.pivotal-poc.solutions with your own hostname. I use this dns entry to map back to my own locally running minikube ip once the ingress IP posts (more info on that later)
- Edit the k8s_objs/ca-secret.yml file and ensure the data values are base64 encoded copies of your own local self-signed CA. These are easy to generate on your own machine. If you need help, get EasyRSA installed on your machine and init the pki. This will build a CA for you. You can build the base64 value like so:
`cat ca.crt | base64`
- Run the init script with a single paramter (mac or ubuntu)
- Using kubectl ensure concourse is up and running

## Standing up the Pipeline
TBC

### Pipeline Secrets (and how they work)
TBC
```bash
➜ control_plane_paver git:(master) ✗ kubectl get secrets -n control-plane-main
NAME                  TYPE                                  DATA   AGE
ca-key-pair           Opaque                                2      7d21h
creds                 Opaque                                3      6d23h
default-token-s6rwp   kubernetes.io/service-account-token   3      8d
github-key            Opaque                                1      8d
pivnet-token          Opaque                                1      43h
tls-certificate       kubernetes.io/tls                     3      7d21h
```