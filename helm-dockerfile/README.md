The helm docker file is used in the CI build.

Instead of installing helm on the cluster, we will have an intermediate circle ci container build using this image to run helm commands against cluster.

This requires KUBECONFIG with the circleci folder, checking it in not a good practice. 

TODO - login to cluster without using circleci/kubeconfig_env.yaml