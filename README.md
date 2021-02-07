#rodar um docker para usar o terraform
docker run -it -v $PWD:/app -w /app --entrypoint "" hashicorp/terraform:light sh