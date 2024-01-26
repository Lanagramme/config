@---
tags:spell
element:Red
archetype:Boutefeu
---@

# Braise

**Type**:
Effet de zone

**Range**:

**Description**:
Déploie une aura de feu de 3m de rayon à partir de la cible. 
Si une aura d'eau et l'aura de feu se chevauchent, les cases consernées deviennent neutre et recoivent leffet brouillard.
Si une aura de bois et l'aura de feu se chevauchent, 
    * toutes les entités présentent dans l'aura bois recoivent des dégats égal au rayon des deux zones aditionnées 
    * toutes les entités présentent dans l'aura bois recoivent l'état brulé et deux token feu.
    * l'aura de bois est convertie en aura feu.
Si la zone chevauche une zone d'élément air, 
    * toutes les entités présentent dans une des deux auras recoivent des dégats égal au deux rayons aditionnées, l'état brulé et deux token feu
    * les deux auras sont détruites.
onTurn: 
 * Toutes les entités à l'intérieur de l'aura recoivent un token de feu.
 * Le rayon de l'aura est réduit de 1m

**Cost**:

**Effect**:
