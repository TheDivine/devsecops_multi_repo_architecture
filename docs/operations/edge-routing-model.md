# Edge Routing Model

## Purpose

Document the standard edge-routing assumption used by this blueprint.

## Default Router

Traefik is the default edge router for both Docker Compose based deployments and Kubernetes based deployments.

## Docker Compose Pattern

Docker Compose deployments use Traefik labels on services and attach workloads to an externally managed Traefik network.

Real domains, certificate resolver names, and routing middleware belong in private deployment repositories.

## Kubernetes Pattern

Kubernetes deployments use Traefik `IngressRoute` resources when the cluster has Traefik CRDs installed.

If a project uses a different ingress controller, the deployment repository should replace the Traefik-specific template with a standard Kubernetes `Ingress` or the controller-specific resource.

## Ownership

The platform repository owns the shared Traefik installation and cluster-level routing standards.

The deployment repository owns application-specific routes, overlays, and promotion history.

The application repository documents required ports and probes but does not own production edge routing.
