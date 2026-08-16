# Antigravity Rules for this Repository

These rules apply to all agent interactions within this repository.

## System Settings
- **Read-Only**: You may read system settings if required, but you must **never** write, install, or edit any existing system settings on the current machine.
- **Provide Commands**: If commands need to be run to install or modify settings, provide them as a summary at the end of the conversation. The user will run them or choose to run them as they see fit.

## Git Operations
- **No Commits/Pushes**: **Never** commit code or push to remote repositories unless explicitly asked by the user.
- **Staging**: You are allowed to stage files (`git add`) and prepare commit messages, but do not execute the commit.

## Testing
- **No Local Testing**: This repository is **never** tested on the current machine.
- **VM Testing**: The user will always test the code on a separate Virtual Machine (VM). Do not attempt to run tests locally unless explicitly instructed.
