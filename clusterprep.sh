#!/bin/bash
read -p "Enter the Subscription ID: " subscription
read -p "Enter the region to deploy AKS Cluster: " regionaks
read -p "Enter the number of attendees for the workshop: " usercount
echo "#################  Installing AZ cli #####################"
#curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
echo "#################  Authenticate to Azure portal #####################"
az login
echo "#################  Creating Resource group in region: $regionaks #####################"
az group create --name tapdemo-cluster-RG --location $regionaks --subscription $subscription
u=$usercount
if [ $u -lt 10 ];
then
for i in $(seq $u)
do
echo "#################  Creating $u AKS clusters in region: $regionaks #####################"
	az aks create --resource-group tapdemo-cluster-RG --name partnersetap-w01-s00$i-cluster --subscription $subscription --node-count 2 --enable-addons monitoring --generate-ssh-keys --node-vm-size Standard_D8S_v3 -z 1 --enable-cluster-autoscaler --min-count 1 --max-count 2
done
else
for i in $(seq 1 9)
do
echo "#################  Creating $u AKS clusters in region: $regionaks #####################"
	az aks create --resource-group tapdemo-cluster-RG --name partnersetap-w01-s00$i-cluster --subscription $subscription --node-count 2 --enable-addons monitoring --generate-ssh-keys --node-vm-size Standard_D8S_v3 -z 1 --enable-cluster-autoscaler --min-count 1 --max-count 2
done
for i in $(seq 10 $u)
do
	az aks create --resource-group tapdemo-cluster-RG --name partnersetap-w01-s0$i-cluster --subscription $subscription --node-count 2 --enable-addons monitoring --generate-ssh-keys --node-vm-size Standard_D8S_v3 -z 1 --enable-cluster-autoscaler --min-count 1 --max-count 2
done
fi
