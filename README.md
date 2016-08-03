# Centos 7 with WHM/cPanel

cPanel is one of the most recognized hosting management tools in the world and it delivers the most complete functionality combined with unparalleled localization.
MIRhosting is now pleased to offer our unique and innovative cPanel image for everybody's evaluation and experiments. Our cPanel docker can now be deployed with one click within our cloud platform. If you will decide to use MIRhsoting's cloud platform your license will be activated instantly and you will be billed hourly for the actual consumption. If you need a license only for one hour, we can easily provision that and bill you exactly for one hour!
MIRhosting based cPanel is simple and cost effective:

    Hourly billing for what was actually consumed
    Real time resource scalability (without limitations)
    Fully redundant infrastructure (99,95% uptime)
    24x7x365 technical support
    Full and unlimited backups of all data deployed on our cloud

As an extra incentive for all Github and Dockerhub visitors to try cPanel on our cloud please claim your 5 EUR one time activation credit! Activate now - https://mir.host/dockerhub

Please consult a short video to get a better understanding! - https://www.youtube.com/watch?v=oR2OaP5rX44

# IMPORTANT NOTE
Since we are using "automated build" to build docker container in Docker Hub and currently it is not properly working with systemd and d-bus, its advised to run
 /scripts/upcp --force
directly after you deploy your docker container to install all missing software.
