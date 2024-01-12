---
title: OIDC Everywhere, or at least in CICD
theme: gaia
style: |
  section {
    color: #000;
    background-color: #ccc;
  }
  img[alt="Ted Hahn"] { height: 100px; }
  img[alt="Mark Hahn"] { height: 100px; }
  img[alt="TCB Logo"] { height: 66px; }
  img[alt="Qualys Logo"] { height: 66px; }
  img[alt="Session Feedback"] { height: 150px; }
  img[alt="Certificate Authorities"] { height: 470px; }
  img[alt="Limiting Trust Scope"] { height: 425px; }
  img { height: 490px; }
  /*
  * @theme foobar
  * @auto-scaling true
  */

---
# OIDC and CICD: Why Your CI Pipeline Is Your Greatest Security Threat

<!-- https://www.usenix.org/conference/srecon24americas/presentation/hahn -->

![Ted Hahn](https://www.tcbtech.com/wp-content/uploads/2020/11/ted.jpg) Ted Hahn, ![TCB Logo](images/TCB_Logo_Full.png)
thahn@tcbtech.com

<!-- Ted Hahn is an SRE for hire working on planet-scale distributed systems. His clients include Epic Games and startups in Seattle and New York. -->

![Mark Hahn](https://www.tcbtech.com/wp-content/uploads/2020/11/mark.jpg) Mark Hahn, ![Qualys Logo](images/Qualys_Logo_Full.png)
mhahn@qualys.com

<!-- Mark Hahn is a Security Solutions Architect for Cloud and Containers at Qualys. He works on securing cloud native environments for the most demanding customers worldwide. -->

## [tcbtech.com/oidc-cicd](https://tcbtech.com/oidc-cicd)

<!-- Project repo: https://github.com/tcbtechnologies/odic-cicd/ -->

<!-- We are father son team that put this idea and demonstration together. -->

---
<style scoped>
{
  font-size: 150%;
}
</style>
# Configuring your CI correctly is vital 

- Outline:
  - History of credentials
  - Why using long lived tokens is insecure
  - Examples of what can go wrong
- How to use OIDC
  - Create the roles in your infra (AWS, Kube Clusters)
  - Setup pipelines to use OIDC
  - Section off priviledges into roles attached to branches
- Examples using OIDC:
  - Create OIDC Providers permissions in AWS (also GCP and Azure, if there is time)
  - Configure GitHub (And CircleCI, Gitlab)
  - Run a pipeline and see identity (and changing by pipeline stage)

---
# History of Credentials

- Manually entered for builds that ran by hand
- SAML / SAML-Like
- Access tokens
- OAuth2
- OIDC

---
# Why long lived credentails are insecure

Well, duh!
- No rotation
- Coarse grained access
- Poor attribution to the user initiating an action

---
# What can go wrong

Read this and update
https://circleci.com/blog/jan-4-2023-incident-report/

---
# How to use OIDC

Three Simple Steps:
-  Create Roles in your Cloud
-  Setup pipelines to use OIDC
-  Section off priviledges into roles attached to branches

---
# Create the roles in your infra (AWS, Kube Clusters)
Create roles that provide the access you need
Setup the policys/permissions that to the least priviledges necessary

---
# Setup pipelines to use OIDC

Create the OIDC token in your pipeline
Using the pipeline syntax for your provider 
(they just create them)

---
# Section off priviledges into roles attached to branches

Setup the roles or service accounts 
Attach them to the proper policies and permissions

---
# Example

- Push docker container to ECR




What the permissions you want to give to each branch.

Do a docker push

Fire up an EC2 Instance

This role can only be assumed on master

Here is a pipeline that will only run on master. 
And running it as stage will fail. 

Credentials can still be leaked, but they only last an hour.
- It's also easier to sub-divide so that testing and master workflows are separate.


GitHub creds -> AWS creds -> Kube Credentials



# whoa

OIDC token is a claim
 - Metadata
 - Claims
 - Signature (PKI, using a well known url for the public key)
GitLab is the Provider
GitLab give you a JWT with claims
    I am git lab and here is the dets
	The token is short lived

You pass that JWT to AWS
AWS then verifies with GitLab that the Token is valid
And converts the claims from GitLab into something AWS understands
That "something AWS understands" is an AWS role
That role then links to a policy, providing the permissions (bog standard AWS stuff here)




