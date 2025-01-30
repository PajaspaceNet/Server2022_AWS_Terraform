# Server2022_AWS_Terraform
Start Server Win 2022 via Terraform<br>

Podminky realizace:<br>
1/Nainstalovany Terraform<br>
2/ Pristup do AWS s patricnymi opravnenimi<br>
3/ RDP funkcni a zprovoznene v AWS<br>



Tenhle je projekt je o nastartovani windows server na pomoci Terraformu na EC2 -  a pro zmirneni nakladu je
realizovan prez spot.<br>
Je zde krome jinych prikazu - vytvoreny soubor test.txt  prez PowerShell a nasledne vyvolany  

```
New-Item -Path "C:\test.txt" -ItemType File
Set-Content -Path "C:\test.txt" -Value "Hello from Windows Server in AWS!"
```

![super_hallo_from_server](https://github.com/user-attachments/assets/d2f90320-abee-45dc-8b32-7e770674d1e1)

Protoze nekdy startuje jenom  jadro a nem sconfig , tak po nasledne konfiguraci muzeme povely 
davat  prez PowerShell v nasem pripade: 

```
taskmgr
```


![task_manager](https://github.com/user-attachments/assets/3914b878-f226-4c55-bb11-c5da3d31ee26)


## Struktura projektu 
 ```

├── main.tf                # Terraform pro start serveru
├── README.md              # Popis projektu

```

## Prikazy na Terraform
```
terraform init
terraform apply -auto-approve
```
a kdyz to chces smazat <br>
```
terraform destroy
```
