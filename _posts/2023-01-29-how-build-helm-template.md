---
title: "How to build a Helm template"
categories:
  - Helm
  - Kubernetes
# classes: wide
toc: true
header:
  teaser: ../assets/images/ross-joyner-TX6dBiMwBV0-unsplash_640x360.jpg
  overlay_image: ../assets/images/ross-joyner-TX6dBiMwBV0-unsplash_1920x1080.jpg
  overlay_filter: 0.5
  show_overlay_excerpt: false
review: 0
excerpt: "Helm templates are text files that Helm combines with a set of values to produce Kubernetes manifest files.

They are written in the Go template language, with some additional functions provided by Helm. The templates can be combined with a file (usually named `values.yaml`) which contains configuration values that are substituted into the template at runtime to generate the final Kubernetes manifest."
---

# What are Helm Templates?

Helm templates are text files that Helm combines with a set of values to produce Kubernetes manifest files.

They are written in the Go template language, with some additional functions provided by Helm. The templates can be combined with a file (usually named `values.yaml`) which contains configuration values that are substituted into the template at runtime to generate the final Kubernetes manifest.

The templating system allows you to parameterize your applications and make them highly configurable, so instead of manually creating each manifest for each environment, you can create a set of templates and then substitute the values based on your current environment or requirements. This provides a lot of flexibility and scalability when deploying applications on Kubernetes.

Here's an example template from a Helm chart's `service.yaml`:
{% raw %}
```yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ include "mychart.fullname" . }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    app.kubernetes.io/name: {{ include "mychart.name" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
```

In this example, Helm will substitute `{{ include "mychart.fullname" . }}` with the full name of the release, `{{ .Values.service.type }}` with the type of service, `{{ .Values.service.port }}` with the port number, and so forth. These values are typically defined in the `values.yaml` file, or they can be overridden at the command line when the chart is installed.
{% endraw %}
# How to use the same template for different environments?

Helm's `values.yaml` file is typically used to manage configurations for different environments (like development, staging, and production). It allows you to specify default configuration values, which can be overridden by individual environment files.

Here's an example of how you could structure a Helm chart for multiple environments:

## Create a values file for each environment

Besides the default `values.yaml` file, create a separate values file for each of your environments. For example:

- `values.yaml` (default values)
- `values.dev.yaml` (development-specific values)
- `values.staging.yaml` (staging-specific values)
- `values.prod.yaml` (production-specific values)

## Specify environment-specific values in each file

You might have a `replicaCount` in your `values.yaml` that looks like:

```yaml
# values.yaml
replicaCount: 1
```
In values.dev.yaml, values.staging.yaml, and values.prod.yaml, you could override replicaCount for each environment:

```yaml
# values.dev.yaml
replicaCount: 1
```
```yaml
# values.staging.yaml
replicaCount: 2
```
```yaml
# values.prod.yaml
replicaCount: 4
```
This way, you'll have one replica in the development environment, two in staging, and four in production.

## Deploy the Helm chart for a specific environment

When you're ready to deploy, use the `-f` flag to specify the environment-specific values file:

```bash
# Deploy to the development environment
helm install my-chart . -f values.dev.yaml

# Deploy to the staging environment
helm install my-chart . -f values.staging.yaml

# Deploy to the production environment
helm install my-chart . -f values.prod.yaml
```

Helm will use the values from the environment-specific file, falling back to the defaults in `values.yaml` for any values that aren't specified in the environment-specific file.

This is just one way to handle multiple environments with Helm. Depending on your requirements and how complex your deployments are, you may want to manage environments differently. But in general, the pattern is the same: provide a set of default values, then override those defaults for specific environments.