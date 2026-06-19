# Demo Client App

This example represents the repository that would be created from `templates/app-repo`.

## Flow

1. Developers commit application code.
2. CI runs tests and security scans.
3. CI builds an image tagged with commit SHA.
4. CI pushes the image to the Gitea registry on `main`.
5. CI uploads scan reports and optionally imports them into DefectDojo.

Use `templates/app-repo` as the copy source.
