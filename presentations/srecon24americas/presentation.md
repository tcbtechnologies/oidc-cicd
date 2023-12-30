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
---
# OIDC Everywhere, or at least in CICD

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
# Configuring your CI correctly is vital 

- Outline:
  - History of credentials
  - Why using long lived tokens is insecure
  - Examples of what can go wrong
  - Jan 2023 Circle CI breach (and how OIDC helps)
- Examples using OIDC:
  - Create OIDC Providers permissions in AWS (also GCP and Azure, if there is time)
  - Configure GitHub (And CircleCI, Gitlab)
  - Run a pipeline and see identity (and changing by pipeline stage)
