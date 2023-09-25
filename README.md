# Домашнее задание к занятию 10 «Jenkins»

[Ссылка на репозиторий с ролью Vector-role (для Freestyle и Declarative pipeline jobs)](https://github.com/Ditry86/ansible_study_5.git)

### Declarative pipeline ([Jenkinsfile](./Jenkinsfile)):

```
pipeline {
    agent any
    stages {
        stage('Prepare') {
            steps {
                sh 'rm -rf ansible_study_5'
                sh 'git clone https://github.com/Ditry86/ansible_study_5.git'
                sh 'pip3 install --force-reinstall "urllib3<1.27" "chardet<5.0"'
            }
        }
        stage('Test') {
            steps {
                sh 'cd ansible_study_5/playbook/roles/vector-role && molecule -vvv test'
            }
        }
    }
}
```

### Scripted pipeline ([ScriptedJenkinsfile](./ScriptedJenkinsfile)):

```
node("agent"){
    stage("Get "){
        git 'https://github.com/aragastmatb/example-playbook.git'
    }
    stage("Define test check prod_run"){
        prod_run=false
    }
    stage("Run playbook"){
        if (prod_run){
            sh 'ansible-playbook site.yml -i inventory/prod.yml'
        }
        else{
            sh 'ansible-playbook site.yml -i inventory/prod.yml --check --diff'
        }
        
    }
}
```