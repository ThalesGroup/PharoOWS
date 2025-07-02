# Security Policy


## Overview

This section outlines all security measures and policies applied to this
repository, helping contributors responsibly manage and report security issues.


## Good Practices to Follow

:warning: Never commit credentials or sensitive information to source code or
          configuration files in this repository.

To enforce this:
- Use tools like `git-secrets` as a Git pre-commit hook to block accidental
  pushes of sensitive data.
- Regularly scan your codebase using secret detection tools to catch anything
  that may have slipped through.
- Store secrets using environment variables in CI/CD pipelines (e.g., GitHub
  Secrets), and use secret managers in production environments.


## Reporting a Vulnerability

If you discover a vulnerability, please report it to the maintainer of the
project.

When reporting:
- Include a detailed description of the issue.
- You’ll receive a confirmation of receipt, followed by updates as the issue is
  reviewed.
- We’ll let you know whether the vulnerability is accepted, requires more
  information, or is declined.


## Disclosure Policy

To safely disclose a security issue:
- Do not open a public GitHub issue.
- Email your report directly to the maintainer of the project.
- Include steps to reproduce and any relevant logs or code snippets.
- We’ll handle your report confidentially and work with you to resolve the
  issue appropriately.


## Security Update Policy

When a new vulnerability is confirmed:
- We will notify users via repository release notes or advisories.
- Fixes will be published to the main branch as soon as possible.
- If needed, we may contact known users directly when a severe vulnerability is
  found.


## Security-Related Configuration

When deploying or integrating this project, consider the following to strengthen security:
- Enforce HTTPS in all services interacting with the system.
- Apply proper authentication and authorization controls.
- Sanitize and validate all external inputs.
- Ensure your CI/CD and runtime environments follow best practices (e.g., use
  of trusted runners, limited permissions, etc.).
