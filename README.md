# $$\color{green}{\textbf Project: 🎮 \color{red} \textbf {Super} \ \color{orange} \ \textbf Mario  🍄🐢}$$

##  $\color{blue} \textbf {Project  Workflow}$
## 🛠️ Project Workflow
1. Login and Basic Setup
2. Setup Docker, Terraform, AWS CLI, and kubectl
3. Build Infrastructure Using Terraform
4. Create Deployment and Service for EKS



### $\color{red} \textbf {Step 1 → Login  and  basics  setup}$
1. Click on launch Instance
   ![instance](https://github.com/Abhi-hengade/Project-Super-Mario/blob/eb44d302be57c75ba43c7703e9d0a9177154394a/assets/instance.png)
2. Connect to EC2-Instance
   ![connect-ec2](https://github.com/Abhi-hengade/Project-Super-Mario/blob/15b632fe5fb501ae3cc67fe03e8d93b46a777964/assets/connect%20instance.png)

   

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
![backend tf](https://github.com/Abhi-hengade/Project-Super-Mario/blob/15b632fe5fb501ae3cc67fe03e8d93b46a777964/assets/backend%20file.png)

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

![load balancer](https://github.com/Abhi-hengade/Project-Super-Mario/blob/15b632fe5fb501ae3cc67fe03e8d93b46a777964/assets/link.png)



$\color{green} \textbf {Final Output: After completing the deployment, you should be able to access the Super Mario game via the Load Balancer's URL. Enjoy the game! 🎮}$

![output](https://github.com/Abhi-hengade/Project-Super-Mario/blob/15b632fe5fb501ae3cc67fe03e8d93b46a777964/assets/output.png)

**Delete Infra**

## 🧹 Cleanup

To remove the deployed infrastructure and avoid ongoing charges:

```bash
terraform destroy -auto-approve

````
cd EKS-TF/
````

````
 terraform destroy -auto-approve
````

