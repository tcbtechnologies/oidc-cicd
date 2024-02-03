# Overivew
Draft of article for ;login

# Title

OIDC and CICD: Improving Security in your Build Pipelines

# Body

DevOps, SRE and Platform Engineering teams are tasked with using
automation to build infrastructure and deploy applications that are
critical to an organization's operations. To do so these teams build
CICD (Continuous Integration / Continuous Deployment) automation
pipelines. For these pipelines to function they need access to
credentials to key environments, like staging and production. These
credentials are often long lived. This is
better than depending on manual deployments but it can leave the CICD
system open to abuse.

The OICD specification provides a better route to providing sensitive
access to CICD pipelines. OIDC tokens are allocated per pipeline stage
so their lifetimes can be short-lived.This shortens windows of
opportunity. You can also assign permissions to specific branches,
allowing you to grant more permissions to protected branches.




