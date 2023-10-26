# Product Ownership and Understanding existing Codebase
Ideally when a DevOps Engineer is Onboarded they would either
Setup a DevOps Ecosystem from scratch
Support a DevOps Platform for a product under development
Gain Ownership of a DevOps Platform and the products under it

This document concerns with 3, 
Ideally 2 and 3 can be combined since a product under development would face additional development of the devops platform

If I were to gain ownership of a product these are the things that I would use to get a better understanding of the product and also the ecosystem that supports it

Gain access to the tools that are at play that makes the platform work, tools being
Version control like Github, Gitlab
Deployment Pipelines - Jenkins, Gitlab CI, Helm charts

Understand any unknown tools and the architecture of the Product
Understand the branching strategy if it concerns with DevOps or Deployment
Understand the Release and Deployment Process

Read any Documentation, Write a draft of documentation based on your understanding if possible
Identify any In-house components and libraries that are being used within the project
Identify any parallel codebase that could be used along with the project, like configuration hives for project, environment or secrets. 

Understand the people
Pair with a seasoned Developer and ask them to explain the codebase and deployment process.
Take notes of any lingo that might be common to them, and ask them if its anything specifc to inhouse components, research online otherwise.
Identify and keep track of the owners of any codebase and see how it interacts with other components.
If anything were to go wrong, these should be the first people that you can reach out to regarding the failures.

