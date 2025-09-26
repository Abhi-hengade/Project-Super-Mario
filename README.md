# $$\color{green}{\textbf Project: 🎮 \color{red} \textbf {Super} \ \color{orange} \ \textbf Mario  🍄🐢}$$

##  $\color{blue} \textbf {Project  Workflow}$
Step 1 → Login and basics setup

Step 2 → Setup Docker ,Terraform ,aws cli , and Kubectl

Step 3 → Building Infrastructure Using terraform

Step 4 → Creation of deployment and service for EKS



### $\color{red} \textbf {Step 1 → Login  and  basics  setup}$
1. Click on launch Instance
   ![instance](https://github.com/Abhi-hengade/Project-Super-Mario/blob/9cac0a93abf652278fa4cc840b8f55d93a26b674/assets/Screenshot%202025-09-26%20172714.png)
2. Connect to EC2-Instance
   ![connect-ec2](https://github.com/Abhi-hengade/Project-Super-Mario/blob/80c4bb10b2d2f06abd0412627d0af14f1ef02a16/assets/Screenshot%202025-09-26%20172956.png)

   

### $\color{red} \textbf {Step 2 → Setup  Tools}$

````
sudo yum update -y
````
$\color{blue} \textbf {Setup  Docker:}$
````
sudo apt install docker.io -y
sudo systemctl start docker
sudo usermod -aG docker ubuntu
newgrp docker
docker --version
````
````
sudo yum install docker -y
sudo systemctl start docker
sudo usermod -aG docker ec2-user
newgrp docker
docker --version
````

$\color{blue} \textbf {Setup Terraform:Ubuntu}$
````
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

````
- Amazon linux
````
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum install terraform -y
````
${\color{blue} \textbf {Setup  AWS CLI:}}$
````
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip 
unzip awscliv2.zip
sudo ./aws/install
aws --version

````

## ${\color{blue} \textbf {Install kubectl}}$
Download the latest release with the command:
````
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
````

Install kubectl:
````
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
````
Note:
If you do not have root access on the target system, you can still install kubectl to the ~/.local/bin directory:
````
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
````
````
kubectl version --client
````


### $\color{red} \textbf {Step 3 → Building Infrastructure  Using  terraform}$
$\color{blue} \textbf {Install  GIT}$
````
git clone https://github.com/Abhi-hengade/Project-Super-Mario.git

````
````
cd Project-Super-Mario
cd EKS-TF
````
````
vim backend.tf
````
![backend tf](https://github.com/Abhi-hengade/Project-Super-Mario/blob/dbaa684649578aea78bc97024e9e095d27a4a835/assets/Screenshot%202025-09-26%20173803.png)

$\color{blue} \textbf {Create \ Infra:}$

````
aws configure --profile eks
````

````
terraform init
terraform plan
terraform apply --auto-approve
````

````
aws eks update-kubeconfig --name EKS_CLOUD --region ap-south-1 --profile eks
````

### $\color{red} \textbf {Step 4 → Creation  of  deployment  and service  for  EKS}$
change the directory where deployment and service files are stored use the command →
````
cd ..
````
$\color{blue} \textbf {create  the  deployment}$
````
kubectl apply -f deployment.yaml
````
$\color{blue} \textbf {Now create  the service}$
````
kubectl apply -f service.yaml
kubectl get all
kubectl get svc mario-service
````
copy the load balancer ingress and paste it on browser and your game is running

![load balancer](https://github.com/abhipraydhoble/Project-Super-Mario/assets/122669982/d085951d-3398-44ad-b9cd-05c561b74664)



$\color{green} \textbf {Final Output: Enjoy The Game 🎮}$

![output](https://github.com/abhipraydhoble/Project-Super-Mario/assets/122669982/edfff0b5-6507-48e4-b552-908671b59920)

**Delete Infra**
````
cd EKS-TF/
````

````
 terraform destroy -auto-approve
````

