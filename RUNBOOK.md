aws s3api create-bucket --bucket project-bedrock-tfstate-altsoe0253359 --region us-east-1

cd terraform/lib/s3_lambda/function
zip ../function.zip index.py

terraform plan 

terraform apply

Configure kubectl: aws eks update-kubeconfig --region us-east-1 --name project-bedrock-cluster
Verify It Works: kubectl get nodes, kubectl get pods -n kube-system