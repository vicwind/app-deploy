app-deploy
==========

a simple framework to help deploy different apps on the same server easier

Directory structure for the deploy user <app-deploy>

build pkg structure:
```
<app-deploy-user>/pkgs/<pkg_names>/<pkg versions>
```

application directory structure:

```
<app-deploy-user>/apps/<app_names>/<pkg_names>/current #linked to latest version
<app-deploy-user>/apps/<app_names>/<pkg_names>/<pkg version>
```
