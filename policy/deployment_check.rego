package main

# Règle : Interdire les conteneurs qui tournent en ROOT
deny[msg] {
    # On vérifie que le fichier est bien un Deployment
    input.kind == "Deployment"
    
    # On cherche la sécurité dans la configuration du pod
    # On déclenche l'erreur si 'runAsNonRoot' n'est pas défini à 'true'
    not input.spec.template.spec.securityContext.runAsNonRoot == true
    
    msg := "SÉCURITÉ : Le déploiement est refusé. Le conteneur ne doit pas tourner en ROOT. Ajoutez 'runAsNonRoot: true' dans le securityContext."
}